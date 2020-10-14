package com.ruoyi.business.service;

import com.ruoyi.business.domain.Lyric;

import java.util.List;

/**
 * 歌词Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface ILyricService 
{
    /**
     * 查询歌词
     * 
     * @param lyrId 歌词ID
     * @return 歌词
     */
    public Lyric selectLyricById(Long lyrId);

    /**
     * 查询歌词列表
     * 
     * @param lyric 歌词
     * @return 歌词集合
     */
    public List<Lyric> selectLyricList(Lyric lyric);

    /**
     * 新增歌词
     * 
     * @param lyric 歌词
     * @return 结果
     */
    public int insertLyric(Lyric lyric);

    /**
     * 修改歌词
     * 
     * @param lyric 歌词
     * @return 结果
     */
    public int updateLyric(Lyric lyric);

    /**
     * 批量删除歌词
     * 
     * @param lyrIds 需要删除的歌词ID
     * @return 结果
     */
    public int deleteLyricByIds(Long[] lyrIds);

    /**
     * 删除歌词信息
     * 
     * @param lyrId 歌词ID
     * @return 结果
     */
    public int deleteLyricById(Long lyrId);
}
