package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.SongType;

/**
 * 歌曲类型Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface SongTypeMapper 
{
    /**
     * 查询歌曲类型
     * 
     * @param stId 歌曲类型ID
     * @return 歌曲类型
     */
    public SongType selectSongTypeById(Long stId);

    /**
     * 查询歌曲类型列表
     * 
     * @param songType 歌曲类型
     * @return 歌曲类型集合
     */
    public List<SongType> selectSongTypeList(SongType songType);

    /**
     * 新增歌曲类型
     * 
     * @param songType 歌曲类型
     * @return 结果
     */
    public int insertSongType(SongType songType);

    /**
     * 修改歌曲类型
     * 
     * @param songType 歌曲类型
     * @return 结果
     */
    public int updateSongType(SongType songType);

    /**
     * 删除歌曲类型
     * 
     * @param stId 歌曲类型ID
     * @return 结果
     */
    public int deleteSongTypeById(Long stId);

    /**
     * 批量删除歌曲类型
     * 
     * @param stIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSongTypeByIds(Long[] stIds);
}
