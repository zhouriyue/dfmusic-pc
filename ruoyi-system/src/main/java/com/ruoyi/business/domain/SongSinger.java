package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌曲歌手联系对象 song_singer
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public class SongSinger extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 歌单编号 */
    @Excel(name = "歌单编号")
    private Long songId;

    /** 歌手编号 */
    @Excel(name = "歌手编号")
    private Long sinId;

    public boolean isLike(SongSinger songSinger) {
        if(this.songId == songSinger.getSongId()&&this.sinId==songSinger.getSinId()){
            return true;
        } else {
            return false;
        }
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
    }
    public void setSinId(Long sinId) 
    {
        this.sinId = sinId;
    }

    public Long getSinId() 
    {
        return sinId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("songId", getSongId())
            .append("sinId", getSinId())
            .toString();
    }
}
