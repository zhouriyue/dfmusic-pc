package com.ruoyi.business.domain.vo;

import java.util.Date;

public class SeriesSetMealVo {

    /** 用户ID */
    private Long userId;

    /** 用户ID */
    private Long mId;

    /** 会员天数 */
    private Long validDay;

    /** 创建时间 */
    private Date enrollDate;

    private Long smId;

    private Double costPrice;

    private Integer rechargeMonth;

    public SeriesSetMealVo() {
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getmId() {
        return mId;
    }

    public void setmId(Long mId) {
        this.mId = mId;
    }

    public Long getValidDay() {
        return validDay;
    }

    public void setValidDay(Long validDay) {
        this.validDay = validDay;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public Long getSmId() {
        return smId;
    }

    public void setSmId(Long smId) {
        this.smId = smId;
    }

    public Double getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(Double costPrice) {
        this.costPrice = costPrice;
    }

    public Integer getRechargeMonth() {
        return rechargeMonth;
    }

    public void setRechargeMonth(Integer rechargeMonth) {
        this.rechargeMonth = rechargeMonth;
    }
}
