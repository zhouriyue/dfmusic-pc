package com.ruoyi.business.service;

import com.ruoyi.business.domain.SongSonglist;

import java.util.List;

/**
 * 歌曲歌单联系Service接口
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public interface ISongSonglistService 
{
    /**
     * 查询歌曲歌单联系
     * 
     * @param id 歌曲歌单联系ID
     * @return 歌曲歌单联系
     */
    public SongSonglist selectSongSonglistById(Long id);

    /**
     * 查询歌曲歌单联系列表
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 歌曲歌单联系集合
     */
    public List<SongSonglist> selectSongSonglistList(SongSonglist songSonglist);

    /**
     * 新增歌曲歌单联系
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 结果
     */
    public int insertSongSonglist(SongSonglist songSonglist);

    /**
     * 修改歌曲歌单联系
     * 
     * @param songSonglist 歌曲歌单联系
     * @return 结果
     */
    public int updateSongSonglist(SongSonglist songSonglist);

    /**
     * 批量删除歌曲歌单联系
     * 
     * @param ids 需要删除的歌曲歌单联系ID
     * @return 结果
     */
    public int deleteSongSonglistByIds(Long[] ids);

    /**
     * 删除歌曲歌单联系信息
     * 
     * @param id 歌曲歌单联系ID
     * @return 结果
     */
    public int deleteSongSonglistById(Long id);

    public int deleteSlIdSongId(SongSonglist songSonglist);
}