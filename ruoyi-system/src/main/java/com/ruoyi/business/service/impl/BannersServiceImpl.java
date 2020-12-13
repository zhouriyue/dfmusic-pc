package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.BannersMapper;
import com.ruoyi.business.domain.Banners;
import com.ruoyi.business.service.IBannersService;

/**
 * 轮播图管理Service业务层处理
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
@Service
public class BannersServiceImpl implements IBannersService 
{
    @Autowired
    private BannersMapper bannersMapper;

    /**
     * 查询轮播图管理
     * 
     * @param id 轮播图管理ID
     * @return 轮播图管理
     */
    @Override
    public Banners selectBannersById(Long id)
    {
        return bannersMapper.selectBannersById(id);
    }

    /**
     * 查询轮播图管理列表
     * 
     * @param banners 轮播图管理
     * @return 轮播图管理
     */
    @Override
    public List<Banners> selectBannersList(Banners banners)
    {
        return bannersMapper.selectBannersList(banners);
    }

    /**
     * 新增轮播图管理
     * 
     * @param banners 轮播图管理
     * @return 结果
     */
    @Override
    public int insertBanners(Banners banners)
    {
        return bannersMapper.insertBanners(banners);
    }

    /**
     * 修改轮播图管理
     * 
     * @param banners 轮播图管理
     * @return 结果
     */
    @Override
    public int updateBanners(Banners banners)
    {
        return bannersMapper.updateBanners(banners);
    }

    /**
     * 批量删除轮播图管理
     * 
     * @param ids 需要删除的轮播图管理ID
     * @return 结果
     */
    @Override
    public int deleteBannersByIds(Long[] ids)
    {
        return bannersMapper.deleteBannersByIds(ids);
    }

    /**
     * 删除轮播图管理信息
     * 
     * @param id 轮播图管理ID
     * @return 结果
     */
    @Override
    public int deleteBannersById(Long id)
    {
        return bannersMapper.deleteBannersById(id);
    }
}
