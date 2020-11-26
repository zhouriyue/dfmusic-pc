package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.UserOpenidMapper;
import com.ruoyi.business.domain.UserOpenid;
import com.ruoyi.business.service.IUserOpenidService;

/**
 * 一键登录关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-05
 */
@Service
public class UserOpenidServiceImpl implements IUserOpenidService 
{
    @Autowired
    private UserOpenidMapper userOpenidMapper;

    /**
     * 查询一键登录关联
     * 
     * @param id 一键登录关联ID
     * @return 一键登录关联
     */
    @Override
    public UserOpenid selectUserOpenidById(Long id)
    {
        return userOpenidMapper.selectUserOpenidById(id);
    }

    /**
     * 查询一键登录关联列表
     * 
     * @param userOpenid 一键登录关联
     * @return 一键登录关联
     */
    @Override
    public List<UserOpenid> selectUserOpenidList(UserOpenid userOpenid)
    {
        return userOpenidMapper.selectUserOpenidList(userOpenid);
    }

    /**
     * 新增一键登录关联
     * 
     * @param userOpenid 一键登录关联
     * @return 结果
     */
    @Override
    public int insertUserOpenid(UserOpenid userOpenid)
    {
        return userOpenidMapper.insertUserOpenid(userOpenid);
    }

    /**
     * 修改一键登录关联
     * 
     * @param userOpenid 一键登录关联
     * @return 结果
     */
    @Override
    public int updateUserOpenid(UserOpenid userOpenid)
    {
        return userOpenidMapper.updateUserOpenid(userOpenid);
    }

    /**
     * 批量删除一键登录关联
     * 
     * @param ids 需要删除的一键登录关联ID
     * @return 结果
     */
    @Override
    public int deleteUserOpenidByIds(Long[] ids)
    {
        return userOpenidMapper.deleteUserOpenidByIds(ids);
    }

    /**
     * 删除一键登录关联信息
     * 
     * @param id 一键登录关联ID
     * @return 结果
     */
    @Override
    public int deleteUserOpenidById(Long id)
    {
        return userOpenidMapper.deleteUserOpenidById(id);
    }

    @Override
    public UserOpenid findByOpenId(String openid) {
        return userOpenidMapper.findByOpenId(openid);
    }
}
