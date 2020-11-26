package com.ruoyi.web.controller.business;

import java.util.List;

import com.ruoyi.business.service.ISongService;
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
import com.ruoyi.business.domain.RankingList;
import com.ruoyi.business.service.IRankingListService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 排行榜管理Controller
 * 
 * @author ruoyi
 * @date 2020-11-14
 */
@RestController
@RequestMapping("/business/rankinglist")
public class RankingListController extends BaseController
{
    @Autowired
    private IRankingListService rankingListService;

    @Autowired
    private ISongService songService;

    /** 获取全球榜的歌曲 **/
    @GetMapping("/getWorldSong")
    public TableDataInfo getWorldSong(Integer rlType){
        return getDataTable(rankingListService.getWorldSong(rlType));
    }

    /** 获取全球排行榜 **/
    @GetMapping("/getNotOff")
    public TableDataInfo getNotOff(){
        return getDataTable(rankingListService.getNotOff());
    }

    /** 获取官方排行榜 **/
    @GetMapping("/getOffRankingList")
    public TableDataInfo getOffRankingList(){
        startPage();
        List<RankingList> rankingLists = rankingListService.getOffRankingList();
        for(RankingList rankingList:rankingLists) {
            switch (rankingList.getRlType()){
                case -1:{
                    rankingList.setSongList(songService.getRiseSong());
                };break;
                case -2:{
                    rankingList.setSongList(songService.getNewSong());
                };break;
                case -3:{
                    rankingList.setSongList(songService.getOriginalSong());
                };break;
                case -4:{
                    rankingList.setSongList(songService.getHotSong());
                };break;
            }
        }
        return getDataTable(rankingLists);
    }

    /**
     * 查询排行榜管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:list')")
    @GetMapping("/list")
    public TableDataInfo list(RankingList rankingList)
    {
        startPage();
        List<RankingList> list = rankingListService.selectRankingListList(rankingList);
        return getDataTable(list);
    }

    /**
     * 导出排行榜管理列表
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:export')")
    @Log(title = "排行榜管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(RankingList rankingList)
    {
        List<RankingList> list = rankingListService.selectRankingListList(rankingList);
        ExcelUtil<RankingList> util = new ExcelUtil<RankingList>(RankingList.class);
        return util.exportExcel(list, "rankinglist");
    }

    /**
     * 获取排行榜管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:query')")
    @GetMapping(value = "/{rlId}")
    public AjaxResult getInfo(@PathVariable("rlId") Long rlId)
    {
        return AjaxResult.success(rankingListService.selectRankingListById(rlId));
    }

    /**
     * 新增排行榜管理
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:add')")
    @Log(title = "排行榜管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RankingList rankingList)
    {
        return toAjax(rankingListService.insertRankingList(rankingList));
    }

    /**
     * 修改排行榜管理
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:edit')")
    @Log(title = "排行榜管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RankingList rankingList)
    {
        return toAjax(rankingListService.updateRankingList(rankingList));
    }

    /**
     * 删除排行榜管理
     */
    @PreAuthorize("@ss.hasPermi('business:rankinglist:remove')")
    @Log(title = "排行榜管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{rlIds}")
    public AjaxResult remove(@PathVariable Long[] rlIds)
    {
        return toAjax(rankingListService.deleteRankingListByIds(rlIds));
    }
}
