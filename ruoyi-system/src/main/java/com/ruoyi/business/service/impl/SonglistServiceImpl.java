package com.ruoyi.business.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.business.domain.Song;
import com.ruoyi.business.domain.SongSonglist;
import com.ruoyi.business.domain.Songlist;
import com.ruoyi.business.domain.vo.SonglistdetailVo;
import com.ruoyi.business.mapper.SonglistMapper;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.ISonglistService;

/**
 * 歌单Service业务层处理
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
@Service
public class SonglistServiceImpl implements ISonglistService 
{
    @Autowired
    private SonglistMapper songlistMapper;

    /**
     * 查询歌单
     * 
     * @param slId 歌单ID
     * @return 歌单
     */
    @Override
    public Songlist selectSonglistById(Long slId)
    {
        return songlistMapper.selectSonglistById(slId);
    }

    /**
     * 查询歌单列表
     * 
     * @param songlist 歌单
     * @return 歌单
     */
    @Override
    public List<Songlist> selectSonglistList(Songlist songlist)
    {
        return songlistMapper.selectSonglistList(songlist);
    }

    /**
     * 新增歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    @Override
    public int insertSonglist(Songlist songlist)
    {
        songlist.setCreateTime(DateUtils.getNowDate());
        return songlistMapper.insertSonglist(songlist);
    }

    /**
     * 修改歌单
     * 
     * @param songlist 歌单
     * @return 结果
     */
    @Override
    public int updateSonglist(Songlist songlist)
    {
        songlist.setUpdateTime(DateUtils.getNowDate());
        return songlistMapper.updateSonglist(songlist);
    }

    /**
     * 批量删除歌单
     * 
     * @param slIds 需要删除的歌单ID
     * @return 结果
     */
    @Override
    public int deleteSonglistByIds(Long[] slIds)
    {
        return songlistMapper.deleteSonglistByIds(slIds);
    }

    /**
     * 删除歌单信息
     * 
     * @param slId 歌单ID
     * @return 结果
     */
    @Override
    public int deleteSonglistById(Long slId)
    {
        return songlistMapper.deleteSonglistById(slId);
    }

    @Override
    public int deleteSonglisSong(Long slId) {
        return 0;
    }

    @Override
    public List<Song> selectSongList(Long slId) {
        return songlistMapper.selectSongList(slId);
    }

    @Override
    public int addToSonglist(Long slId, Long songId) {
        return songlistMapper.addToSonglist(slId,songId);
    }

    @Override
    public SongSonglist selectSonglistSong(Long slId, Long songId) {
        return songlistMapper.selectSonglistSong(slId,songId);
    }

    @Override
    public List<Song> getIndexSong(Integer slId) {
        return songlistMapper.getIndexSong(slId);
    }

    @Override
    public List<SonglistdetailVo> getSonglistDetail(Songlist songlist) {
        return songlistMapper.getSonglistDetail(songlist);
    }

    @Override
    public long deleteSonglistSong(Long slId, Long songId) {
        return songlistMapper.deleteSonglistSong(slId,songId);
    }

    public List<Song> selectSongDetail(Long slId){
        return songlistMapper.selectSongDetail(slId);
    }

    @Override
    public SysUser selectUserSonglist(Long slId) {
        return songlistMapper.selectUserSonglist(slId);
    }

    @Override
    public List<Songlist> searchSonglist(String wordKey, Date createTime, Integer isAlbum) {
        return songlistMapper.searchSonglist(wordKey,createTime,isAlbum);
    }

    @Override
    public Long addSongToSl(Long slId,Integer isAlbum, Long[] songIds) {
        return songlistMapper.addSongToSl(slId,isAlbum,songIds);
    }

    @Override
    public List<Songlist> getHotSonglist(int pageNum,int size) {
        return songlistMapper.getHotSonglist(pageNum,size);
    }
}
