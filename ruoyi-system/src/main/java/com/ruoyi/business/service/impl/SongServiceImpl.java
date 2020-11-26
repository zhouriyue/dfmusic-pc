package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.domain.Song;
import com.ruoyi.business.mapper.SongMapper;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.ISongService;

/**
 * 歌曲Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class SongServiceImpl implements ISongService 
{
    @Autowired
    private SongMapper songMapper;

    /**
     * 查询歌曲
     * 
     * @param songId 歌曲ID
     * @return 歌曲
     */
    @Override
    public Song selectSongById(Long songId)
    {
        return songMapper.selectSongById(songId);
    }

    /**
     * 查询歌曲列表
     * 
     * @param song 歌曲
     * @return 歌曲
     */
    @Override
    public List<Song> selectSongList(Song song)
    {
        return songMapper.selectSongList(song);
    }

    /**
     * 新增歌曲
     * 
     * @param song 歌曲
     * @return 结果
     */
    @Override
    public int insertSong(Song song)
    {
        song.setCreateTime(DateUtils.getNowDate());
        return songMapper.insertSong(song);
    }

    /**
     * 修改歌曲
     * 
     * @param song 歌曲
     * @return 结果
     */
    @Override
    public int updateSong(Song song)
    {
        song.setUpdateTime(DateUtils.getNowDate());
        return songMapper.updateSong(song);
    }

    /**
     * 批量删除歌曲
     * 
     * @param songIds 需要删除的歌曲ID
     * @return 结果
     */
    @Override
    public int deleteSongByIds(Long[] songIds)
    {
        return songMapper.deleteSongByIds(songIds);
    }

    /**
     * 删除歌曲信息
     * 
     * @param songId 歌曲ID
     * @return 结果
     */
    @Override
    public int deleteSongById(Long songId)
    {
        return songMapper.deleteSongById(songId);
    }

    @Override
    public List<Song> selectSongKey(String wordKey) {
        return songMapper.selectSongKey(wordKey);
    }

    @Override
    public List<Song> selectAll(Long slId) {
        return songMapper.selectAll(slId);
    }

    @Override
    public List<Singer> selectSinger(Long songId) {
        return songMapper.selectSinger(songId);
    }

    @Override
    public List<Song> getRiseSong() {
        return songMapper.getRiseSong();
    }

    @Override
    public List<Song> getNewSong() {
        return songMapper.getNewSong();
    }

    @Override
    public List<Song> getOriginalSong() {
        return songMapper.getOriginalSong();
    }

    @Override
    public List<Song> getHotSong() {
        return songMapper.getHotSong();
    }
}
