package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Singer;
import com.ruoyi.business.domain.Songlist;
import org.apache.ibatis.annotations.Param;

/**
 * 歌手信息Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface SingerMapper 
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
     * 删除歌手信息
     * 
     * @param sinId 歌手信息ID
     * @return 结果
     */
    public int deleteSingerById(Long sinId);

    /**
     * 批量删除歌手信息
     * 
     * @param sinIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSingerByIds(Long[] sinIds);

    public List<Singer> selectSingerKey(@Param("sinId") Integer sinId,@Param("key") String key);

    public List<Singer> selectSingerRank();

    public List<Singer> selectRankAll();

    public Singer selectSingerDetail(Long sinId);

    public List<Songlist> selectSingerAlbum(Long sinId);

    public List<Singer> selectFristPySinName(@Param("fristPy") String fristPy);
}
