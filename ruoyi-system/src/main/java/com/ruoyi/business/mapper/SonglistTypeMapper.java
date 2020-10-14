package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.SonglistType;

/**
 * 歌单类型管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface SonglistTypeMapper 
{
    /**
     * 查询歌单类型管理
     * 
     * @param sltId 歌单类型管理ID
     * @return 歌单类型管理
     */
    public SonglistType selectSonglistTypeById(Long sltId);

    /**
     * 查询歌单类型管理列表
     * 
     * @param songlistType 歌单类型管理
     * @return 歌单类型管理集合
     */
    public List<SonglistType> selectSonglistTypeList(SonglistType songlistType);

    /**
     * 新增歌单类型管理
     * 
     * @param songlistType 歌单类型管理
     * @return 结果
     */
    public int insertSonglistType(SonglistType songlistType);

    /**
     * 修改歌单类型管理
     * 
     * @param songlistType 歌单类型管理
     * @return 结果
     */
    public int updateSonglistType(SonglistType songlistType);

    /**
     * 删除歌单类型管理
     * 
     * @param sltId 歌单类型管理ID
     * @return 结果
     */
    public int deleteSonglistTypeById(Long sltId);

    /**
     * 批量删除歌单类型管理
     * 
     * @param sltIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSonglistTypeByIds(Long[] sltIds);
}
