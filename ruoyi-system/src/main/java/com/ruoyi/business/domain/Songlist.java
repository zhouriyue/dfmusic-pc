package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌单对象 songlist
 * 
 * @author zhouriyue
 * @date 2020-10-09
 */
public class Songlist extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 歌单id */
    private Long slId;

    /** 歌单名 */
    @Excel(name = "歌单名")
    private String slName;

    /** 歌单封面 */
    @Excel(name = "歌单封面")
    private String coverPicture;

    /** 标题 */
    @Excel(name = "标题")
    private String slTitle;

    /** 播放量 */
    @Excel(name = "播放量")
    private Integer playNumber;

    /** 歌曲数 */
    @Excel(name = "歌曲数")
    private Integer songNumber;

    /** 收藏量 */
    @Excel(name = "收藏量")
    private Integer colNumber;

    /** 评论量 */
    @Excel(name = "评论量")
    private Integer commentsNumber;

    /** 分享量 */
    @Excel(name = "分享量")
    private Integer shareNumber;

    /** 详情 */
    @Excel(name = "详情")
    private String detail;

    /** 是否是专辑 */
    @Excel(name = "是否是专辑")
    private Integer isAlbum;

    /** 歌手 */
    @Excel(name = "歌手")
    private Long sinId;

    /** 是否公开 */
    @Excel(name = "是否公开")
    private String isPublic;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setSlId(Long slId) 
    {
        this.slId = slId;
    }

    public Long getSlId() 
    {
        return slId;
    }
    public void setSlName(String slName) 
    {
        this.slName = slName;
    }

    public String getSlName() 
    {
        return slName;
    }
    public void setCoverPicture(String coverPicture) 
    {
        this.coverPicture = coverPicture;
    }

    public String getCoverPicture() 
    {
        return coverPicture;
    }
    public void setSlTitle(String slTitle) 
    {
        this.slTitle = slTitle;
    }

    public String getSlTitle() 
    {
        return slTitle;
    }
    public void setPlayNumber(Integer playNumber) 
    {
        this.playNumber = playNumber;
    }

    public Integer getPlayNumber() 
    {
        return playNumber;
    }
    public void setSongNumber(Integer songNumber) 
    {
        this.songNumber = songNumber;
    }

    public Integer getSongNumber() 
    {
        return songNumber;
    }
    public void setColNumber(Integer colNumber) 
    {
        this.colNumber = colNumber;
    }

    public Integer getColNumber() 
    {
        return colNumber;
    }
    public void setCommentsNumber(Integer commentsNumber) 
    {
        this.commentsNumber = commentsNumber;
    }

    public Integer getCommentsNumber() 
    {
        return commentsNumber;
    }
    public void setShareNumber(Integer shareNumber) 
    {
        this.shareNumber = shareNumber;
    }

    public Integer getShareNumber() 
    {
        return shareNumber;
    }
    public void setDetail(String detail) 
    {
        this.detail = detail;
    }

    public String getDetail() 
    {
        return detail;
    }
    public void setIsAlbum(Integer isAlbum) 
    {
        this.isAlbum = isAlbum;
    }

    public Integer getIsAlbum() 
    {
        return isAlbum;
    }
    public void setSinId(Long sinId) 
    {
        this.sinId = sinId;
    }

    public Long getSinId() 
    {
        return sinId;
    }
    public void setIsPublic(String isPublic) 
    {
        this.isPublic = isPublic;
    }

    public String getIsPublic() 
    {
        return isPublic;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("slId", getSlId())
            .append("slName", getSlName())
            .append("coverPicture", getCoverPicture())
            .append("slTitle", getSlTitle())
            .append("playNumber", getPlayNumber())
            .append("songNumber", getSongNumber())
            .append("colNumber", getColNumber())
            .append("commentsNumber", getCommentsNumber())
            .append("shareNumber", getShareNumber())
            .append("createBy", getCreateBy())
            .append("detail", getDetail())
            .append("isAlbum", getIsAlbum())
            .append("sinId", getSinId())
            .append("isPublic", getIsPublic())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
