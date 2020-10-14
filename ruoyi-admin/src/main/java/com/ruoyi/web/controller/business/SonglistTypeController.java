package com.ruoyi.web.controller.business;

import java.util.List;
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
import com.ruoyi.business.domain.SonglistType;
import com.ruoyi.business.service.ISonglistTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 歌单类型管理Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/songlisttype")
public class SonglistTypeController extends BaseController
{
    @Autowired
    private ISonglistTypeService songlistTypeService;

    /**
     * 查询歌单类型管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:list')")
    @GetMapping("/list")
    public TableDataInfo list(SonglistType songlistType)
    {
        startPage();
        List<SonglistType> list = songlistTypeService.selectSonglistTypeList(songlistType);
        return getDataTable(list);
    }

    /**
     * 导出歌单类型管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:export')")
    @Log(title = "歌单类型管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SonglistType songlistType)
    {
        List<SonglistType> list = songlistTypeService.selectSonglistTypeList(songlistType);
        ExcelUtil<SonglistType> util = new ExcelUtil<SonglistType>(SonglistType.class);
        return util.exportExcel(list, "songlisttype");
    }

    /**
     * 获取歌单类型管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:query')")
    @GetMapping(value = "/{sltId}")
    public AjaxResult getInfo(@PathVariable("sltId") Long sltId)
    {
        return AjaxResult.success(songlistTypeService.selectSonglistTypeById(sltId));
    }

    /**
     * 新增歌单类型管理
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:add')")
    @Log(title = "歌单类型管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SonglistType songlistType)
    {
        return toAjax(songlistTypeService.insertSonglistType(songlistType));
    }

    /**
     * 修改歌单类型管理
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:edit')")
    @Log(title = "歌单类型管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SonglistType songlistType)
    {
        return toAjax(songlistTypeService.updateSonglistType(songlistType));
    }

    /**
     * 删除歌单类型管理
     */
    @PreAuthorize("@ss.hasPermi('business:songlisttype:remove')")
    @Log(title = "歌单类型管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sltIds}")
    public AjaxResult remove(@PathVariable Long[] sltIds)
    {
        return toAjax(songlistTypeService.deleteSonglistTypeByIds(sltIds));
    }
}
