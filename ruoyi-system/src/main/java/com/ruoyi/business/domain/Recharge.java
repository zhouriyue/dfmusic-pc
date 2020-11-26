package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 充值管理对象 recharge
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
public class Recharge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 充值id */
    private Long recId;

    private Long mId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    private String userName;

    /** 充值金额 */
    @Excel(name = "充值金额")
    private Long amount;

    /** 套餐编号 */
    @Excel(name = "套餐编号")
    private Long smId;

    /** 是否包月 */
    @Excel(name = "是否包月")
    private Integer isSeries;

    /** 充值天数 */
    @Excel(name = "充值天数")
    private Integer rechargeDay;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    private SetMeal setMeal;

    private SysUser sysUser;

    public void setRecId(Long recId) 
    {
        this.recId = recId;
    }

    public Long getRecId() 
    {
        return recId;
    }

    public Long getmId() {
        return mId;
    }

    public void setmId(Long mId) {
        this.mId = mId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setAmount(Long amount)
    {
        this.amount = amount;
    }

    public Long getAmount() 
    {
        return amount;
    }
    public void setSmId(Long smId) 
    {
        this.smId = smId;
    }

    public Long getSmId() 
    {
        return smId;
    }
    public void setIsSeries(Integer isSeries) 
    {
        this.isSeries = isSeries;
    }

    public Integer getIsSeries() 
    {
        return isSeries;
    }
    public void setRechargeDay(Integer rechargeDay) 
    {
        this.rechargeDay = rechargeDay;
    }

    public Integer getRechargeDay() 
    {
        return rechargeDay;
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

    public SetMeal getSetMeal() {
        return setMeal;
    }

    public void setSetMeal(SetMeal setMeal) {
        this.setMeal = setMeal;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recId", getRecId())
            .append("userId", getUserId())
            .append("amount", getAmount())
            .append("smId", getSmId())
            .append("isSeries", getIsSeries())
            .append("rechargeDay", getRechargeDay())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
