package com.ruoyi.web.controller.business;

import java.util.Arrays;
import java.util.List;

import com.ruoyi.business.domain.*;
import com.ruoyi.business.service.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 歌曲Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/song")
public class SongController extends BaseController
{
    @Autowired
    private ISongService songService;

    @Autowired
    private ISongSingerService songSingerService;

    @Autowired
    private ISongSonglistService songSonglistService;

    @Autowired
    private ISongSongtypeService songSongtypeService;

    /**
     * 获取原创歌曲
     * @return
     */
    @GetMapping("/getOriginalSong")
    public List<Song> getOriginalSong(){
        return songService.getOriginalSong();
    }

    /**
     * 获取新歌曲
     * @return
     */
    @GetMapping("/getNewSong")
    public List<Song> getNewSong(){
        return songService.getNewSong();
    }

    /**
     * 获取飙升歌曲
     * @return
     */
    @GetMapping("/getRiseSong")
    public List<Song> getRiseSong(){
         return songService.getRiseSong();
    }

    /**
     * 查询歌曲列表
     */
    @PreAuthorize("@ss.hasPermi('business:song:list')")
    @GetMapping("/list")
    public TableDataInfo list(Song song)
    {
        startPage();
        List<Song> list = songService.selectSongList(song);
        return getDataTable(list);
    }

    /**
     * 导出歌曲列表
     */
    @PreAuthorize("@ss.hasPermi('business:song:export')")
    @Log(title = "歌曲", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Song song)
    {
        List<Song> list = songService.selectSongList(song);
        ExcelUtil<Song> util = new ExcelUtil<Song>(Song.class);
        return util.exportExcel(list, "song");
    }

    @GetMapping("/selectSinger/android")
    public List<Singer> selectSinger(Long songId) {
        return songService.selectSinger(songId);
    }

    @GetMapping("/selectSongKey/android")
    public List<Song> selectSongKey(String wordKey){
        List<Song> list = songService.selectSongKey(wordKey);
        return list;
    }

    @GetMapping("/selectAll/android")
    public List<Song> selectAll(Long slId) {
        return songService.selectAll(slId);
    }

    /**
     * 获取歌曲详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:song:query')")
    @GetMapping(value = "/{songId}")
    public AjaxResult getInfo(@PathVariable("songId") Long songId)
    {
        Song song = songService.selectSongById(songId);
        List<Singer> singerList = song.getSingerList();
        Long[] sinIds = new Long[singerList.size()];
        for(int i = 0;i < singerList.size();i++) {
            sinIds[i] = singerList.get(i).getSinId();
        }
        List<SongType> songTypeList = song.getSongTypeList();
        Long[] stIds = new Long[songTypeList.size()];
        for(int i = 0;i < songTypeList.size();i++) {
            stIds[i] = songTypeList.get(i).getStId();
        }
        song.setSinIds(sinIds);
        song.setStIds(stIds);
        return AjaxResult.success(song);
    }

    /**
     * 新增歌曲
     */
    @PreAuthorize("@ss.hasPermi('business:song:add')")
    @Log(title = "歌曲", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Song song)
    {
        int count = songService.insertSong(song);
        if(count!=0) {
            String[] ids = song.getWitPreUrl().split(",");
            for(int i = 0;i < ids.length;i++){
                SongSinger songSinger = new SongSinger();
                songSinger.setSongId(song.getSongId());
                songSinger.setSinId(Long.parseLong(ids[i]));
                songSingerService.insertSongSinger(songSinger);
            }
            SongSonglist songSonglist = new SongSonglist();
            songSonglist.setSlId(song.getSlId());
            songSonglist.setSongId(song.getSongId());
            songSonglist.setIsAlbum(1);
            songSonglistService.insertSongSonglist(songSonglist);
            //添加歌曲类型数据
            for(Long stId:song.getStIds()){
                SongSongtype songSongtype = new SongSongtype();
                songSongtype.setSongId(song.getSongId());
                songSongtype.setStId(stId);
                songSongtypeService.insertSongSongtype(songSongtype);
            }
        }
        return toAjax(count);
    }

    /**
     * 修改歌曲
     */
    @PreAuthorize("@ss.hasPermi('business:song:edit')")
    @Log(title = "歌曲", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Song song)
    {
        int count = songService.updateSong(song);
        if(count!=0) {
            //添加歌手数据
            for(int i = 0;i < song.getSinIds().length;i++){
                SongSinger songSinger = new SongSinger();
                songSinger.setSongId(song.getSongId());
                songSinger.setSinId(song.getSinIds()[i]);
                songSingerService.deleteIdSlId(songSinger);
                songSingerService.insertSongSinger(songSinger);
            }
            //添加歌单数据
            SongSonglist songSonglist = new SongSonglist();
            songSonglist.setSlId(song.getSlId());
            songSonglist.setSongId(song.getSongId());
            songSonglist.setIsAlbum(1);
            songSonglistService.deleteSlIdSongId(songSonglist);
            songSonglistService.insertSongSonglist(songSonglist);
            //添加歌曲类型数据
            for(Long stId:song.getStIds()){
                SongSongtype songSongtype = new SongSongtype();
                songSongtype.setSongId(song.getSongId());
                songSongtype.setStId(stId);
                songSongtypeService.deleteSongIdStId(songSongtype);
                songSongtypeService.insertSongSongtype(songSongtype);
            }
        }
        return toAjax(count);
    }

    /**
     * 删除歌曲
     */
    @PreAuthorize("@ss.hasPermi('business:song:remove')")
    @Log(title = "歌曲", businessType = BusinessType.DELETE)
	@DeleteMapping("/{songIds}")
    public AjaxResult remove(@PathVariable Long[] songIds)
    {
        return toAjax(songService.deleteSongByIds(songIds));
    }
}
