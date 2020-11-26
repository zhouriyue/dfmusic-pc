package com.ruoyi.business.service;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.domain.Song;
import com.ruoyi.common.core.page.TableDataInfo;

import java.util.List;

/**
 * 歌曲Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface ISongService 
{
    /**
     * 查询歌曲
     * 
     * @param songId 歌曲ID
     * @return 歌曲
     */
    public Song selectSongById(Long songId);

    /**
     * 查询歌曲列表
     * 
     * @param song 歌曲
     * @return 歌曲集合
     */
    public List<Song> selectSongList(Song song);

    /**
     * 新增歌曲
     * 
     * @param song 歌曲
     * @return 结果
     */
    public int insertSong(Song song);

    /**
     * 修改歌曲
     * 
     * @param song 歌曲
     * @return 结果
     */
    public int updateSong(Song song);

    /**
     * 批量删除歌曲
     * 
     * @param songIds 需要删除的歌曲ID
     * @return 结果
     */
    public int deleteSongByIds(Long[] songIds);

    /**
     * 删除歌曲信息
     * 
     * @param songId 歌曲ID
     * @return 结果
     */
    public int deleteSongById(Long songId);

    public List<Song> selectSongKey(String wordKey);

    public List<Song> selectAll(Long slId);

    public List<Singer> selectSinger(Long songId);

    public List<Song> getRiseSong();

    public List<Song> getNewSong();

    public List<Song> getOriginalSong();

    public List<Song> getHotSong();

}
