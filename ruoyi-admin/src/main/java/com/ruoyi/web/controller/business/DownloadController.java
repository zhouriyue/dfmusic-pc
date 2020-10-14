package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Download;
import com.ruoyi.business.service.IDownloadService;
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
 * 下载信息Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/download")
public class DownloadController extends BaseController
{
    @Autowired
    private IDownloadService downloadService;

    /**
     * 查询下载信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:download:list')")
    @GetMapping("/list")
    public TableDataInfo list(Download download)
    {
        startPage();
        List<Download> list = downloadService.selectDownloadList(download);
        return getDataTable(list);
    }

    /**
     * 导出下载信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:download:export')")
    @Log(title = "下载信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Download download)
    {
        List<Download> list = downloadService.selectDownloadList(download);
        ExcelUtil<Download> util = new ExcelUtil<Download>(Download.class);
        return util.exportExcel(list, "download");
    }

    /**
     * 获取下载信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:download:query')")
    @GetMapping(value = "/{dlId}")
    public AjaxResult getInfo(@PathVariable("dlId") Long dlId)
    {
        return AjaxResult.success(downloadService.selectDownloadById(dlId));
    }

    /**
     * 新增下载信息
     */
    @PreAuthorize("@ss.hasPermi('business:download:add')")
    @Log(title = "下载信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Download download)
    {
        return toAjax(downloadService.insertDownload(download));
    }

    /**
     * 修改下载信息
     */
    @PreAuthorize("@ss.hasPermi('business:download:edit')")
    @Log(title = "下载信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Download download)
    {
        return toAjax(downloadService.updateDownload(download));
    }

    /**
     * 删除下载信息
     */
    @PreAuthorize("@ss.hasPermi('business:download:remove')")
    @Log(title = "下载信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dlIds}")
    public AjaxResult remove(@PathVariable Long[] dlIds)
    {
        return toAjax(downloadService.deleteDownloadByIds(dlIds));
    }
}
