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
import com.ruoyi.business.domain.Payments;
import com.ruoyi.business.service.IPaymentsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 支付管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-28
 */
@RestController
@RequestMapping("/business/payments")
public class PaymentsController extends BaseController
{
    @Autowired
    private IPaymentsService paymentsService;

    /**
     * 查询支付管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:payments:list')")
    @GetMapping("/list")
    public TableDataInfo list(Payments payments)
    {
        startPage();
        List<Payments> list = paymentsService.selectPaymentsList(payments);
        return getDataTable(list);
    }

    /**
     * 导出支付管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:payments:export')")
    @Log(title = "支付管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Payments payments)
    {
        List<Payments> list = paymentsService.selectPaymentsList(payments);
        ExcelUtil<Payments> util = new ExcelUtil<Payments>(Payments.class);
        return util.exportExcel(list, "payments");
    }

    /**
     * 获取支付管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:payments:query')")
    @GetMapping(value = "/{paId}")
    public AjaxResult getInfo(@PathVariable("paId") Long paId)
    {
        return AjaxResult.success(paymentsService.selectPaymentsById(paId));
    }

    /**
     * 新增支付管理
     */
    @PreAuthorize("@ss.hasPermi('business:payments:add')")
    @Log(title = "支付管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Payments payments)
    {
        return toAjax(paymentsService.insertPayments(payments));
    }

    /**
     * 修改支付管理
     */
    @PreAuthorize("@ss.hasPermi('business:payments:edit')")
    @Log(title = "支付管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Payments payments)
    {
        return toAjax(paymentsService.updatePayments(payments));
    }

    /**
     * 删除支付管理
     */
    @PreAuthorize("@ss.hasPermi('business:payments:remove')")
    @Log(title = "支付管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{paIds}")
    public AjaxResult remove(@PathVariable Long[] paIds)
    {
        return toAjax(paymentsService.deletePaymentsByIds(paIds));
    }
}
