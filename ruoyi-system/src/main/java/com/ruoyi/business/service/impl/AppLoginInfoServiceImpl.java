package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.AppLoginInfoMapper;
import com.ruoyi.business.domain.AppLoginInfo;
import com.ruoyi.business.service.IAppLoginInfoService;

/**
 * 登录信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-17
 */
@Service
public class AppLoginInfoServiceImpl implements IAppLoginInfoService 
{
    @Autowired
    private AppLoginInfoMapper appLoginInfoMapper;

    /**
     * 查询登录信息
     * 
     * @param loId 登录信息ID
     * @return 登录信息
     */
    @Override
    public AppLoginInfo selectAppLoginInfoById(Long loId)
    {
        return appLoginInfoMapper.selectAppLoginInfoById(loId);
    }

    /**
     * 查询登录信息列表
     * 
     * @param appLoginInfo 登录信息
     * @return 登录信息
     */
    @Override
    public List<AppLoginInfo> selectAppLoginInfoList(AppLoginInfo appLoginInfo)
    {
        return appLoginInfoMapper.selectAppLoginInfoList(appLoginInfo);
    }

    /**
     * 新增登录信息
     * 
     * @param appLoginInfo 登录信息
     * @return 结果
     */
    @Override
    public int insertAppLoginInfo(AppLoginInfo appLoginInfo)
    {
        return appLoginInfoMapper.insertAppLoginInfo(appLoginInfo);
    }

    /**
     * 修改登录信息
     * 
     * @param appLoginInfo 登录信息
     * @return 结果
     */
    @Override
    public int updateAppLoginInfo(AppLoginInfo appLoginInfo)
    {
        return appLoginInfoMapper.updateAppLoginInfo(appLoginInfo);
    }

    /**
     * 批量删除登录信息
     * 
     * @param loIds 需要删除的登录信息ID
     * @return 结果
     */
    @Override
    public int deleteAppLoginInfoByIds(Long[] loIds)
    {
        return appLoginInfoMapper.deleteAppLoginInfoByIds(loIds);
    }

    /**
     * 删除登录信息信息
     * 
     * @param loId 登录信息ID
     * @return 结果
     */
    @Override
    public int deleteAppLoginInfoById(Long loId)
    {
        return appLoginInfoMapper.deleteAppLoginInfoById(loId);
    }

    @Override
    public Long getTodayActivityNumber() {
        return appLoginInfoMapper.getTodayActivityNumber();
    }
}
