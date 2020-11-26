package com.ruoyi.business.service;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.domain.SongSonglist;
import com.ruoyi.business.domain.Songlist;
import com.ruoyi.business.domain.vo.SonglistdetailVo;
import com.ruoyi.common.core.domain.entity.SysUser;

import java.util.Date;
import java.util.List;

/**
 * 歌单Service接口
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
public interface ISonglistService 
{
    /**
     * 查询歌单
     * 
     * @param slId 歌单ID
     * @return 歌单
     */
    public Songlist selectSonglistById(Long slId);

    /**
     * 查询歌单列表
     * 
     * @param songlist 歌单
     * @return 歌单集合
     */
    public List<Songlist> selectSonglistList(Songlist songlist);

    /**
     * 新增歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    public int insertSonglist(Songlist songlist);

    /**
     * 修改歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    public int updateSonglist(Songlist songlist);

    /**
     * 批量删除歌单
     * 
     * @param slIds 需要删除的歌单ID
     * @return 结果
     */
    public int deleteSonglistByIds(Long[] slIds);

    /**
     * 删除歌单信息
     * 
     * @param slId 歌单ID
     * @return 结果
     */
    public int deleteSonglistById(Long slId);
    public int deleteSonglisSong(Long slId);

    /**
     * 获取歌单歌曲
     * @param slId
     * @return
     */
    public List<Song> selectSongList(Long slId);

    /**
     * 添加歌曲到歌单
     * @param slId
     * @param songId
     */
    public int addToSonglist(Long slId,Long songId);

    public SongSonglist selectSonglistSong(Long slId, Long songId);

    public List<Song> getIndexSong(Integer slId);

    public List<SonglistdetailVo> getSonglistDetail(Songlist songlist);

    public long deleteSonglistSong(Long slId,Long songId);

    /** 获取歌曲详情 **/
    public List<Song> selectSongDetail(Long slId);

    public SysUser selectUserSonglist(Long slId);

    public List<Songlist> searchSonglist(String wordKey, Date createTime, Integer isAlbum);

    public Long addSongToSl(Long slId,Integer isAlbum,Long[] songIds);
}
