package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.SongSonglist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SongSonglistMapper;
import com.ruoyi.business.service.ISongSonglistService;

/**
 * 歌曲歌单联系Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
@Service
public class SongSonglistServiceImpl implements ISongSonglistService 
{
    @Autowired
    private SongSonglistMapper songSonglistMapper;

    /**
     * 查询歌曲歌单联系
     * 
     * @param id 歌曲歌单联系ID
     * @return 歌曲歌单联系
     */
    @Override
    public SongSonglist selectSongSonglistById(Long id)
    {
        return songSonglistMapper.selectSongSonglistById(id);
    }

    /**
     * 查询歌曲歌单联系列表
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 歌曲歌单联系
     */
    @Override
    public List<SongSonglist> selectSongSonglistList(SongSonglist songSonglist)
    {
        return songSonglistMapper.selectSongSonglistList(songSonglist);
    }

    /**
     * 新增歌曲歌单联系
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 结果
     */
    @Override
    public int insertSongSonglist(SongSonglist songSonglist)
    {
        return songSonglistMapper.insertSongSonglist(songSonglist);
    }

    /**
     * 修改歌曲歌单联系
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 结果
     */
    @Override
    public int updateSongSonglist(SongSonglist songSonglist)
    {
        return songSonglistMapper.updateSongSonglist(songSonglist);
    }

    /**
     * 批量删除歌曲歌单联系
     * 
     * @param ids 需要删除的歌曲歌单联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSonglistByIds(Long[] ids)
    {
        return songSonglistMapper.deleteSongSonglistByIds(ids);
    }

    /**
     * 删除歌曲歌单联系信息
     * 
     * @param id 歌曲歌单联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSonglistById(Long id)
    {
        return songSonglistMapper.deleteSongSonglistById(id);
    }

    @Override
    public int deleteSlIdSongId(SongSonglist songSonglist) {
        return songSonglistMapper.deleteSlIdSongId(songSonglist);
    }
}
