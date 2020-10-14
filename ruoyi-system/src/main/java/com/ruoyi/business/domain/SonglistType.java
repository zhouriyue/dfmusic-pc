package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌单类型管理对象 songlist_type
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class SonglistType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 歌单类型编号 */
    @Excel(name = "歌单类型编号")
    private Long sltId;

    /** 歌单名称 */
    @Excel(name = "歌单名称")
    private String sltName;

    /** 删除标识符 */
    private Integer delFlag;

    /** 删除时间 */
    private Date delTime;

    public void setSltId(Long sltId) 
    {
        this.sltId = sltId;
    }

    public Long getSltId() 
    {
        return sltId;
    }
    public void setSltName(String sltName) 
    {
        this.sltName = sltName;
    }

    public String getSltName() 
    {
        return sltName;
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
            .append("sltId", getSltId())
            .append("sltName", getSltName())
            .append("delFlag", getDelFlag())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .toString();
    }
}
