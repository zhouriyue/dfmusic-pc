package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 特权对象 privilege
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Privilege extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 特权编号 */
    @Excel(name = "特权编号")
    private Long priId;

    /** 特权名 */
    @Excel(name = "特权名")
    private String priName;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setPriId(Long priId) 
    {
        this.priId = priId;
    }

    public Long getPriId() 
    {
        return priId;
    }
    public void setPriName(String priName) 
    {
        this.priName = priName;
    }

    public String getPriName() 
    {
        return priName;
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
            .append("priId", getPriId())
            .append("priName", getPriName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
