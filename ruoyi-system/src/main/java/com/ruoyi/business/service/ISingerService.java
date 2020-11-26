package com.ruoyi.business.service;

import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.domain.Songlist;
import com.ruoyi.common.core.domain.AjaxResult;

import java.util.List;

/**
 * 歌手信息Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface ISingerService 
{
    /**
     * 查询歌手信息
     * 
     * @param sinId 歌手信息ID
     * @return 歌手信息
     */
    public Singer selectSingerById(Long sinId);

    /**
     * 查询歌手信息列表
     * 
     * @param singer 歌手信息
     * @return 歌手信息集合
     */
    public List<Singer> selectSingerList(Singer singer);

    /**
     * 新增歌手信息
     * 
     * @param singer 歌手信息
     * @return 结果
     */
    public int insertSinger(Singer singer);

    /**
     * 修改歌手信息
     * 
     * @param singer 歌手信息
     * @return 结果
     */
    public int updateSinger(Singer singer);

    /**
     * 批量删除歌手信息
     * 
     * @param sinIds 需要删除的歌手信息ID
     * @return 结果
     */
    public int deleteSingerByIds(Long[] sinIds);

    /**
     * 删除歌手信息信息
     * 
     * @param sinId 歌手信息ID
     * @return 结果
     */
    public int deleteSingerById(Long sinId);

    public List<Singer> selectSingerKey(String key);

    /** 获取歌手排名 **/
    public List<Singer> selectSingerRank();

    /** 获取全部歌手排名 **/
    public List<Singer> selectRankAll();

    public Singer selectSingerDetail(Long sinId);

    public List<Songlist> selectSingerAlbum(Long sinId);

    public List<Singer> selectFristPySinName(String fristPy);
}
