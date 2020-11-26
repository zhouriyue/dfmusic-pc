package com.ruoyi.web.controller.business;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.domain.Songlist;
import com.ruoyi.business.domain.vo.SonglistdetailVo;
import com.ruoyi.business.service.ISonglistService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 歌单Controller
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/songlist")
public class SonglistController extends BaseController
{
    @Autowired
    private ISonglistService songlistService;

    /**
     * 查询歌单列表
     */
    @GetMapping("/searchSonglistKey")
    public TableDataInfo searchSonglistKey(Songlist songlist)
    {
        System.out.println(songlist.toString());
        List<Songlist> list = songlistService.selectSonglistList(songlist);
        return getDataTable(list);
    }

    @PostMapping("/addSongToSl")
    public AjaxResult addSongToSl(@RequestParam("slId") Long slId,@RequestParam("isAlbum") Integer isAlbum,@RequestParam("songIds[]") Long[] songIds){
        return AjaxResult.success(songlistService.addSongToSl(slId,isAlbum,songIds));
    }

    /**
     * 查询歌单列表
     */
    @GetMapping("/searchSonglist")
    public TableDataInfo searchSonglist(String wordKey, Date createTime,Integer isAlbum)
    {
        startPage();
        List<Songlist> list = songlistService.searchSonglist(wordKey,createTime,isAlbum);
        return getDataTable(list);
    }

    /**
     * 获取歌单的创建用户
     * @return
     */
    @GetMapping("/selectUserSonglist")
    public AjaxResult selectUserSonglist(Long slId){
        startPage();
        return AjaxResult.success(songlistService.selectUserSonglist(slId));
    }

    /**获取歌单详情**/
    @GetMapping("/selectSongDetail")
    public TableDataInfo selectSongDetail(Long slId){
        return getDataTable(songlistService.selectSongDetail(slId));
    }

    /**
     * 查询歌单列表
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:list')")
    @GetMapping("/list")
    public TableDataInfo list(Songlist songlist)
    {
        startPage();
        List<Songlist> list = songlistService.selectSonglistList(songlist);
        return getDataTable(list);
    }

    @DeleteMapping("/deleteSonglistSong/android")
    public long deleteSonglistSong(Long slId,Long songId) {
        return songlistService.deleteSonglistSong(slId,songId);
    }

    /**
     * 查询歌单详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:list')")
    @GetMapping("/getSonglistDetail")
    public TableDataInfo getSonglistDetail(Songlist songlist)
    {
        startPage();
        List<SonglistdetailVo> list = songlistService.getSonglistDetail(songlist);
        return getDataTable(list);
    }

    /** 移动端 删除歌单**/
    @GetMapping("/open/deleteSonglist")
    public int deleteSonglist(Long slId){
        songlistService.deleteSonglistById(slId);
        songlistService.deleteSonglisSong(slId);
        return 1;
    }

    /**
     * 获取用户歌单接口
     * @param songlist
     * @return
     */
    @GetMapping("/getUserSonglist/android")
    public List<Songlist> getUserSonglist(Songlist songlist){
        List<Songlist> list = songlistService.selectSonglistList(songlist);
        return list;
    }

    /**
     * 添加歌曲到歌单
     * @param slId
     * @param songId
     */
    @PostMapping("/addToSonglist/android")
    public int addToSonglist(Long slId,Long songId){
        if(songlistService.selectSonglistSong(slId,songId)==null){
            int status = songlistService.addToSonglist(slId,songId);
            if(status!=0) status = 1;
            else status = -1;
            return status;
        } else {
            return 0;
        }
    }

    /**
     * 获取歌单歌曲
     * @param slId
     * @return
     */
    @GetMapping("/getSLSong/android")
    public List<Song> getSonglistSong(Long slId){
        List<Song> list = songlistService.selectSongList(slId);
        return list;
    }

    @GetMapping("/getIndexSong/android")
    public Song getIndexSong(Integer slId) {
        List<Song> list = songlistService.getIndexSong(slId);
        if(list.size()>0) {
            return list.get(0);
        } else {
            return null;
        }
    }

    /**
     * 创建歌单
     * @return
     */
    @PostMapping("/add/android")
    public int addSL(Long createById,String slName,Integer isPublic) {
        Songlist songlist = new Songlist();
        songlist.setCreateById(createById);
        songlist.setSlName(slName);
        songlist.setIsPublic(isPublic);
        int id = songlistService.insertSonglist(songlist);
        return id;
    }

    /**
     * 导出歌单列表
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:export')")
    @Log(title = "歌单", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Songlist songlist)
    {
        List<Songlist> list = songlistService.selectSonglistList(songlist);
        ExcelUtil<Songlist> util = new ExcelUtil<Songlist>(Songlist.class);
        return util.exportExcel(list, "songlist");
    }

    /**
     * 获取歌单详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:query')")
    @GetMapping(value = "/{slId}")
    public AjaxResult getInfo(@PathVariable("slId") Long slId)
    {
        return AjaxResult.success(songlistService.selectSonglistById(slId));
    }

    /**
     * 新增歌单
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:add')")
    @Log(title = "歌单", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Songlist songlist)
    {
        int count = songlistService.insertSonglist(songlist);
        return toAjax(count,songlist.getSlId());
    }

    /**
     * 修改歌单
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:edit')")
    @Log(title = "歌单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Songlist songlist)
    {
        System.out.println(songlist.toString());
        return toAjax(songlistService.updateSonglist(songlist));
    }

    /**
     * 删除歌单
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:remove')")
    @Log(title = "歌单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{slIds}")
    public AjaxResult remove(@PathVariable Long[] slIds)
    {
        return toAjax(songlistService.deleteSonglistByIds(slIds));
    }
}
