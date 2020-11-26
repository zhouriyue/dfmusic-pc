package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Lyric;
import com.ruoyi.business.mapper.LyricMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.ILyricService;

/**
 * 歌词Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class LyricServiceImpl implements ILyricService 
{
    @Autowired
    private LyricMapper lyricMapper;

    /**
     * 查询歌词
     * 
     * @param lyrId 歌词ID
     * @return 歌词
     */
    @Override
    public Lyric selectLyricById(Long lyrId)
    {
        return lyricMapper.selectLyricById(lyrId);
    }

    /**
     * 查询歌词列表
     * 
     * @param lyric 歌词
     * @return 歌词
     */
    @Override
    public List<Lyric> selectLyricList(Lyric lyric)
    {
        return lyricMapper.selectLyricList(lyric);
    }

    /**
     * 新增歌词
     * 
     * @param lyric 歌词
     * @return 结果
     */
    @Override
    public int insertLyric(Lyric lyric)
    {
        lyric.setCreateTime(DateUtils.getNowDate());
        return lyricMapper.insertLyric(lyric);
    }

    /**
     * 修改歌词
     * 
     * @param lyric 歌词
     * @return 结果
     */
    @Override
    public int updateLyric(Lyric lyric)
    {
        lyric.setUpdateTime(DateUtils.getNowDate());
        return lyricMapper.updateLyric(lyric);
    }

    /**
     * 批量删除歌词
     * 
     * @param lyrIds 需要删除的歌词ID
     * @return 结果
     */
    @Override
    public int deleteLyricByIds(Long[] lyrIds)
    {
        return lyricMapper.deleteLyricByIds(lyrIds);
    }

    /**
     * 删除歌词信息
     * 
     * @param lyrId 歌词ID
     * @return 结果
     */
    @Override
    public int deleteLyricById(Long lyrId)
    {
        return lyricMapper.deleteLyricById(lyrId);
    }

}
