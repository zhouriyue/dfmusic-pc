package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单管理对象 t_order
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
public class TOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单编号 */
    private Long oId;

    /** 支付状态 */
    @Excel(name = "支付状态")
    private Long orderState;

    /** 金额 */
    @Excel(name = "金额")
    private Integer amount;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 是否包月 */
    @Excel(name = "是否包月")
    private Integer isSeries;

    /** 购买歌曲 */
    @Excel(name = "购买歌曲")
    private Long songId;

    /** 删除时间 */
    private Date delTime;

    /** 是否删除 */
    private Integer delFlag;

    private SysUser sysUser;

    private Song song;

    public void setoId(Long oId) 
    {
        this.oId = oId;
    }

    public Long getoId() 
    {
        return oId;
    }
    public void setOrderState(Long orderState) 
    {
        this.orderState = orderState;
    }

    public Long getOrderState() 
    {
        return orderState;
    }
    public void setAmount(Integer amount) 
    {
        this.amount = amount;
    }

    public Integer getAmount() 
    {
        return amount;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setIsSeries(Integer isSeries) 
    {
        this.isSeries = isSeries;
    }

    public Integer getIsSeries() 
    {
        return isSeries;
    }
    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
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

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("oId", getoId())
            .append("orderState", getOrderState())
            .append("amount", getAmount())
            .append("userId", getUserId())
            .append("isSeries", getIsSeries())
            .append("songId", getSongId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
