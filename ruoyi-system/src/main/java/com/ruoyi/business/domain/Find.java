package com.ruoyi.business.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 发现页管理对象 find
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
public class Find extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 标签名 */
    @Excel(name = "标签名")
    private String toMangy;

    /** 图标 */
    @Excel(name = "图标")
    private String icon;

    /** 类型 */
    @Excel(name = "类型")
    private Integer type;

    private List<Banners> bannersList;

    private List<Songlist> songlists;

    private List<Song> songList;

    private List<SpecialFun> specialFunList;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setToMangy(String toMangy) 
    {
        this.toMangy = toMangy;
    }

    public String getToMangy() 
    {
        return toMangy;
    }
    public void setIcon(String icon) 
    {
        this.icon = icon;
    }

    public String getIcon() 
    {
        return icon;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
    }

    public List<Banners> getBannersList() {
        return bannersList;
    }

    public void setBannersList(List<Banners> bannersList) {
        this.bannersList = bannersList;
    }

    public List<Songlist> getSonglists() {
        return songlists;
    }

    public void setSonglists(List<Songlist> songlists) {
        this.songlists = songlists;
    }

    public List<Song> getSongList() {
        return songList;
    }

    public void setSongList(List<Song> songList) {
        this.songList = songList;
    }

    public List<SpecialFun> getSpecialFunList() {
        return specialFunList;
    }

    public void setSpecialFunList(List<SpecialFun> specialFunList) {
        this.specialFunList = specialFunList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("toMangy", getToMangy())
            .append("icon", getIcon())
            .append("type", getType())
            .toString();
    }
}
