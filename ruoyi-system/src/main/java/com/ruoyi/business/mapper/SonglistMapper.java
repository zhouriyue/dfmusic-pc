package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Songlist;

/**
 * 歌单Mapper接口
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
public interface SonglistMapper 
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
     * 删除歌单
     * 
     * @param slId 歌单ID
     * @return 结果
     */
    public int deleteSonglistById(Long slId);

    /**
     * 批量删除歌单
     * 
     * @param slIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSonglistByIds(Long[] slIds);
}
