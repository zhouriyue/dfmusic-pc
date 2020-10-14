package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.mapper.SingerMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.ISingerService;

/**
 * 歌手信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class SingerServiceImpl implements ISingerService 
{
    @Autowired
    private SingerMapper singerMapper;

    /**
     * 查询歌手信息
     * 
     * @param sinId 歌手信息ID
     * @return 歌手信息
     */
    @Override
    public Singer selectSingerById(Long sinId)
    {
        return singerMapper.selectSingerById(sinId);
    }

    /**
     * 查询歌手信息列表
     * 
     * @param singer 歌手信息
     * @return 歌手信息
     */
    @Override
    public List<Singer> selectSingerList(Singer singer)
    {
        return singerMapper.selectSingerList(singer);
    }

    /**
     * 新增歌手信息
     * 
     * @param singer 歌手信息
     * @return 结果
     */
    @Override
    public int insertSinger(Singer singer)
    {
        singer.setCreateTime(DateUtils.getNowDate());
        return singerMapper.insertSinger(singer);
    }

    /**
     * 修改歌手信息
     * 
     * @param singer 歌手信息
     * @return 结果
     */
    @Override
    public int updateSinger(Singer singer)
    {
        singer.setUpdateTime(DateUtils.getNowDate());
        return singerMapper.updateSinger(singer);
    }

    /**
     * 批量删除歌手信息
     * 
     * @param sinIds 需要删除的歌手信息ID
     * @return 结果
     */
    @Override
    public int deleteSingerByIds(Long[] sinIds)
    {
        return singerMapper.deleteSingerByIds(sinIds);
    }

    /**
     * 删除歌手信息信息
     * 
     * @param sinId 歌手信息ID
     * @return 结果
     */
    @Override
    public int deleteSingerById(Long sinId)
    {
        return singerMapper.deleteSingerById(sinId);
    }
}
