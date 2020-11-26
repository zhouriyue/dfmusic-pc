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
import com.ruoyi.business.domain.AppLoginInfo;
import com.ruoyi.business.service.IAppLoginInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 登录信息Controller
 * 
 * @author ruoyi
 * @date 2020-11-17
 */
@RestController
@RequestMapping("/business/app_login_info")
public class AppLoginInfoController extends BaseController
{
    @Autowired
    private IAppLoginInfoService appLoginInfoService;

    /** 获取app今天活动量**/
    @GetMapping("/getTodayActivityNumber")
    public AjaxResult getTodayActivityNumber(){
        return AjaxResult.success(appLoginInfoService.getTodayActivityNumber());
    }

    /**
     * 查询登录信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppLoginInfo appLoginInfo)
    {
        startPage();
        List<AppLoginInfo> list = appLoginInfoService.selectAppLoginInfoList(appLoginInfo);
        return getDataTable(list);
    }

    /**
     * 导出登录信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:export')")
    @Log(title = "登录信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AppLoginInfo appLoginInfo)
    {
        List<AppLoginInfo> list = appLoginInfoService.selectAppLoginInfoList(appLoginInfo);
        ExcelUtil<AppLoginInfo> util = new ExcelUtil<AppLoginInfo>(AppLoginInfo.class);
        return util.exportExcel(list, "app_login_info");
    }

    /**
     * 获取登录信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:query')")
    @GetMapping(value = "/{loId}")
    public AjaxResult getInfo(@PathVariable("loId") Long loId)
    {
        return AjaxResult.success(appLoginInfoService.selectAppLoginInfoById(loId));
    }

    /**
     * 新增登录信息
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:add')")
    @Log(title = "登录信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppLoginInfo appLoginInfo)
    {
        return toAjax(appLoginInfoService.insertAppLoginInfo(appLoginInfo));
    }

    /**
     * 修改登录信息
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:edit')")
    @Log(title = "登录信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppLoginInfo appLoginInfo)
    {
        return toAjax(appLoginInfoService.updateAppLoginInfo(appLoginInfo));
    }

    /**
     * 删除登录信息
     */
    @PreAuthorize("@ss.hasPermi('business:app_login_info:remove')")
    @Log(title = "登录信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{loIds}")
    public AjaxResult remove(@PathVariable Long[] loIds)
    {
        return toAjax(appLoginInfoService.deleteAppLoginInfoByIds(loIds));
    }
}
