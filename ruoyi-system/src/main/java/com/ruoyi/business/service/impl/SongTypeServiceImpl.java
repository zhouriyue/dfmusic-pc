package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.domain.SongType;
import com.ruoyi.business.mapper.SongTypeMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.ISongTypeService;

/**
 * 歌曲类型Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class SongTypeServiceImpl implements ISongTypeService 
{
    @Autowired
    private SongTypeMapper songTypeMapper;

    /**
     * 查询歌曲类型
     * 
     * @param stId 歌曲类型ID
     * @return 歌曲类型
     */
    @Override
    public SongType selectSongTypeById(Long stId)
    {
        return songTypeMapper.selectSongTypeById(stId);
    }

    /**
     * 查询歌曲类型列表
     * 
     * @param songType 歌曲类型
     * @return 歌曲类型
     */
    @Override
    public List<SongType> selectSongTypeList(SongType songType)
    {
        return songTypeMapper.selectSongTypeList(songType);
    }

    /**
     * 新增歌曲类型
     * 
     * @param songType 歌曲类型
     * @return 结果
     */
    @Override
    public int insertSongType(SongType songType)
    {
        songType.setCreateTime(DateUtils.getNowDate());
        return songTypeMapper.insertSongType(songType);
    }

    /**
     * 修改歌曲类型
     * 
     * @param songType 歌曲类型
     * @return 结果
     */
    @Override
    public int updateSongType(SongType songType)
    {
        songType.setUpdateTime(DateUtils.getNowDate());
        return songTypeMapper.updateSongType(songType);
    }

    /**
     * 批量删除歌曲类型
     * 
     * @param stIds 需要删除的歌曲类型ID
     * @return 结果
     */
    @Override
    public int deleteSongTypeByIds(Long[] stIds)
    {
        return songTypeMapper.deleteSongTypeByIds(stIds);
    }

    /**
     * 删除歌曲类型信息
     * 
     * @param stId 歌曲类型ID
     * @return 结果
     */
    @Override
    public int deleteSongTypeById(Long stId)
    {
        return songTypeMapper.deleteSongTypeById(stId);
    }

    @Override
    public List<Song> getTypeSong(Long stId) {
        return songTypeMapper.getTypeSong(stId);
    }

}
