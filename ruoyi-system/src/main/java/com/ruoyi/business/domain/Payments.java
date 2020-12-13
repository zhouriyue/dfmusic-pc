package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 支付管理对象 payments
 * 
 * @author ruoyi
 * @date 2020-11-28
 */
public class Payments extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 支付方式ip */
    private Long paId;

    /** 支付方式名 */
    @Excel(name = "支付方式名")
    private String paName;

    /** 图标 */
    @Excel(name = "图标")
    private String icon;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 更新时间 */
    private Date updateDate;

    /** 删除时间 */
    private Date delDate;

    public void setPaId(Long paId) 
    {
        this.paId = paId;
    }

    public Long getPaId() 
    {
        return paId;
    }
    public void setPaName(String paName) 
    {
        this.paName = paName;
    }

    public String getPaName() 
    {
        return paName;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setUpdateDate(Date updateDate) 
    {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() 
    {
        return updateDate;
    }
    public void setDelDate(Date delDate) 
    {
        this.delDate = delDate;
    }

    public Date getDelDate() 
    {
        return delDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("paId", getPaId())
            .append("paName", getPaName())
            .append("icon", getIcon())
            .append("status", getStatus())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("delDate", getDelDate())
            .toString();
    }
}
