package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Banners;

/**
 * 轮播图管理Service接口
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
public interface IBannersService 
{
    /**
     * 查询轮播图管理
     * 
     * @param id 轮播图管理ID
     * @return 轮播图管理
     */
    public Banners selectBannersById(Long id);

    /**
     * 查询轮播图管理列表
     * 
     * @param banners 轮播图管理
     * @return 轮播图管理集合
     */
    public List<Banners> selectBannersList(Banners banners);

    /**
     * 新增轮播图管理
     * 
     * @param banners 轮播图管理
     * @return 结果
     */
    public int insertBanners(Banners banners);

    /**
     * 修改轮播图管理
     * 
     * @param banners 轮播图管理
     * @return 结果
     */
    public int updateBanners(Banners banners);

    /**
     * 批量删除轮播图管理
     * 
     * @param ids 需要删除的轮播图管理ID
     * @return 结果
     */
    public int deleteBannersByIds(Long[] ids);

    /**
     * 删除轮播图管理信息
     * 
     * @param id 轮播图管理ID
     * @return 结果
     */
    public int deleteBannersById(Long id);
}
