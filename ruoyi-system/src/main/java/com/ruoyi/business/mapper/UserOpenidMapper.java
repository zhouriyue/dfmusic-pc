package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.UserOpenid;

/**
 * 一键登录关联Mapper接口
 * 
 * @author ruoyi
 * @date 2020-11-05
 */
public interface UserOpenidMapper 
{
    /**
     * 查询一键登录关联
     * 
     * @param id 一键登录关联ID
     * @return 一键登录关联
     */
    public UserOpenid selectUserOpenidById(Long id);

    /**
     * 查询一键登录关联列表
     * 
     * @param userOpenid 一键登录关联
     * @return 一键登录关联集合
     */
    public List<UserOpenid> selectUserOpenidList(UserOpenid userOpenid);

    /**
     * 新增一键登录关联
     * 
     * @param userOpenid 一键登录关联
     * @return 结果
     */
    public int insertUserOpenid(UserOpenid userOpenid);

    /**
     * 修改一键登录关联
     * 
     * @param userOpenid 一键登录关联
     * @return 结果
     */
    public int updateUserOpenid(UserOpenid userOpenid);

    /**
     * 删除一键登录关联
     * 
     * @param id 一键登录关联ID
     * @return 结果
     */
    public int deleteUserOpenidById(Long id);

    /**
     * 批量删除一键登录关联
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserOpenidByIds(Long[] ids);

    public UserOpenid findByOpenId(String openid);
}
