package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.service.ISongService;
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

    /**
     * 获取歌曲详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:song:query')")
    @GetMapping(value = "/{songId}")
    public AjaxResult getInfo(@PathVariable("songId") Long songId)
    {
        return AjaxResult.success(songService.selectSongById(songId));
    }

    /**
     * 新增歌曲
     */
    @PreAuthorize("@ss.hasPermi('business:song:add')")
    @Log(title = "歌曲", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Song song)
    {
        return toAjax(songService.insertSong(song));
    }

    /**
     * 修改歌曲
     */
    @PreAuthorize("@ss.hasPermi('business:song:edit')")
    @Log(title = "歌曲", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Song song)
    {
        return toAjax(songService.updateSong(song));
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
