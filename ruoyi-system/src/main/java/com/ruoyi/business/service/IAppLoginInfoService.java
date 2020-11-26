package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.AppLoginInfo;

/**
 * 登录信息Service接口
 * 
 * @author ruoyi
 * @date 2020-11-17
 */
public interface IAppLoginInfoService 
{
    /**
     * 查询登录信息
     * 
     * @param loId 登录信息ID
     * @return 登录信息
     */
    public AppLoginInfo selectAppLoginInfoById(Long loId);

    /**
     * 查询登录信息列表
     * 
     * @param appLoginInfo 登录信息
     * @return 登录信息集合
     */
    public List<AppLoginInfo> selectAppLoginInfoList(AppLoginInfo appLoginInfo);

    /**
     * 新增登录信息
     * 
     * @param appLoginInfo 登录信息
     * @return 结果
     */
    public int insertAppLoginInfo(AppLoginInfo appLoginInfo);

    /**
     * 修改登录信息
     * 
     * @param appLoginInfo 登录信息
     * @return 结果
     */
    public int updateAppLoginInfo(AppLoginInfo appLoginInfo);

    /**
     * 批量删除登录信息
     * 
     * @param loIds 需要删除的登录信息ID
     * @return 结果
     */
    public int deleteAppLoginInfoByIds(Long[] loIds);

    /**
     * 删除登录信息信息
     * 
     * @param loId 登录信息ID
     * @return 结果
     */
    public int deleteAppLoginInfoById(Long loId);

    /** 获取app今天的活动量**/
    public Long getTodayActivityNumber();
}
