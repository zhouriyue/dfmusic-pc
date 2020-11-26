package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Song;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.RankingListMapper;
import com.ruoyi.business.domain.RankingList;
import com.ruoyi.business.service.IRankingListService;

/**
 * 排行榜管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-14
 */
@Service
public class RankingListServiceImpl implements IRankingListService 
{
    @Autowired
    private RankingListMapper rankingListMapper;

    /**
     * 查询排行榜管理
     * 
     * @param rlId 排行榜管理ID
     * @return 排行榜管理
     */
    @Override
    public RankingList selectRankingListById(Long rlId)
    {
        return rankingListMapper.selectRankingListById(rlId);
    }

    /**
     * 查询排行榜管理列表
     * 
     * @param rankingList 排行榜管理
     * @return 排行榜管理
     */
    @Override
    public List<RankingList> selectRankingListList(RankingList rankingList)
    {
        return rankingListMapper.selectRankingListList(rankingList);
    }

    /**
     * 新增排行榜管理
     * 
     * @param rankingList 排行榜管理
     * @return 结果
     */
    @Override
    public int insertRankingList(RankingList rankingList)
    {
        return rankingListMapper.insertRankingList(rankingList);
    }

    /**
     * 修改排行榜管理
     * 
     * @param rankingList 排行榜管理
     * @return 结果
     */
    @Override
    public int updateRankingList(RankingList rankingList)
    {
        return rankingListMapper.updateRankingList(rankingList);
    }

    /**
     * 批量删除排行榜管理
     * 
     * @param rlIds 需要删除的排行榜管理ID
     * @return 结果
     */
    @Override
    public int deleteRankingListByIds(Long[] rlIds)
    {
        return rankingListMapper.deleteRankingListByIds(rlIds);
    }

    /**
     * 删除排行榜管理信息
     * 
     * @param rlId 排行榜管理ID
     * @return 结果
     */
    @Override
    public int deleteRankingListById(Long rlId)
    {
        return rankingListMapper.deleteRankingListById(rlId);
    }

    @Override
    public List<RankingList> getOffRankingList() {
        return rankingListMapper.getOffRankingList();
    }

    @Override
    public List<RankingList> getNotOff() {
        return rankingListMapper.getNotOff();
    }

    @Override
    public List<Song> getWorldSong(Integer rlType) {
        return rankingListMapper.getWorldSong(rlType);
    }
}
