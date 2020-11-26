package com.ruoyi.business.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 套餐信息管理对象 set_meal
 * 
 * @author ruoyi
 * @date 2020-11-01
 */
public class SetMeal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 唯一标识 */
    private Long smId;

    /** 套餐名 */
    @Excel(name = "套餐名")
    private String smName;

    /** 当前价格 */
    @Excel(name = "当前价格")
    private Double currentPrices;

    /** 原价 */
    @Excel(name = "原价")
    private Double costPrice;

    /** 充值月数 */
    @Excel(name = "充值月数")
    private Integer rechargeDay;

    /** 套餐类型 */
    @Excel(name = "套餐类型")
    private Integer smType;

    /** 详情 */
    @Excel(name = "详情")
    private String detail;

    /** 连续包月 */
    @Excel(name = "连续包月")
    private Integer isSeries;

    public void setSmId(Long smId) 
    {
        this.smId = smId;
    }

    public Long getSmId() 
    {
        return smId;
    }
    public void setSmName(String smName) 
    {
        this.smName = smName;
    }

    public String getSmName() 
    {
        return smName;
    }
    public void setCurrentPrices(Double currentPrices)
    {
        this.currentPrices = currentPrices;
    }

    public Double getCurrentPrices()
    {
        return currentPrices;
    }
    public void setCostPrice(Double costPrice)
    {
        this.costPrice = costPrice;
    }

    public Double getCostPrice()
    {
        return costPrice;
    }

    public Integer getRechargeDay() {
        return rechargeDay;
    }

    public void setRechargeDay(Integer rechargeDay) {
        this.rechargeDay = rechargeDay;
    }

    public void setSmType(Integer smType) {
        this.smType = smType;
    }

    public Integer getSmType()
    {
        return smType;
    }
    public void setDetail(String detail) 
    {
        this.detail = detail;
    }

    public String getDetail() 
    {
        return detail;
    }

    public Integer getIsSeries() {
        return isSeries;
    }

    public void setIsSeries(Integer isSeries) {
        this.isSeries = isSeries;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("smId", getSmId())
            .append("smName", getSmName())
            .append("currentPrices", getCurrentPrices())
            .append("costPrice", getCostPrice())
            .append("rechargeMonth", getRechargeDay())
            .append("smType", getSmType())
            .append("detail", getDetail())
                .append("isSeries", getIsSeries())
            .toString();
    }
}
