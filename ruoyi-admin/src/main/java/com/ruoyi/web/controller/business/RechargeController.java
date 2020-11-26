package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.service.IMemberService;
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
import com.ruoyi.business.domain.Recharge;
import com.ruoyi.business.service.IRechargeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 充值管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
@RestController
@RequestMapping("/business/recharge")
public class RechargeController extends BaseController
{
    @Autowired
    private IRechargeService rechargeService;

    @Autowired
    private IMemberService memberService;

    /**
     * 查询充值管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:list')")
    @GetMapping("/list")
    public TableDataInfo list(Recharge recharge)
    {
        startPage();
        List<Recharge> list = rechargeService.selectRechargeList(recharge);
        return getDataTable(list);
    }

    /**
     * 导出充值管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:export')")
    @Log(title = "充值管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Recharge recharge)
    {
        List<Recharge> list = rechargeService.selectRechargeList(recharge);
        ExcelUtil<Recharge> util = new ExcelUtil<Recharge>(Recharge.class);
        return util.exportExcel(list, "recharge");
    }

    /**
     * 获取充值管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:query')")
    @GetMapping(value = "/{recId}")
    public AjaxResult getInfo(@PathVariable("recId") Long recId)
    {
        return AjaxResult.success(rechargeService.selectRechargeById(recId));
    }

    /**
     * 新增充值管理
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:add')")
    @Log(title = "充值管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Recharge recharge)
    {
        int count = rechargeService.insertRecharge(recharge);
        memberService.recharge(recharge.getmId(),recharge.getRechargeDay());
        return toAjax(count);
    }

    /**
     * 修改充值管理
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:edit')")
    @Log(title = "充值管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Recharge recharge)
    {
        return toAjax(rechargeService.updateRecharge(recharge));
    }

    /**
     * 删除充值管理
     */
    @PreAuthorize("@ss.hasPermi('business:recharge:remove')")
    @Log(title = "充值管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recIds}")
    public AjaxResult remove(@PathVariable Long[] recIds)
    {
        return toAjax(rechargeService.deleteRechargeByIds(recIds));
    }
}
