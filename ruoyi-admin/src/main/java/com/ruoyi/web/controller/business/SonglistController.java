package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Songlist;
import com.ruoyi.business.service.ISonglistService;
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
    @PreAuthorize("@ss.hasPermi('business:songlist:list')")
    @GetMapping("/list")
    public TableDataInfo list(Songlist songlist)
    {
        startPage();
        List<Songlist> list = songlistService.selectSonglistList(songlist);
        return getDataTable(list);
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
        return toAjax(songlistService.insertSonglist(songlist));
    }

    /**
     * 修改歌单
     */
    @PreAuthorize("@ss.hasPermi('business:songlist:edit')")
    @Log(title = "歌单", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Songlist songlist)
    {
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
