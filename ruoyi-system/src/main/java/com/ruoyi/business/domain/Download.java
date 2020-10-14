package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 下载信息对象 download
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Download extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 下载id */
    @Excel(name = "下载id")
    private Long dlId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 歌曲id */
    @Excel(name = "歌曲id")
    private Long songId;

    /** 下载音质 */
    @Excel(name = "下载音质")
    private String toneQuality;

    /** 下载时长 */
    @Excel(name = "下载时长")
    private Integer dlLenght;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setDlId(Long dlId) 
    {
        this.dlId = dlId;
    }

    public Long getDlId() 
    {
        return dlId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
    }
    public void setToneQuality(String toneQuality) 
    {
        this.toneQuality = toneQuality;
    }

    public String getToneQuality() 
    {
        return toneQuality;
    }
    public void setDlLenght(Integer dlLenght) 
    {
        this.dlLenght = dlLenght;
    }

    public Integer getDlLenght() 
    {
        return dlLenght;
    }
    public void setDelTime(Date delTime) 
    {
        this.delTime = delTime;
    }

    public Date getDelTime() 
    {
        return delTime;
    }
    public void setDelFlag(Integer delFlag) 
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dlId", getDlId())
            .append("userId", getUserId())
            .append("songId", getSongId())
            .append("toneQuality", getToneQuality())
            .append("dlLenght", getDlLenght())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
