package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.service.ISingerService;
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
 * 歌手信息Controller
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@RestController
@RequestMapping("/business/singer")
public class SingerController extends BaseController
{
    @Autowired
    private ISingerService singerService;

    /** 获取歌手首个字的拼音的歌手**/
    @GetMapping(value = "/selectFristPySinName")
    public TableDataInfo selectFristPySinName(String fristPy){
        System.out.println(fristPy);
        return getDataTable(singerService.selectFristPySinName(fristPy));
    }

    /** 获取歌手的所有专辑**/
    @GetMapping(value = "/selectSingerAlbum")
    public TableDataInfo selectSingerAlbum(Long sinId){
        return getDataTable(singerService.selectSingerAlbum(sinId));
    }

    /**
     * 歌手详情
     * @param sinId
     * @return
     */
    @GetMapping(value = "/selectSingerDetail")
    public AjaxResult selectSingerDetail(Long sinId){
        return AjaxResult.success(singerService.selectSingerDetail(sinId));
    }

    /** 获取歌手排名 **/
    @GetMapping("/selectRankAll")
    public TableDataInfo selectRankAll(){
        List<Singer> singerList = singerService.selectRankAll();
        for(int i = 0;i < singerList.size();i++) {
            Singer singer = singerList.get(i);
            if(singer.getCurRank()==0) {
                singer.setCurRank(i+1);
                singerService.updateSinger(singer);
            } else {
                if(singer.getCurRank()!=i+1) {
                    singer.setLastRank(singer.getCurRank());
                    singer.setCurRank(i+1);
                    singerService.updateSinger(singer);
                }
            }
        }
        return getDataTable(singerList);
    }

    /** 获取歌手排名 **/
    @GetMapping("/selectSingerRank")
    public TableDataInfo selectSingerRank(){
        List<Singer> singerList = singerService.selectSingerRank();
        for(int i = 0;i < singerList.size();i++) {
            Singer singer = singerList.get(i);
            if(singer.getCurRank()==0) {
                singer.setCurRank(i+1);
                singerService.updateSinger(singer);
            } else {
                if(singer.getCurRank()!=i+1) {
                    singer.setLastRank(singer.getCurRank());
                    singer.setCurRank(i+1);
                    singerService.updateSinger(singer);
                }
            }
        }
        return getDataTable(singerList);
    }

    @GetMapping("selectSingerKey")
    public List<Singer> selectSingerKey(String key){
        return singerService.selectSingerKey(key);
    }

    /**
     * 查询歌手信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:singer:list')")
    @GetMapping("/list")
    public TableDataInfo list(Singer singer)
    {
        startPage();
        List<Singer> list = singerService.selectSingerList(singer);
        return getDataTable(list);
    }

    /**
     * 导出歌手信息列表
     */
    @PreAuthorize("@ss.hasPermi('business:singer:export')")
    @Log(title = "歌手信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Singer singer)
    {
        List<Singer> list = singerService.selectSingerList(singer);
        ExcelUtil<Singer> util = new ExcelUtil<Singer>(Singer.class);
        return util.exportExcel(list, "singer");
    }

    /**
     * 获取歌手信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:query')")
    @GetMapping(value = "/{sinId}")
    public AjaxResult getInfo(@PathVariable("sinId") Long sinId)
    {
        return AjaxResult.success(singerService.selectSingerById(sinId));
    }

    /**
     * 新增歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:add')")
    @Log(title = "歌手信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Singer singer)
    {
        return toAjax(singerService.insertSinger(singer));
    }

    /**
     * 修改歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:edit')")
    @Log(title = "歌手信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Singer singer)
    {
        return toAjax(singerService.updateSinger(singer));
    }

    /**
     * 删除歌手信息
     */
    @PreAuthorize("@ss.hasPermi('business:singer:remove')")
    @Log(title = "歌手信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sinIds}")
    public AjaxResult remove(@PathVariable Long[] sinIds)
    {
        return toAjax(singerService.deleteSingerByIds(sinIds));
    }
}
