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
import com.ruoyi.business.domain.Privilege;
import com.ruoyi.business.service.IPrivilegeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 特权Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/privilege")
public class PrivilegeController extends BaseController
{
    @Autowired
    private IPrivilegeService privilegeService;

    /**
     * 查询特权列表
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:list')")
    @GetMapping("/list")
    public TableDataInfo list(Privilege privilege)
    {
        startPage();
        List<Privilege> list = privilegeService.selectPrivilegeList(privilege);
        return getDataTable(list);
    }

    /**
     * 导出特权列表
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:export')")
    @Log(title = "特权", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Privilege privilege)
    {
        List<Privilege> list = privilegeService.selectPrivilegeList(privilege);
        ExcelUtil<Privilege> util = new ExcelUtil<Privilege>(Privilege.class);
        return util.exportExcel(list, "privilege");
    }

    /**
     * 获取特权详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:query')")
    @GetMapping(value = "/{priId}")
    public AjaxResult getInfo(@PathVariable("priId") Long priId)
    {
        return AjaxResult.success(privilegeService.selectPrivilegeById(priId));
    }

    /**
     * 新增特权
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:add')")
    @Log(title = "特权", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Privilege privilege)
    {
        return toAjax(privilegeService.insertPrivilege(privilege));
    }

    /**
     * 修改特权
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:edit')")
    @Log(title = "特权", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Privilege privilege)
    {
        return toAjax(privilegeService.updatePrivilege(privilege));
    }

    /**
     * 删除特权
     */
    @PreAuthorize("@ss.hasPermi('business:privilege:remove')")
    @Log(title = "特权", businessType = BusinessType.DELETE)
	@DeleteMapping("/{priIds}")
    public AjaxResult remove(@PathVariable Long[] priIds)
    {
        return toAjax(privilegeService.deletePrivilegeByIds(priIds));
    }
}
