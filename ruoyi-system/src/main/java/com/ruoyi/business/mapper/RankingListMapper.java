package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.RankingList;
import com.ruoyi.business.domain.Song;

/**
 * 排行榜管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-11-14
 */
public interface RankingListMapper 
{
    /**
     * 查询排行榜管理
     * 
     * @param rlId 排行榜管理ID
     * @return 排行榜管理
     */
    public RankingList selectRankingListById(Long rlId);

    /**
     * 查询排行榜管理列表
     * 
     * @param rankingList 排行榜管理
     * @return 排行榜管理集合
     */
    public List<RankingList> selectRankingListList(RankingList rankingList);

    /**
     * 新增排行榜管理
     * 
     * @param rankingList 排行榜管理
     * @return 结果
     */
    public int insertRankingList(RankingList rankingList);

    /**
     * 修改排行榜管理
     * 
     * @param rankingList 排行榜管理
     * @return 结果
     */
    public int updateRankingList(RankingList rankingList);

    /**
     * 删除排行榜管理
     * 
     * @param rlId 排行榜管理ID
     * @return 结果
     */
    public int deleteRankingListById(Long rlId);

    /**
     * 批量删除排行榜管理
     * 
     * @param rlIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteRankingListByIds(Long[] rlIds);

    public List<RankingList> getOffRankingList();

    public List<RankingList> getNotOff();

    public List<Song> getWorldSong(Integer rlType);
}
