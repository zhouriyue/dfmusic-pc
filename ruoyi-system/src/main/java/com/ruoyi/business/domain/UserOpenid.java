package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 一键登录关联对象 user_openid
 * 
 * @author ruoyi
 * @date 2020-11-05
 */
public class UserOpenid extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 用户编号 */
    @Excel(name = "用户编号")
    private Long userId;

    /** 唯一标识 */
    @Excel(name = "唯一标识")
    private String openid;

    /** 1:华为账号  */
    @Excel(name = "1:华为账号 ")
    private Integer openType;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setOpenid(String openid) 
    {
        this.openid = openid;
    }

    public String getOpenid() 
    {
        return openid;
    }
    public void setOpenType(Integer openType) 
    {
        this.openType = openType;
    }

    public Integer getOpenType() 
    {
        return openType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("openid", getOpenid())
            .append("openType", getOpenType())
            .toString();
    }
}
