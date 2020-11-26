package com.ruoyi.web.controller.business;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.utils.DateUtils;
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
import com.ruoyi.business.domain.TOrder;
import com.ruoyi.business.service.ITOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
@RestController
@RequestMapping("/business/order")
public class TOrderController extends BaseController
{
    @Autowired
    private ITOrderService tOrderService;

    /** 获取总订单 **/
    @GetMapping("/getOrderTotal")
    public AjaxResult getOrderTotal(){
        return AjaxResult.success(tOrderService.getOrderTotal());
    }

    /** 获取某时间段的订单 **/
    @GetMapping("/getScopeOrder")
    public TableDataInfo getScopeOrder(Date startDate, Date endDate, Integer dateType,Integer orderState){
        logger.info(startDate+","+endDate);
        if(dateType==1) {
            return getDataTable(tOrderService.getScopeOrderDay(startDate,endDate,orderState));
        } else {
            String startStr = DateUtils.formatDate(startDate,DateUtils.YYYY_MM);
            String endStr = DateUtils.formatDate(endDate,DateUtils.YYYY_MM);
            if(startStr!=null&&startDate.equals(endStr)) {
                startStr+="-01";
                endStr+="-"+startDate.getDate();
                return getDataTable(tOrderService.getScopeOrderDay(DateUtils.parseDate(startStr),DateUtils.parseDate(endStr),orderState));
            } else {
                return getDataTable(tOrderService.getScopeOrderMonth(startDate,endDate,orderState));
            }
        }
    }

    /**
     * 查询订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(TOrder tOrder)
    {
        startPage();
        List<TOrder> list = tOrderService.selectTOrderList(tOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:order:export')")
    @Log(title = "订单管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TOrder tOrder)
    {
        List<TOrder> list = tOrderService.selectTOrderList(tOrder);
        ExcelUtil<TOrder> util = new ExcelUtil<TOrder>(TOrder.class);
        return util.exportExcel(list, "order");
    }

    /**
     * 获取订单管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:order:query')")
    @GetMapping(value = "/{oId}")
    public AjaxResult getInfo(@PathVariable("oId") Long oId)
    {
        return AjaxResult.success(tOrderService.selectTOrderById(oId));
    }

    /**
     * 新增订单管理
     */
    @PreAuthorize("@ss.hasPermi('business:order:add')")
    @Log(title = "订单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TOrder tOrder)
    {
        return toAjax(tOrderService.insertTOrder(tOrder));
    }

    /**
     * 修改订单管理
     */
    @PreAuthorize("@ss.hasPermi('business:order:edit')")
    @Log(title = "订单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TOrder tOrder)
    {
        return toAjax(tOrderService.updateTOrder(tOrder));
    }

    /**
     * 删除订单管理
     */
    @PreAuthorize("@ss.hasPermi('business:order:remove')")
    @Log(title = "订单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{oIds}")
    public AjaxResult remove(@PathVariable Long[] oIds)
    {
        return toAjax(tOrderService.deleteTOrderByIds(oIds));
    }
}
