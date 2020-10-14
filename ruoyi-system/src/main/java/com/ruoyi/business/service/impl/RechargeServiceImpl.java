package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Recharge;
import com.ruoyi.business.mapper.RechargeMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.IRechargeService;

/**
 * 充值信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class RechargeServiceImpl implements IRechargeService 
{
    @Autowired
    private RechargeMapper rechargeMapper;

    /**
     * 查询充值信息
     * 
     * @param recId 充值信息ID
     * @return 充值信息
     */
    @Override
    public Recharge selectRechargeById(Long recId)
    {
        return rechargeMapper.selectRechargeById(recId);
    }

    /**
     * 查询充值信息列表
     * 
     * @param recharge 充值信息
     * @return 充值信息
     */
    @Override
    public List<Recharge> selectRechargeList(Recharge recharge)
    {
        return rechargeMapper.selectRechargeList(recharge);
    }

    /**
     * 新增充值信息
     * 
     * @param recharge 充值信息
     * @return 结果
     */
    @Override
    public int insertRecharge(Recharge recharge)
    {
        recharge.setCreateTime(DateUtils.getNowDate());
        return rechargeMapper.insertRecharge(recharge);
    }

    /**
     * 修改充值信息
     * 
     * @param recharge 充值信息
     * @return 结果
     */
    @Override
    public int updateRecharge(Recharge recharge)
    {
        recharge.setUpdateTime(DateUtils.getNowDate());
        return rechargeMapper.updateRecharge(recharge);
    }

    /**
     * 批量删除充值信息
     * 
     * @param recIds 需要删除的充值信息ID
     * @return 结果
     */
    @Override
    public int deleteRechargeByIds(Long[] recIds)
    {
        return rechargeMapper.deleteRechargeByIds(recIds);
    }

    /**
     * 删除充值信息信息
     * 
     * @param recId 充值信息ID
     * @return 结果
     */
    @Override
    public int deleteRechargeById(Long recId)
    {
        return rechargeMapper.deleteRechargeById(recId);
    }
}
