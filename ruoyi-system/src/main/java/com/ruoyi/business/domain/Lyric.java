package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌词对象 lyric
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Lyric extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 歌词id */
    @Excel(name = "歌词id")
    private Long lyrId;

    /** 歌词名 */
    @Excel(name = "歌词名")
    private String lyrName;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String lyrUrl;

    /** 发行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date issuingDate;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setLyrId(Long lyrId) 
    {
        this.lyrId = lyrId;
    }

    public Long getLyrId() 
    {
        return lyrId;
    }
    public void setLyrName(String lyrName) 
    {
        this.lyrName = lyrName;
    }

    public String getLyrName() 
    {
        return lyrName;
    }
    public void setLyrUrl(String lyrUrl) 
    {
        this.lyrUrl = lyrUrl;
    }

    public String getLyrUrl() 
    {
        return lyrUrl;
    }
    public void setIssuingDate(Date issuingDate) 
    {
        this.issuingDate = issuingDate;
    }

    public Date getIssuingDate() 
    {
        return issuingDate;
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
            .append("lyrId", getLyrId())
            .append("lyrName", getLyrName())
            .append("lyrUrl", getLyrUrl())
            .append("issuingDate", getIssuingDate())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
