package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Banners;
import com.ruoyi.business.domain.SpecialFun;
import com.ruoyi.business.service.*;
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
import com.ruoyi.business.domain.Find;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 发现页管理Controller
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
@RestController
@RequestMapping("/business/find")
public class FindController extends BaseController
{
    @Autowired
    private IFindService findService;
    @Autowired
    private IBannersService bannersService;
    @Autowired
    private ISonglistService songlistService;
    @Autowired
    private ISongService songService;
    @Autowired
    private ISpecialFunService specialFunService;

    /** android 端 获取全部歌单 **/
    @GetMapping("/selectFind/android")
    public List<Find> selectFind(){
        List<Find> finds = findService.selectFindList(new Find());
        for(int i = 0;i < finds.size();i++) {
            Find find = finds.get(i);
            switch (find.getType()){
                case 1:{
                    find.setBannersList(bannersService.selectBannersList(null));
                };break;
                case 2:{
                    find.setSpecialFunList(specialFunService.selectSpecialFunList(new SpecialFun()));
                };break;
                case 3:{
                    find.setSonglists(songlistService.getHotSonglist(0,8));
                };break;
                case 4:{
                    find.setSongList(songService.selectHotSong(0,9));
                };break;
            }
        }
        return finds;
    }

    /**
     * 查询发现页管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:find:list')")
    @GetMapping("/list")
    public TableDataInfo list(Find find)
    {
        startPage();
        List<Find> list = findService.selectFindList(find);
        return getDataTable(list);
    }

    /**
     * 导出发现页管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:find:export')")
    @Log(title = "发现页管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Find find)
    {
        List<Find> list = findService.selectFindList(find);
        ExcelUtil<Find> util = new ExcelUtil<Find>(Find.class);
        return util.exportExcel(list, "find");
    }

    /**
     * 获取发现页管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:find:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(findService.selectFindById(id));
    }

    /**
     * 新增发现页管理
     */
    @PreAuthorize("@ss.hasPermi('business:find:add')")
    @Log(title = "发现页管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Find find)
    {
        return toAjax(findService.insertFind(find));
    }

    /**
     * 修改发现页管理
     */
    @PreAuthorize("@ss.hasPermi('business:find:edit')")
    @Log(title = "发现页管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Find find)
    {
        return toAjax(findService.updateFind(find));
    }

    /**
     * 删除发现页管理
     */
    @PreAuthorize("@ss.hasPermi('business:find:remove')")
    @Log(title = "发现页管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(findService.deleteFindByIds(ids));
    }
}
