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
import com.ruoyi.business.domain.Banners;
import com.ruoyi.business.service.IBannersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 轮播图管理Controller
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
@RestController
@RequestMapping("/business/banners")
public class BannersController extends BaseController
{
    @Autowired
    private IBannersService bannersService;

    /**
     * 查询轮播图管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:banners:list')")
    @GetMapping("/list")
    public TableDataInfo list(Banners banners)
    {
        startPage();
        List<Banners> list = bannersService.selectBannersList(banners);
        return getDataTable(list);
    }

    /**
     * 导出轮播图管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:banners:export')")
    @Log(title = "轮播图管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Banners banners)
    {
        List<Banners> list = bannersService.selectBannersList(banners);
        ExcelUtil<Banners> util = new ExcelUtil<Banners>(Banners.class);
        return util.exportExcel(list, "banners");
    }

    /**
     * 获取轮播图管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:banners:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bannersService.selectBannersById(id));
    }

    /**
     * 新增轮播图管理
     */
    @PreAuthorize("@ss.hasPermi('business:banners:add')")
    @Log(title = "轮播图管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Banners banners)
    {
        return toAjax(bannersService.insertBanners(banners));
    }

    /**
     * 修改轮播图管理
     */
    @PreAuthorize("@ss.hasPermi('business:banners:edit')")
    @Log(title = "轮播图管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Banners banners)
    {
        return toAjax(bannersService.updateBanners(banners));
    }

    /**
     * 删除轮播图管理
     */
    @PreAuthorize("@ss.hasPermi('business:banners:remove')")
    @Log(title = "轮播图管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bannersService.deleteBannersByIds(ids));
    }
}
