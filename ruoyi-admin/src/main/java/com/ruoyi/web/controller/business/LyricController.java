package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Lyric;
import com.ruoyi.business.service.ILyricService;
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
 * 歌词Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/lyric")
public class LyricController extends BaseController
{
    @Autowired
    private ILyricService lyricService;

    /**
     * 查询歌词列表
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:list')")
    @GetMapping("/list")
    public TableDataInfo list(Lyric lyric)
    {
        startPage();
        List<Lyric> list = lyricService.selectLyricList(lyric);
        return getDataTable(list);
    }

    /**
     * 导出歌词列表
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:export')")
    @Log(title = "歌词", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Lyric lyric)
    {
        List<Lyric> list = lyricService.selectLyricList(lyric);
        ExcelUtil<Lyric> util = new ExcelUtil<Lyric>(Lyric.class);
        return util.exportExcel(list, "lyric");
    }

    /**
     * 获取歌词详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:query')")
    @GetMapping(value = "/{lyrId}")
    public AjaxResult getInfo(@PathVariable("lyrId") Long lyrId)
    {
        return AjaxResult.success(lyricService.selectLyricById(lyrId));
    }

    /**
     * 新增歌词
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:add')")
    @Log(title = "歌词", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Lyric lyric)
    {
        return toAjax(lyricService.insertLyric(lyric));
    }

    /**
     * 修改歌词
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:edit')")
    @Log(title = "歌词", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Lyric lyric)
    {
        return toAjax(lyricService.updateLyric(lyric));
    }

    /**
     * 删除歌词
     */
    @PreAuthorize("@ss.hasPermi('business:lyric:remove')")
    @Log(title = "歌词", businessType = BusinessType.DELETE)
	@DeleteMapping("/{lyrIds}")
    public AjaxResult remove(@PathVariable Long[] lyrIds)
    {
        return toAjax(lyricService.deleteLyricByIds(lyrIds));
    }
}
