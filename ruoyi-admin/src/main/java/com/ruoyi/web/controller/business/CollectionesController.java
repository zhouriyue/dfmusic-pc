package com.ruoyi.web.controller.business;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
import com.ruoyi.business.domain.Collectiones;
import com.ruoyi.business.service.ICollectionesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 歌单收藏Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/collectiones")
public class CollectionesController extends BaseController
{
    public final static String FLAG = "flag";
    @Autowired
    private ICollectionesService collectionesService;

    /** 取消收藏 **/
    @PostMapping("/cancel/android")
    public void cancel(Long userId,Long slId){
        collectionesService.cancel(userId,slId);
    }

    /**
     * 查询歌单收藏列表
     * 安卓端
     */
    @GetMapping("/findAll/android")
    public List<Collectiones> findAll(Collectiones collectiones,Integer pageNum,Integer size)
    {
        if(pageNum!=null&&size!=null) {
            startPage(pageNum,size);
        }
        List<Collectiones> list = collectionesService.selectCollectionesList(collectiones);
        return list;
    }

    @PostMapping("/addAnd/android")
    public void addAnd(Collectiones collectiones)
    {
        collectionesService.insertCollectiones(collectiones);
    }

    @GetMapping("/isCollect/android")
    public Map<String,Boolean> isCollect(Long userId,Long slId){
        Collectiones collectiones = new Collectiones();
        collectiones.setCollectBy(userId);
        collectiones.setSlId(slId);
        List<Collectiones> collectionesList = collectionesService.selectCollectionesList(collectiones);
        Map<String,Boolean> object = new HashMap<>();
        if(collectionesList.size()>0){
            object.put(FLAG,true);
        } else {
            object.put(FLAG,false);
        }
        return object;
    }

    /**
     * 查询歌单收藏列表
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:list')")
    @GetMapping("/list")
    public TableDataInfo list(Collectiones collectiones)
    {
        startPage();
        List<Collectiones> list = collectionesService.selectCollectionesList(collectiones);
        return getDataTable(list);
    }

    /**
     * 导出歌单收藏列表
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:export')")
    @Log(title = "歌单收藏", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Collectiones collectiones)
    {
        List<Collectiones> list = collectionesService.selectCollectionesList(collectiones);
        ExcelUtil<Collectiones> util = new ExcelUtil<Collectiones>(Collectiones.class);
        return util.exportExcel(list, "collectiones");
    }

    /**
     * 获取歌单收藏详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:query')")
    @GetMapping(value = "/{colId}")
    public AjaxResult getInfo(@PathVariable("colId") Long colId)
    {
        return AjaxResult.success(collectionesService.selectCollectionesById(colId));
    }

    /**
     * 新增歌单收藏
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:add')")
    @Log(title = "歌单收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Collectiones collectiones)
    {
        return toAjax(collectionesService.insertCollectiones(collectiones));
    }

    /**
     * 修改歌单收藏
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:edit')")
    @Log(title = "歌单收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Collectiones collectiones)
    {
        return toAjax(collectionesService.updateCollectiones(collectiones));
    }

    /**
     * 删除歌单收藏
     */
    @PreAuthorize("@ss.hasPermi('business:collectiones:remove')")
    @Log(title = "歌单收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{colIds}")
    public AjaxResult remove(@PathVariable Long[] colIds)
    {
        return toAjax(collectionesService.deleteCollectionesByIds(colIds));
    }
}
