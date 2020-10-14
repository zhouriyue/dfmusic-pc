package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会员信息管理对象 member
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Member extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会员编号 */
    @Excel(name = "会员编号")
    private Long mId;

    /** 等级 */
    @Excel(name = "等级")
    private Integer mGrade;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setmId(Long mId) 
    {
        this.mId = mId;
    }

    public Long getmId() 
    {
        return mId;
    }
    public void setmGrade(Integer mGrade) 
    {
        this.mGrade = mGrade;
    }

    public Integer getmGrade() 
    {
        return mGrade;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
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
            .append("mId", getmId())
            .append("mGrade", getmGrade())
            .append("userId", getUserId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
