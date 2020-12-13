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
import com.ruoyi.business.domain.SpecialFun;
import com.ruoyi.business.service.ISpecialFunService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 个性功能Controller
 * 
 * @author zhouriyue
 * @date 2020-12-11
 */
@RestController
@RequestMapping("/business/fun")
public class SpecialFunController extends BaseController
{
    @Autowired
    private ISpecialFunService specialFunService;

    /**
     * 查询个性功能列表
     */
    @PreAuthorize("@ss.hasPermi('business:fun:list')")
    @GetMapping("/list")
    public TableDataInfo list(SpecialFun specialFun)
    {
        startPage();
        List<SpecialFun> list = specialFunService.selectSpecialFunList(specialFun);
        return getDataTable(list);
    }

    /**
     * 导出个性功能列表
     */
    @PreAuthorize("@ss.hasPermi('business:fun:export')")
    @Log(title = "个性功能", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SpecialFun specialFun)
    {
        List<SpecialFun> list = specialFunService.selectSpecialFunList(specialFun);
        ExcelUtil<SpecialFun> util = new ExcelUtil<SpecialFun>(SpecialFun.class);
        return util.exportExcel(list, "fun");
    }

    /**
     * 获取个性功能详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:fun:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(specialFunService.selectSpecialFunById(id));
    }

    /**
     * 新增个性功能
     */
    @PreAuthorize("@ss.hasPermi('business:fun:add')")
    @Log(title = "个性功能", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SpecialFun specialFun)
    {
        return toAjax(specialFunService.insertSpecialFun(specialFun));
    }

    /**
     * 修改个性功能
     */
    @PreAuthorize("@ss.hasPermi('business:fun:edit')")
    @Log(title = "个性功能", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SpecialFun specialFun)
    {
        return toAjax(specialFunService.updateSpecialFun(specialFun));
    }

    /**
     * 删除个性功能
     */
    @PreAuthorize("@ss.hasPermi('business:fun:remove')")
    @Log(title = "个性功能", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(specialFunService.deleteSpecialFunByIds(ids));
    }
}
