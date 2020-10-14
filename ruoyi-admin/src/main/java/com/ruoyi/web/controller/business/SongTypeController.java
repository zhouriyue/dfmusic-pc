package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.SongType;
import com.ruoyi.business.service.ISongTypeService;
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
 * 歌曲类型Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/songtype")
public class SongTypeController extends BaseController
{
    @Autowired
    private ISongTypeService songTypeService;

    /**
     * 查询歌曲类型列表
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:list')")
    @GetMapping("/list")
    public TableDataInfo list(SongType songType)
    {
        startPage();
        List<SongType> list = songTypeService.selectSongTypeList(songType);
        return getDataTable(list);
    }

    /**
     * 导出歌曲类型列表
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:export')")
    @Log(title = "歌曲类型", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SongType songType)
    {
        List<SongType> list = songTypeService.selectSongTypeList(songType);
        ExcelUtil<SongType> util = new ExcelUtil<SongType>(SongType.class);
        return util.exportExcel(list, "songtype");
    }

    /**
     * 获取歌曲类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:query')")
    @GetMapping(value = "/{stId}")
    public AjaxResult getInfo(@PathVariable("stId") Long stId)
    {
        return AjaxResult.success(songTypeService.selectSongTypeById(stId));
    }

    /**
     * 新增歌曲类型
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:add')")
    @Log(title = "歌曲类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SongType songType)
    {
        return toAjax(songTypeService.insertSongType(songType));
    }

    /**
     * 修改歌曲类型
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:edit')")
    @Log(title = "歌曲类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SongType songType)
    {
        return toAjax(songTypeService.updateSongType(songType));
    }

    /**
     * 删除歌曲类型
     */
    @PreAuthorize("@ss.hasPermi('business:songtype:remove')")
    @Log(title = "歌曲类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{stIds}")
    public AjaxResult remove(@PathVariable Long[] stIds)
    {
        return toAjax(songTypeService.deleteSongTypeByIds(stIds));
    }
}
