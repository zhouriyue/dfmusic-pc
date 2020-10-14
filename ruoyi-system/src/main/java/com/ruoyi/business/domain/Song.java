package com.ruoyi.business.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 歌曲对象 song
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public class Song extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 歌曲id */
    @Excel(name = "歌曲id")
    private Long songId;

    /** 歌曲名 */
    @Excel(name = "歌曲名")
    private String songName;

    /** 歌手id */
    @Excel(name = "歌手id")
    private Long sinId;

    /** 时长 */
    @Excel(name = "时长")
    private Long duration;

    /** 发行时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发行时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date issuingDate;

    /** mv */
    @Excel(name = "mv")
    private String mvUrl;

    /** 是否收费 */
    @Excel(name = "是否收费")
    private Integer isCharge;

    /** 是否有版权 */
    @Excel(name = "是否有版权")
    private Integer isCopyright;

    /** 是否是单曲 */
    @Excel(name = "是否是单曲")
    private Integer isSingle;

    /** 歌单id */
    @Excel(name = "歌单id")
    private Long slId;

    /** 标注音质(S) */
    @Excel(name = "标注音质(S)")
    private String standardUrl;

    /** 高品质（HQ） */
    @Excel(name = "高品质", readConverterExp = "H=Q")
    private String hqUrl;

    /** 超音质（SQ） */
    @Excel(name = "超音质", readConverterExp = "S=Q")
    private String sqUrl;

    /** 无损（WP） */
    @Excel(name = "无损", readConverterExp = "W=P")
    private String witPreUrl;

    /** 歌词id */
    @Excel(name = "歌词id")
    private Long lyrId;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public void setSongId(Long songId) 
    {
        this.songId = songId;
    }

    public Long getSongId() 
    {
        return songId;
    }
    public void setSongName(String songName) 
    {
        this.songName = songName;
    }

    public String getSongName() 
    {
        return songName;
    }
    public void setSinId(Long sinId) 
    {
        this.sinId = sinId;
    }

    public Long getSinId() 
    {
        return sinId;
    }
    public void setDuration(Long duration) 
    {
        this.duration = duration;
    }

    public Long getDuration() 
    {
        return duration;
    }
    public void setIssuingDate(Date issuingDate) 
    {
        this.issuingDate = issuingDate;
    }

    public Date getIssuingDate() 
    {
        return issuingDate;
    }
    public void setMvUrl(String mvUrl) 
    {
        this.mvUrl = mvUrl;
    }

    public String getMvUrl() 
    {
        return mvUrl;
    }
    public void setIsCharge(Integer isCharge) 
    {
        this.isCharge = isCharge;
    }

    public Integer getIsCharge() 
    {
        return isCharge;
    }
    public void setIsCopyright(Integer isCopyright) 
    {
        this.isCopyright = isCopyright;
    }

    public Integer getIsCopyright() 
    {
        return isCopyright;
    }
    public void setIsSingle(Integer isSingle) 
    {
        this.isSingle = isSingle;
    }

    public Integer getIsSingle() 
    {
        return isSingle;
    }
    public void setSlId(Long slId) 
    {
        this.slId = slId;
    }

    public Long getSlId() 
    {
        return slId;
    }
    public void setStandardUrl(String standardUrl) 
    {
        this.standardUrl = standardUrl;
    }

    public String getStandardUrl() 
    {
        return standardUrl;
    }
    public void setHqUrl(String hqUrl) 
    {
        this.hqUrl = hqUrl;
    }

    public String getHqUrl() 
    {
        return hqUrl;
    }
    public void setSqUrl(String sqUrl) 
    {
        this.sqUrl = sqUrl;
    }

    public String getSqUrl() 
    {
        return sqUrl;
    }
    public void setWitPreUrl(String witPreUrl) 
    {
        this.witPreUrl = witPreUrl;
    }

    public String getWitPreUrl() 
    {
        return witPreUrl;
    }
    public void setLyrId(Long lyrId) 
    {
        this.lyrId = lyrId;
    }

    public Long getLyrId() 
    {
        return lyrId;
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
            .append("songId", getSongId())
            .append("songName", getSongName())
            .append("sinId", getSinId())
            .append("duration", getDuration())
            .append("issuingDate", getIssuingDate())
            .append("mvUrl", getMvUrl())
            .append("isCharge", getIsCharge())
            .append("isCopyright", getIsCopyright())
            .append("isSingle", getIsSingle())
            .append("slId", getSlId())
            .append("standardUrl", getStandardUrl())
            .append("hqUrl", getHqUrl())
            .append("sqUrl", getSqUrl())
            .append("witPreUrl", getWitPreUrl())
            .append("lyrId", getLyrId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delTime", getDelTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
