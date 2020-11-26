package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌曲歌单联系对象 song_songlist
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public class SongSonglist extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long slId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long songId;

    /** 专辑 */
    @Excel(name = "专辑")
    private Integer isAlbum;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSlId(Long slId) 
    {
        this.slId = slId;
    }

    public Long getSlId() 
    {
        return slId;
    }
    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
    }
    public void setIsAlbum(Integer isAlbum) 
    {
        this.isAlbum = isAlbum;
    }

    public Integer getIsAlbum() 
    {
        return isAlbum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("slId", getSlId())
            .append("songId", getSongId())
            .append("isAlbum", getIsAlbum())
            .toString();
    }
}
