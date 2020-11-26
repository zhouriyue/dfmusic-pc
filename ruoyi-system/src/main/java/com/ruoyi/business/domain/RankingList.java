package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * 排行榜管理对象 ranking_list
 * 
 * @author ruoyi
 * @date 2020-11-14
 */
public class RankingList extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long rlId;

    /** 排行榜名称 */
    @Excel(name = "排行榜名称")
    private String rlName;

    /** 是否是官方 */
    @Excel(name = "是否是官方")
    private Integer isOff;

    /** 排行榜图片 */
    @Excel(name = "排行榜图片")
    private String slPicture;

    /** $column.columnComment */
    @Excel(name = "排行榜图片")
    private Integer rlType;

    private Integer playNumber;

    private Date createDate;

    private String detail;

    /** 歌单列表 **/
    private List<Song> songList;

    public void setRlId(Long rlId) 
    {
        this.rlId = rlId;
    }

    public Long getRlId() 
    {
        return rlId;
    }
    public void setRlName(String rlName) 
    {
        this.rlName = rlName;
    }

    public String getRlName() 
    {
        return rlName;
    }
    public void setIsOff(Integer isOff) 
    {
        this.isOff = isOff;
    }

    public Integer getIsOff() 
    {
        return isOff;
    }
    public void setSlPicture(String slPicture) 
    {
        this.slPicture = slPicture;
    }

    public String getSlPicture() 
    {
        return slPicture;
    }
    public void setRlType(Integer rlType) 
    {
        this.rlType = rlType;
    }

    public Integer getRlType() 
    {
        return rlType;
    }

    public List<Song> getSongList() {
        return songList;
    }

    public void setSongList(List<Song> songList) {
        this.songList = songList;
    }

    public Integer getPlayNumber() {
        return playNumber;
    }

    public void setPlayNumber(Integer playNumber) {
        this.playNumber = playNumber;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rlId", getRlId())
            .append("rlName", getRlName())
            .append("isOff", getIsOff())
            .append("slPicture", getSlPicture())
            .append("rlType", getRlType())
            .toString();
    }
}
