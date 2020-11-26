package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌曲类型联系对象 song_songtype
 * 
 * @author ruoyi
 * @date 2020-11-19
 */
public class SongSongtype extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 歌曲id */
    @Excel(name = "歌曲id")
    private Long songId;

    /** 歌曲类型id */
    @Excel(name = "歌曲类型id")
    private Long stId;

    /** 删除标识符 */
    private Integer delFlag;

    /** 删除时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "删除时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date delTime;

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
    public void setStId(Long stId) 
    {
        this.stId = stId;
    }

    public Long getStId() 
    {
        return stId;
    }
    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
    {
        return delFlag;
    }
    public void setDelTime(Date delTime) 
    {
        this.delTime = delTime;
    }

    public Date getDelTime() 
    {
        return delTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("songId", getSongId())
            .append("stId", getStId())
            .append("delFlag", getDelFlag())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .toString();
    }
}
