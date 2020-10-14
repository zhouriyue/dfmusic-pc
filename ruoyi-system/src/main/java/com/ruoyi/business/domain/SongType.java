package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌曲类型对象 song_type
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class SongType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 类型id */
    @Excel(name = "类型id")
    private Long stId;

    /** 类型名 */
    @Excel(name = "类型名")
    private String stName;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setStId(Long stId) 
    {
        this.stId = stId;
    }

    public Long getStId() 
    {
        return stId;
    }
    public void setStName(String stName) 
    {
        this.stName = stName;
    }

    public String getStName() 
    {
        return stName;
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
            .append("stId", getStId())
            .append("stName", getStName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
