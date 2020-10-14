package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Lyric;

/**
 * 歌词Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface LyricMapper 
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
     * 删除歌词
     * 
     * @param lyrId 歌词ID
     * @return 结果
     */
    public int deleteLyricById(Long lyrId);

    /**
     * 批量删除歌词
     * 
     * @param lyrIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteLyricByIds(Long[] lyrIds);
}
