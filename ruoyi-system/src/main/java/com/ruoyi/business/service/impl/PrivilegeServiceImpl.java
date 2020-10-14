package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PrivilegeMapper;
import com.ruoyi.business.domain.Privilege;
import com.ruoyi.business.service.IPrivilegeService;

/**
 * 特权Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class PrivilegeServiceImpl implements IPrivilegeService 
{
    @Autowired
    private PrivilegeMapper privilegeMapper;

    /**
     * 查询特权
     * 
     * @param priId 特权ID
     * @return 特权
     */
    @Override
    public Privilege selectPrivilegeById(Long priId)
    {
        return privilegeMapper.selectPrivilegeById(priId);
    }

    /**
     * 查询特权列表
     * 
     * @param privilege 特权
     * @return 特权
     */
    @Override
    public List<Privilege> selectPrivilegeList(Privilege privilege)
    {
        return privilegeMapper.selectPrivilegeList(privilege);
    }

    /**
     * 新增特权
     * 
     * @param privilege 特权
     * @return 结果
     */
    @Override
    public int insertPrivilege(Privilege privilege)
    {
        privilege.setCreateTime(DateUtils.getNowDate());
        return privilegeMapper.insertPrivilege(privilege);
    }

    /**
     * 修改特权
     * 
     * @param privilege 特权
     * @return 结果
     */
    @Override
    public int updatePrivilege(Privilege privilege)
    {
        privilege.setUpdateTime(DateUtils.getNowDate());
        return privilegeMapper.updatePrivilege(privilege);
    }

    /**
     * 批量删除特权
     * 
     * @param priIds 需要删除的特权ID
     * @return 结果
     */
    @Override
    public int deletePrivilegeByIds(Long[] priIds)
    {
        return privilegeMapper.deletePrivilegeByIds(priIds);
    }

    /**
     * 删除特权信息
     * 
     * @param priId 特权ID
     * @return 结果
     */
    @Override
    public int deletePrivilegeById(Long priId)
    {
        return privilegeMapper.deletePrivilegeById(priId);
    }
}
