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
import com.ruoyi.business.domain.SetMeal;
import com.ruoyi.business.service.ISetMealService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 套餐信息管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-01
 */
@RestController
@RequestMapping("/business/set_meal")
public class SetMealController extends BaseController
{
    @Autowired
    private ISetMealService setMealService;

    /**
     * 查询套餐信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:list')")
    @GetMapping("/list")
    public TableDataInfo list(SetMeal setMeal)
    {
        startPage();
        List<SetMeal> list = setMealService.selectSetMealList(setMeal);
        System.out.println("setMeal:"+list.size());
        return getDataTable(list);
    }

    @GetMapping("/selectSetMeal/android")
    public List<SetMeal> selectSetMeal(){
        List<SetMeal> list = setMealService.selectSetMealList(new SetMeal());
        return list;
    }

    /**
     * 导出套餐信息管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:export')")
    @Log(title = "套餐信息管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SetMeal setMeal)
    {
        List<SetMeal> list = setMealService.selectSetMealList(setMeal);
        ExcelUtil<SetMeal> util = new ExcelUtil<SetMeal>(SetMeal.class);
        return util.exportExcel(list, "set_meal");
    }

    /**
     * 获取套餐信息管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:query')")
    @GetMapping(value = "/{smId}")
    public AjaxResult getInfo(@PathVariable("smId") Long smId)
    {
        return AjaxResult.success(setMealService.selectSetMealById(smId));
    }

    /**
     * 新增套餐信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:add')")
    @Log(title = "套餐信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SetMeal setMeal)
    {
        return toAjax(setMealService.insertSetMeal(setMeal));
    }

    /**
     * 修改套餐信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:edit')")
    @Log(title = "套餐信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SetMeal setMeal)
    {
        return toAjax(setMealService.updateSetMeal(setMeal));
    }

    /**
     * 删除套餐信息管理
     */
    @PreAuthorize("@ss.hasPermi('business:set_meal:remove')")
    @Log(title = "套餐信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{smIds}")
    public AjaxResult remove(@PathVariable Long[] smIds)
    {
        return toAjax(setMealService.deleteSetMealByIds(smIds));
    }
}
