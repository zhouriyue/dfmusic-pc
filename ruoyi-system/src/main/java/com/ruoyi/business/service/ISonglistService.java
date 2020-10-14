package com.ruoyi.business.service;

import com.ruoyi.business.domain.Songlist;

import java.util.List;

/**
 * 歌单Service接口
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
public interface ISonglistService 
{
    /**
     * 查询歌单
     * 
     * @param slId 歌单ID
     * @return 歌单
     */
    public Songlist selectSonglistById(Long slId);

    /**
     * 查询歌单列表
     * 
     * @param songlist 歌单
     * @return 歌单集合
     */
    public List<Songlist> selectSonglistList(Songlist songlist);

    /**
     * 新增歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    public int insertSonglist(Songlist songlist);

    /**
     * 修改歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    public int updateSonglist(Songlist songlist);

    /**
     * 批量删除歌单
     * 
     * @param slIds 需要删除的歌单ID
     * @return 结果
     */
    public int deleteSonglistByIds(Long[] slIds);

    /**
     * 删除歌单信息
     * 
     * @param slId 歌单ID
     * @return 结果
     */
    public int deleteSonglistById(Long slId);
}
