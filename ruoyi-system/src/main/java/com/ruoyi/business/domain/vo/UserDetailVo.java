package com.ruoyi.business.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysUser;

import java.util.Date;

public class UserDetailVo extends BaseEntity {

    /** 用户ID */
    @Excel(name = "用户序号", cellType = Excel.ColumnType.NUMERIC, prompt = "用户编号")
    private Long userId;

    /** 用户账号 */
    @Excel(name = "登录名称")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户名称")
    private String nickName;

    /** 用户邮箱 */
    @Excel(name = "用户邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 用户性别 */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 用户头像 */
    private String avatar;

    /** 用户简介 */
    private String detail;

    /** 生日 */
    private Date birthday;

    /** 是否是会员*/
    private Integer isMember;

    /** 住址 */
    private String address;

    /** 背景图片 */
    private String perBg;

    /** 创建时间 */
    private Date createTime;

    /** 会员编号 */
    @Excel(name = "会员编号")
    private Long mId;

    /** 会员编号 */
    @Excel(name = "会员天数")
    private Long validDay;

    /** 等级 */
    @Excel(name = "等级")
    private Integer mGrade;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date enrollDate;

    public UserDetailVo() {
    }

    public void setUserDetailVo(SysUser sysUser) {
        this.userId = sysUser.getUserId();
        this.userName = sysUser.getUserName();
        this.nickName = sysUser.getNickName();
        this.avatar = sysUser.getAvatar();
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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPerBg() {
        return perBg;
    }

    public void setPerBg(String perBg) {
        this.perBg = perBg;
    }

    public Integer getIsMember() {
        return isMember;
    }

    public void setIsMember(Integer isMember) {
        this.isMember = isMember;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    @Override
    public String toString() {
        return "UserDetailVo{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", nickName='" + nickName + '\'' +
                ", email='" + email + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", sex='" + sex + '\'' +
                ", avatar='" + avatar + '\'' +
                ", detail='" + detail + '\'' +
                ", birthday=" + birthday +
                ", isMember=" + isMember +
                ", address='" + address + '\'' +
                ", perBg='" + perBg + '\'' +
                ", createTime=" + createTime +
                ", mId=" + mId +
                ", validDay=" + validDay +
                ", mGrade=" + mGrade +
                ", enrollDate=" + enrollDate +
                '}';
    }
}
