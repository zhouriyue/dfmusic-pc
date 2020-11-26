package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Recharge;

/**
 * 充值管理Service接口
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
public interface IRechargeService 
{
    /**
     * 查询充值管理
     * 
     * @param recId 充值管理ID
     * @return 充值管理
     */
    public Recharge selectRechargeById(Long recId);

    /**
     * 查询充值管理列表
     * 
     * @param recharge 充值管理
     * @return 充值管理集合
     */
    public List<Recharge> selectRechargeList(Recharge recharge);

    /**
     * 新增充值管理
     * 
     * @param recharge 充值管理
     * @return 结果
     */
    public int insertRecharge(Recharge recharge);

    /**
     * 修改充值管理
     * 
     * @param recharge 充值管理
     * @return 结果
     */
    public int updateRecharge(Recharge recharge);

    /**
     * 批量删除充值管理
     * 
     * @param recIds 需要删除的充值管理ID
     * @return 结果
     */
    public int deleteRechargeByIds(Long[] recIds);

    /**
     * 删除充值管理信息
     * 
     * @param recId 充值管理ID
     * @return 结果
     */
    public int deleteRechargeById(Long recId);
}
