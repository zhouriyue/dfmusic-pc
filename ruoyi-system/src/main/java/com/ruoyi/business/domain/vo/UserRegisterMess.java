package com.ruoyi.business.domain.vo;

public class UserRegisterMess {

    /** 用户编号 */
    private Long userId;

    private String userName;

    private String password;

    /** 唯一标识 */
    private String openid;

    /** 1:华为账号  */
    private Integer openType;

    private String displayName;

    private String avatorUrl;

    public UserRegisterMess() {
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public Integer getOpenType() {
        return openType;
    }

    public void setOpenType(Integer openType) {
        this.openType = openType;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getAvatorUrl() {
        return avatorUrl;
    }

    public void setAvatorUrl(String avatorUrl) {
        this.avatorUrl = avatorUrl;
    }

    @Override
    public String toString() {
        return "UserRegisterMess{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", openid='" + openid + '\'' +
                ", openType=" + openType +
                ", displayName='" + displayName + '\'' +
                ", avatorUrl='" + avatorUrl + '\'' +
                '}';
    }
}
