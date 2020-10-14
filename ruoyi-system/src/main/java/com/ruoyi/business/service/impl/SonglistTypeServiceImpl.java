package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SonglistTypeMapper;
import com.ruoyi.business.domain.SonglistType;
import com.ruoyi.business.service.ISonglistTypeService;

/**
 * 歌单类型管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class SonglistTypeServiceImpl implements ISonglistTypeService 
{
    @Autowired
    private SonglistTypeMapper songlistTypeMapper;

    /**
     * 查询歌单类型管理
     * 
     * @param sltId 歌单类型管理ID
     * @return 歌单类型管理
     */
    @Override
    public SonglistType selectSonglistTypeById(Long sltId)
    {
        return songlistTypeMapper.selectSonglistTypeById(sltId);
    }

    /**
     * 查询歌单类型管理列表
     * 
     * @param songlistType 歌单类型管理
     * @return 歌单类型管理
     */
    @Override
    public List<SonglistType> selectSonglistTypeList(SonglistType songlistType)
    {
        return songlistTypeMapper.selectSonglistTypeList(songlistType);
    }

    /**
     * 新增歌单类型管理
     * 
     * @param songlistType 歌单类型管理
     * @return 结果
     */
    @Override
    public int insertSonglistType(SonglistType songlistType)
    {
        songlistType.setCreateTime(DateUtils.getNowDate());
        return songlistTypeMapper.insertSonglistType(songlistType);
    }

    /**
     * 修改歌单类型管理
     * 
     * @param songlistType 歌单类型管理
     * @return 结果
     */
    @Override
    public int updateSonglistType(SonglistType songlistType)
    {
        songlistType.setUpdateTime(DateUtils.getNowDate());
        return songlistTypeMapper.updateSonglistType(songlistType);
    }

    /**
     * 批量删除歌单类型管理
     * 
     * @param sltIds 需要删除的歌单类型管理ID
     * @return 结果
     */
    @Override
    public int deleteSonglistTypeByIds(Long[] sltIds)
    {
        return songlistTypeMapper.deleteSonglistTypeByIds(sltIds);
    }

    /**
     * 删除歌单类型管理信息
     * 
     * @param sltId 歌单类型管理ID
     * @return 结果
     */
    @Override
    public int deleteSonglistTypeById(Long sltId)
    {
        return songlistTypeMapper.deleteSonglistTypeById(sltId);
    }
}
