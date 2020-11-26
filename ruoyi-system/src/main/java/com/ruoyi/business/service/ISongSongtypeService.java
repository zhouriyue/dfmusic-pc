package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.SongSongtype;
import com.ruoyi.business.domain.SongType;

/**
 * 歌曲类型联系Service接口
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public interface ISongSongtypeService 
{
    /**
     * 查询歌曲类型联系
     * 
     * @param id 歌曲类型联系ID
     * @return 歌曲类型联系
     */
    public SongSongtype selectSongSongtypeById(Long id);

    /**
     * 查询歌曲类型联系列表
     * 
     * @param songSongtype 歌曲类型联系
     * @return 歌曲类型联系集合
     */
    public List<SongSongtype> selectSongSongtypeList(SongSongtype songSongtype);

    /**
     * 新增歌曲类型联系
     * 
     * @param songSongtype 歌曲类型联系
     * @return 结果
     */
    public int insertSongSongtype(SongSongtype songSongtype);

    /**
     * 修改歌曲类型联系
     * 
     * @param songSongtype 歌曲类型联系
     * @return 结果
     */
    public int updateSongSongtype(SongSongtype songSongtype);

    /**
     * 批量删除歌曲类型联系
     * 
     * @param ids 需要删除的歌曲类型联系ID
     * @return 结果
     */
    public int deleteSongSongtypeByIds(Long[] ids);

    /**
     * 删除歌曲类型联系信息
     * 
     * @param id 歌曲类型联系ID
     * @return 结果
     */
    public int deleteSongSongtypeById(Long id);

    public int deleteSongIdStId(SongSongtype songSongtype);
}
