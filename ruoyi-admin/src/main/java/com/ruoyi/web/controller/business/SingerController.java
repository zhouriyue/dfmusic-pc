package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.service.ISingerService;
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
 * 歌手信息Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/singer")
public class SingerController extends BaseController
{
    @Autowired
    private ISingerService singerService;

    /**
     * 查询歌手信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:singer:list')")
    @GetMapping("/list")
    public TableDataInfo list(Singer singer)
    {
        startPage();
        List<Singer> list = singerService.selectSingerList(singer);
        return getDataTable(list);
    }

    /**
     * 导出歌手信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:singer:export')")
    @Log(title = "歌手信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Singer singer)
    {
        List<Singer> list = singerService.selectSingerList(singer);
        ExcelUtil<Singer> util = new ExcelUtil<Singer>(Singer.class);
        return util.exportExcel(list, "singer");
    }

    /**
     * 获取歌手信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:query')")
    @GetMapping(value = "/{sinId}")
    public AjaxResult getInfo(@PathVariable("sinId") Long sinId)
    {
        return AjaxResult.success(singerService.selectSingerById(sinId));
    }

    /**
     * 新增歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:add')")
    @Log(title = "歌手信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Singer singer)
    {
        return toAjax(singerService.insertSinger(singer));
    }

    /**
     * 修改歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:edit')")
    @Log(title = "歌手信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Singer singer)
    {
        return toAjax(singerService.updateSinger(singer));
    }

    /**
     * 删除歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:remove')")
    @Log(title = "歌手信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sinIds}")
    public AjaxResult remove(@PathVariable Long[] sinIds)
    {
        return toAjax(singerService.deleteSingerByIds(sinIds));
    }
}
