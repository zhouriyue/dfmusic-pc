package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.business.domain.vo.UserDetailVo;
import com.ruoyi.common.core.domain.entity.SysUser;
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

    /** 会员编号 */
    @Excel(name = "会员天数")
    private Long validDay;

    /** 等级 */
    @Excel(name = "等级")
    private Integer mGrade;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    private String userName;

    private SysUser sysUser;

    private UserDetailVo userDetailVo;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date enrollDate;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public Member() {
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

    public Integer getmGrade() {
        return mGrade;
    }

    public void setmGrade(Integer mGrade) {
        this.mGrade = mGrade;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public UserDetailVo getUserDetailVo() {
        return userDetailVo;
    }

    public void setUserDetailVo(UserDetailVo userDetailVo) {
        this.userDetailVo = userDetailVo;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public Date getDelTime() {
        return delTime;
    }

    public void setDelTime(Date delTime) {
        this.delTime = delTime;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public String toString() {
        return "Member{" +
                "mId=" + mId +
                ", validDay=" + validDay +
                ", mGrade=" + mGrade +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", sysUser=" + sysUser +
                ", userDetailVo=" + userDetailVo +
                ", enrollDate=" + enrollDate +
                ", delTime=" + delTime +
                ", delFlag=" + delFlag +
                '}';
    }
}
