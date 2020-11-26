package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.SongType;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SongSongtypeMapper;
import com.ruoyi.business.domain.SongSongtype;
import com.ruoyi.business.service.ISongSongtypeService;

/**
 * 歌曲类型联系Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
@Service
public class SongSongtypeServiceImpl implements ISongSongtypeService 
{
    @Autowired
    private SongSongtypeMapper songSongtypeMapper;

    /**
     * 查询歌曲类型联系
     * 
     * @param id 歌曲类型联系ID
     * @return 歌曲类型联系
     */
    @Override
    public SongSongtype selectSongSongtypeById(Long id)
    {
        return songSongtypeMapper.selectSongSongtypeById(id);
    }

    /**
     * 查询歌曲类型联系列表
     * 
     * @param songSongtype 歌曲类型联系
     * @return 歌曲类型联系
     */
    @Override
    public List<SongSongtype> selectSongSongtypeList(SongSongtype songSongtype)
    {
        return songSongtypeMapper.selectSongSongtypeList(songSongtype);
    }

    /**
     * 新增歌曲类型联系
     * 
     * @param songSongtype 歌曲类型联系
     * @return 结果
     */
    @Override
    public int insertSongSongtype(SongSongtype songSongtype)
    {
        songSongtype.setCreateTime(DateUtils.getNowDate());
        return songSongtypeMapper.insertSongSongtype(songSongtype);
    }

    /**
     * 修改歌曲类型联系
     * 
     * @param songSongtype 歌曲类型联系
     * @return 结果
     */
    @Override
    public int updateSongSongtype(SongSongtype songSongtype)
    {
        songSongtype.setUpdateTime(DateUtils.getNowDate());
        return songSongtypeMapper.updateSongSongtype(songSongtype);
    }

    /**
     * 批量删除歌曲类型联系
     * 
     * @param ids 需要删除的歌曲类型联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSongtypeByIds(Long[] ids)
    {
        return songSongtypeMapper.deleteSongSongtypeByIds(ids);
    }

    /**
     * 删除歌曲类型联系信息
     * 
     * @param id 歌曲类型联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSongtypeById(Long id)
    {
        return songSongtypeMapper.deleteSongSongtypeById(id);
    }

    @Override
    public int deleteSongIdStId(SongSongtype songSongtype) {
        return songSongtypeMapper.deleteSongIdStId(songSongtype);
    }
}
