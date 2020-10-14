package com.ruoyi.business.service;

import com.ruoyi.business.domain.Recharge;

import java.util.List;

/**
 * 充值信息Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface IRechargeService 
{
    /**
     * 查询充值信息
     * 
     * @param recId 充值信息ID
     * @return 充值信息
     */
    public Recharge selectRechargeById(Long recId);

    /**
     * 查询充值信息列表
     * 
     * @param recharge 充值信息
     * @return 充值信息集合
     */
    public List<Recharge> selectRechargeList(Recharge recharge);

    /**
     * 新增充值信息
     * 
     * @param recharge 充值信息
     * @return 结果
     */
    public int insertRecharge(Recharge recharge);

    /**
     * 修改充值信息
     * 
     * @param recharge 充值信息
     * @return 结果
     */
    public int updateRecharge(Recharge recharge);

    /**
     * 批量删除充值信息
     * 
     * @param recIds 需要删除的充值信息ID
     * @return 结果
     */
    public int deleteRechargeByIds(Long[] recIds);

    /**
     * 删除充值信息信息
     * 
     * @param recId 充值信息ID
     * @return 结果
     */
    public int deleteRechargeById(Long recId);
}
