package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SongSingerMapper;
import com.ruoyi.business.domain.SongSinger;
import com.ruoyi.business.service.ISongSingerService;

/**
 * 歌曲歌手联系Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
@Service
public class SongSingerServiceImpl implements ISongSingerService 
{
    @Autowired
    private SongSingerMapper songSingerMapper;

    /**
     * 查询歌曲歌手联系
     * 
     * @param id 歌曲歌手联系ID
     * @return 歌曲歌手联系
     */
    @Override
    public SongSinger selectSongSingerById(Long id)
    {
        return songSingerMapper.selectSongSingerById(id);
    }

    /**
     * 查询歌曲歌手联系列表
     * 
     * @param songSinger 歌曲歌手联系
     * @return 歌曲歌手联系
     */
    @Override
    public List<SongSinger> selectSongSingerList(SongSinger songSinger)
    {
        return songSingerMapper.selectSongSingerList(songSinger);
    }

    /**
     * 新增歌曲歌手联系
     * 
     * @param songSinger 歌曲歌手联系
     * @return 结果
     */
    @Override
    public int insertSongSinger(SongSinger songSinger)
    {
        return songSingerMapper.insertSongSinger(songSinger);
    }

    /**
     * 修改歌曲歌手联系
     * 
     * @param songSinger 歌曲歌手联系
     * @return 结果
     */
    @Override
    public int updateSongSinger(SongSinger songSinger)
    {
        return songSingerMapper.updateSongSinger(songSinger);
    }

    /**
     * 批量删除歌曲歌手联系
     * 
     * @param ids 需要删除的歌曲歌手联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSingerByIds(Long[] ids)
    {
        return songSingerMapper.deleteSongSingerByIds(ids);
    }

    /**
     * 删除歌曲歌手联系信息
     * 
     * @param id 歌曲歌手联系ID
     * @return 结果
     */
    @Override
    public int deleteSongSingerById(Long id)
    {
        return songSingerMapper.deleteSongSingerById(id);
    }

    @Override
    public int deleteIdSlId(SongSinger songSinger) {
        return songSingerMapper.deleteIdSlId(songSinger);
    }
}
