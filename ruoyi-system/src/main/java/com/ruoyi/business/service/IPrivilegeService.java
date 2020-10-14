package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Privilege;

/**
 * 特权Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface IPrivilegeService 
{
    /**
     * 查询特权
     * 
     * @param priId 特权ID
     * @return 特权
     */
    public Privilege selectPrivilegeById(Long priId);

    /**
     * 查询特权列表
     * 
     * @param privilege 特权
     * @return 特权集合
     */
    public List<Privilege> selectPrivilegeList(Privilege privilege);

    /**
     * 新增特权
     * 
     * @param privilege 特权
     * @return 结果
     */
    public int insertPrivilege(Privilege privilege);

    /**
     * 修改特权
     * 
     * @param privilege 特权
     * @return 结果
     */
    public int updatePrivilege(Privilege privilege);

    /**
     * 批量删除特权
     * 
     * @param priIds 需要删除的特权ID
     * @return 结果
     */
    public int deletePrivilegeByIds(Long[] priIds);

    /**
     * 删除特权信息
     * 
     * @param priId 特权ID
     * @return 结果
     */
    public int deletePrivilegeById(Long priId);
}
