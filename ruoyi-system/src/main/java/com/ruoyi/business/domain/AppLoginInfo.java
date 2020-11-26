package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 登录信息对象 app_login_info
 * 
 * @author ruoyi
 * @date 2020-11-17
 */
public class AppLoginInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 登录编号 */
    private Long loId;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 登录地点 */
    @Excel(name = "登录地点")
    private String loginLocation;

    /** 操作系统 */
    @Excel(name = "操作系统")
    private String os;

    /** 登录状态(0成功，1失败） */
    @Excel(name = "登录状态(0成功，1失败）")
    private String status;

    /** 提示消息 */
    @Excel(name = "提示消息")
    private String msg;

    /** 访问时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "访问时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date loginTime;

    public void setLoId(Long loId) 
    {
        this.loId = loId;
    }

    public Long getLoId() 
    {
        return loId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setLoginLocation(String loginLocation) 
    {
        this.loginLocation = loginLocation;
    }

    public String getLoginLocation() 
    {
        return loginLocation;
    }
    public void setOs(String os) 
    {
        this.os = os;
    }

    public String getOs() 
    {
        return os;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setMsg(String msg) 
    {
        this.msg = msg;
    }

    public String getMsg() 
    {
        return msg;
    }
    public void setLoginTime(Date loginTime) 
    {
        this.loginTime = loginTime;
    }

    public Date getLoginTime() 
    {
        return loginTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("loId", getLoId())
            .append("userId", getUserId())
            .append("loginLocation", getLoginLocation())
            .append("os", getOs())
            .append("status", getStatus())
            .append("msg", getMsg())
            .append("loginTime", getLoginTime())
            .toString();
    }
}
