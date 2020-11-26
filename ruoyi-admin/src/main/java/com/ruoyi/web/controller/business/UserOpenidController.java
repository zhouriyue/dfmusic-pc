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
import com.ruoyi.business.domain.UserOpenid;
import com.ruoyi.business.service.IUserOpenidService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 一键登录关联Controller
 * 
 * @author ruoyi
 * @date 2020-11-05
 */
@RestController
@RequestMapping("/business/openid")
public class UserOpenidController extends BaseController
{
    @Autowired
    private IUserOpenidService userOpenidService;

    @GetMapping("/findByOpenId/android")
    public UserOpenid findByOpenId(String openid){
        System.out.println(openid);
        UserOpenid userOpenid = userOpenidService.findByOpenId(openid);
        if(userOpenid==null) userOpenid = new UserOpenid();
        return userOpenid;
    }

    /**
     * 查询一键登录关联列表
     */
    @PreAuthorize("@ss.hasPermi('business:openid:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserOpenid userOpenid)
    {
        startPage();
        List<UserOpenid> list = userOpenidService.selectUserOpenidList(userOpenid);
        return getDataTable(list);
    }

    /**
     * 导出一键登录关联列表
     */
    @PreAuthorize("@ss.hasPermi('business:openid:export')")
    @Log(title = "一键登录关联", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(UserOpenid userOpenid)
    {
        List<UserOpenid> list = userOpenidService.selectUserOpenidList(userOpenid);
        ExcelUtil<UserOpenid> util = new ExcelUtil<UserOpenid>(UserOpenid.class);
        return util.exportExcel(list, "openid");
    }

    /**
     * 获取一键登录关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:openid:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(userOpenidService.selectUserOpenidById(id));
    }

    /**
     * 新增一键登录关联
     */
    @PreAuthorize("@ss.hasPermi('business:openid:add')")
    @Log(title = "一键登录关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserOpenid userOpenid)
    {
        return toAjax(userOpenidService.insertUserOpenid(userOpenid));
    }

    /**
     * 修改一键登录关联
     */
    @PreAuthorize("@ss.hasPermi('business:openid:edit')")
    @Log(title = "一键登录关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserOpenid userOpenid)
    {
        return toAjax(userOpenidService.updateUserOpenid(userOpenid));
    }

    /**
     * 删除一键登录关联
     */
    @PreAuthorize("@ss.hasPermi('business:openid:remove')")
    @Log(title = "一键登录关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userOpenidService.deleteUserOpenidByIds(ids));
    }
}
