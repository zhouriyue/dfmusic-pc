package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.SongSinger;

/**
 * 歌曲歌手联系Service接口
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public interface ISongSingerService 
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
     * 批量删除歌曲歌手联系
     * 
     * @param ids 需要删除的歌曲歌手联系ID
     * @return 结果
     */
    public int deleteSongSingerByIds(Long[] ids);

    /**
     * 删除歌曲歌手联系信息
     * 
     * @param id 歌曲歌手联系ID
     * @return 结果
     */
    public int deleteSongSingerById(Long id);

    public int deleteIdSlId(SongSinger songSinger);
}
