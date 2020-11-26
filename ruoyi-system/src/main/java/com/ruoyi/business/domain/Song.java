package com.ruoyi.business.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
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

    /** 歌单封面 */
    @Excel(name = "歌单封面")
    private String coverPicture;

    /** 歌手id */
    @Excel(name = "歌手id")
    private Long sinId;

    private String sinName;

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

    private String lyrUrl;

    private Long todayPlay;

    private Integer playNumber;

    private Integer isOriginal;

    private Integer timbreType;

    private List<Singer> singerList;

    private List<SongType> songTypeList;

    private Songlist songlistes;

    private Long[] stIds;

    private Long[] sinIds;

    /** 删除时间 */
    private Date delTime;

    /** 删除标识符 */
    private Integer delFlag;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getSongId() {
        return songId;
    }

    public void setSongId(Long songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getCoverPicture() {
        return coverPicture;
    }

    public void setCoverPicture(String coverPicture) {
        this.coverPicture = coverPicture;
    }

    public Long getSinId() {
        return sinId;
    }

    public void setSinId(Long sinId) {
        this.sinId = sinId;
    }

    public String getSinName() {
        return sinName;
    }

    public void setSinName(String sinName) {
        this.sinName = sinName;
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    public Date getIssuingDate() {
        return issuingDate;
    }

    public void setIssuingDate(Date issuingDate) {
        this.issuingDate = issuingDate;
    }

    public String getMvUrl() {
        return mvUrl;
    }

    public void setMvUrl(String mvUrl) {
        this.mvUrl = mvUrl;
    }

    public Integer getIsCharge() {
        return isCharge;
    }

    public void setIsCharge(Integer isCharge) {
        this.isCharge = isCharge;
    }

    public Integer getIsCopyright() {
        return isCopyright;
    }

    public void setIsCopyright(Integer isCopyright) {
        this.isCopyright = isCopyright;
    }

    public Integer getIsSingle() {
        return isSingle;
    }

    public void setIsSingle(Integer isSingle) {
        this.isSingle = isSingle;
    }

    public Long getSlId() {
        return slId;
    }

    public void setSlId(Long slId) {
        this.slId = slId;
    }

    public String getStandardUrl() {
        return standardUrl;
    }

    public void setStandardUrl(String standardUrl) {
        this.standardUrl = standardUrl;
    }

    public String getHqUrl() {
        return hqUrl;
    }

    public void setHqUrl(String hqUrl) {
        this.hqUrl = hqUrl;
    }

    public String getSqUrl() {
        return sqUrl;
    }

    public void setSqUrl(String sqUrl) {
        this.sqUrl = sqUrl;
    }

    public String getWitPreUrl() {
        return witPreUrl;
    }

    public void setWitPreUrl(String witPreUrl) {
        this.witPreUrl = witPreUrl;
    }

    public Long getLyrId() {
        return lyrId;
    }

    public void setLyrId(Long lyrId) {
        this.lyrId = lyrId;
    }

    public String getLyrUrl() {
        return lyrUrl;
    }

    public void setLyrUrl(String lyrUrl) {
        this.lyrUrl = lyrUrl;
    }

    public Long getTodayPlay() {
        return todayPlay;
    }

    public void setTodayPlay(Long todayPlay) {
        this.todayPlay = todayPlay;
    }

    public Integer getPlayNumber() {
        return playNumber;
    }

    public void setPlayNumber(Integer playNumber) {
        this.playNumber = playNumber;
    }

    public Integer getIsOriginal() {
        return isOriginal;
    }

    public void setIsOriginal(Integer isOriginal) {
        this.isOriginal = isOriginal;
    }

    public Integer getTimbreType() {
        return timbreType;
    }

    public void setTimbreType(Integer timbreType) {
        this.timbreType = timbreType;
    }

    public List<Singer> getSingerList() {
        return singerList;
    }

    public void setSingerList(List<Singer> singerList) {
        this.singerList = singerList;
    }

    public List<SongType> getSongTypeList() {
        return songTypeList;
    }

    public void setSongTypeList(List<SongType> songTypeList) {
        this.songTypeList = songTypeList;
    }

    public Songlist getSonglistes() {
        return songlistes;
    }

    public void setSonglistes(Songlist songlistes) {
        this.songlistes = songlistes;
    }

    public Long[] getSinIds() {
        return sinIds;
    }

    public void setSinIds(Long[] sinIds) {
        this.sinIds = sinIds;
    }

    public Long[] getStIds() {
        return stIds;
    }

    public void setStIds(Long[] stIds) {
        this.stIds = stIds;
    }

    public Date getDelTime() {
        return delTime;
    }

    public void setDelTime(Date delTime) {
        this.delTime = delTime;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}
