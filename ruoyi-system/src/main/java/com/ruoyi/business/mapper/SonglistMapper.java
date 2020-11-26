package com.ruoyi.business.mapper;

import java.util.Date;
import java.util.List;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.domain.SongSonglist;
import com.ruoyi.business.domain.Songlist;
import com.ruoyi.business.domain.vo.SonglistdetailVo;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.ibatis.annotations.Param;

/**
 * 歌单Mapper接口
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
public interface SonglistMapper 
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
     * 删除歌单
     * 
     * @param slId 歌单ID
     * @return 结果
     */
    public int deleteSonglistById(Long slId);

    /**
     * 批量删除歌单
     * 
     * @param slIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSonglistByIds(Long[] slIds);

    /**
     * 歌单歌曲
     * @param slId
     * @return
     */
    public List<Song> selectSongList(Long slId);

    /**
     * 添加歌曲到歌单
     * @param slId
     * @param songId
     */
    public int addToSonglist(@Param("slId")Long slId, @Param("songId")Long songId);

    public SongSonglist selectSonglistSong(@Param("slId")Long slId, @Param("songId")Long songId);

    public List<Song> getIndexSong(Integer slId);

    public List<SonglistdetailVo> getSonglistDetail(Songlist songlist);

    public long deleteSonglistSong(@Param("slId") Long slId,@Param("songId") Long songId);

    public List<Song> selectSongDetail(Long slId);

    public SysUser selectUserSonglist(Long slId);

    public List<Songlist> searchSonglist(@Param("wordKey") String wordKey,@Param("createTime") Date createTime,@Param("isAlbum") Integer isAlbum);

    public Long addSongToSl(@Param("slId") Long slId,@Param("isAlbum") Integer isAlbum,@Param("songIds") Long[] songIds);

    public Long deleteSonglisSong(Long slId);
}
