package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评论管理对象 comment
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Comment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评论编号 */
    @Excel(name = "评论编号")
    private Long comId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 评论类型 */
    @Excel(name = "评论类型")
    private Integer cType;

    /** 歌曲编号 */
    @Excel(name = "歌曲编号")
    private Long songId;

    /** 歌单编号 */
    @Excel(name = "歌单编号")
    private Long slId;

    /** 评论内容 */
    private String content;

    /** 点赞量 */
    private Integer likeNumber;

    /** 回放量 */
    private Integer beAnswerNumber;

    /** 回复人 */
    @Excel(name = "回复人")
    private Long beAnswer;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setComId(Long comId) 
    {
        this.comId = comId;
    }

    public Long getComId() 
    {
        return comId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setcType(Integer cType) 
    {
        this.cType = cType;
    }

    public Integer getcType() 
    {
        return cType;
    }
    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
    }
    public void setSlId(Long slId) 
    {
        this.slId = slId;
    }

    public Long getSlId() 
    {
        return slId;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setLikeNumber(Integer likeNumber) 
    {
        this.likeNumber = likeNumber;
    }

    public Integer getLikeNumber() 
    {
        return likeNumber;
    }
    public void setBeAnswerNumber(Integer beAnswerNumber) 
    {
        this.beAnswerNumber = beAnswerNumber;
    }

    public Integer getBeAnswerNumber() 
    {
        return beAnswerNumber;
    }
    public void setBeAnswer(Long beAnswer) 
    {
        this.beAnswer = beAnswer;
    }

    public Long getBeAnswer() 
    {
        return beAnswer;
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
            .append("comId", getComId())
            .append("userId", getUserId())
            .append("cType", getcType())
            .append("songId", getSongId())
            .append("slId", getSlId())
            .append("content", getContent())
            .append("likeNumber", getLikeNumber())
            .append("beAnswerNumber", getBeAnswerNumber())
            .append("beAnswer", getBeAnswer())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
