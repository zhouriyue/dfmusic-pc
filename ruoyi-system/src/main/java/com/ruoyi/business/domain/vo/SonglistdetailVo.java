package com.ruoyi.business.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 歌单详细信息值对象
 */
public class SonglistdetailVo extends BaseEntity {

    /** 歌单id */
    private Long slId;

    /** 歌单名 */
    @Excel(name = "歌单名")
    private String slName;

    /** 歌单封面 */
    @Excel(name = "歌单封面")
    private String coverPicture;

    /** 播放量 */
    @Excel(name = "播放量")
    private Integer playNumber;

    /** 歌曲数 */
    @Excel(name = "歌曲数")
    private Integer songNumber;

    /** 创建者 */
    @Excel(name = "创建者")
    private Long createById;

    /** 用户账号 */
    @Excel(name = "用户名")
    private String userName;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickName;

    /** 详情 */
    @Excel(name = "详情")
    private String detail;

    /** 是否是专辑 */
    @Excel(name = "是否是专辑")
    private Integer isAlbum;

    /** 是否公开 */
    @Excel(name = "是否公开")
    private Integer isPublic;

    public SonglistdetailVo() {
    }

    public Long getSlId() {
        return slId;
    }

    public void setSlId(Long slId) {
        this.slId = slId;
    }

    public String getSlName() {
        return slName;
    }

    public void setSlName(String slName) {
        this.slName = slName;
    }

    public String getCoverPicture() {
        return coverPicture;
    }

    public void setCoverPicture(String coverPicture) {
        this.coverPicture = coverPicture;
    }

    public Integer getPlayNumber() {
        return playNumber;
    }

    public void setPlayNumber(Integer playNumber) {
        this.playNumber = playNumber;
    }

    public Integer getSongNumber() {
        return songNumber;
    }

    public void setSongNumber(Integer songNumber) {
        this.songNumber = songNumber;
    }

    public Long getCreateById() {
        return createById;
    }

    public void setCreateById(Long createById) {
        this.createById = createById;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getIsAlbum() {
        return isAlbum;
    }

    public void setIsAlbum(Integer isAlbum) {
        this.isAlbum = isAlbum;
    }

    public Integer getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(Integer isPublic) {
        this.isPublic = isPublic;
    }

    @Override
    public String toString() {
        return "SonglistdetailVo{" +
                "slId=" + slId +
                ", slName='" + slName + '\'' +
                ", coverPicture='" + coverPicture + '\'' +
                ", playNumber=" + playNumber +
                ", songNumber=" + songNumber +
                ", createById=" + createById +
                ", userName='" + userName + '\'' +
                ", nickName='" + nickName + '\'' +
                ", detail='" + detail + '\'' +
                ", isAlbum=" + isAlbum +
                ", isPublic=" + isPublic +
                '}';
    }
}
