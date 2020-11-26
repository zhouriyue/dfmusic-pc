package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.SongSinger;
import org.apache.ibatis.annotations.Param;

/**
 * 歌曲歌手联系Mapper接口
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public interface SongSingerMapper 
{
    /**
     * 查询歌曲歌手联系
     * 
     * @param id 歌曲歌手联系ID
     * @return 歌曲歌手联系
     */
    public SongSinger selectSongSingerById(Long id);

    /**
     * 查询歌曲歌手联系列表
     * 
     * @param songSinger 歌曲歌手联系
     * @return 歌曲歌手联系集合
     */
    public List<SongSinger> selectSongSingerList(SongSinger songSinger);

    /**
     * 新增歌曲歌手联系
     * 
     * @param songSinger 歌曲歌手联系
     * @return 结果
     */
    public int insertSongSinger(SongSinger songSinger);

    /**
     * 修改歌曲歌手联系
     * 
     * @param songSinger 歌曲歌手联系
     * @return 结果
     */
    public int updateSongSinger(SongSinger songSinger);

    /**
     * 删除歌曲歌手联系
     * 
     * @param id 歌曲歌手联系ID
     * @return 结果
     */
    public int deleteSongSingerById(Long id);

    /**
     * 批量删除歌曲歌手联系
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSongSingerByIds(Long[] ids);

    public int deleteIdSlId(SongSinger songSinger);
}
