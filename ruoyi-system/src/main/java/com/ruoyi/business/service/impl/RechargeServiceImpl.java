package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.RechargeMapper;
import com.ruoyi.business.domain.Recharge;
import com.ruoyi.business.service.IRechargeService;

/**
 * 充值管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
@Service
public class RechargeServiceImpl implements IRechargeService 
{
    @Autowired
    private RechargeMapper rechargeMapper;

    /**
     * 查询充值管理
     * 
     * @param recId 充值管理ID
     * @return 充值管理
     */
    @Override
    public Recharge selectRechargeById(Long recId)
    {
        return rechargeMapper.selectRechargeById(recId);
    }

    /**
     * 查询充值管理列表
     * 
     * @param recharge 充值管理
     * @return 充值管理
     */
    @Override
    public List<Recharge> selectRechargeList(Recharge recharge)
    {
        return rechargeMapper.selectRechargeList(recharge);
    }

    /**
     * 新增充值管理
     * 
     * @param recharge 充值管理
     * @return 结果
     */
    @Override
    public int insertRecharge(Recharge recharge)
    {
        recharge.setCreateTime(DateUtils.getNowDate());
        return rechargeMapper.insertRecharge(recharge);
    }

    /**
     * 修改充值管理
     * 
     * @param recharge 充值管理
     * @return 结果
     */
    @Override
    public int updateRecharge(Recharge recharge)
    {
        recharge.setUpdateTime(DateUtils.getNowDate());
        return rechargeMapper.updateRecharge(recharge);
    }

    /**
     * 批量删除充值管理
     * 
     * @param recIds 需要删除的充值管理ID
     * @return 结果
     */
    @Override
    public int deleteRechargeByIds(Long[] recIds)
    {
        return rechargeMapper.deleteRechargeByIds(recIds);
    }

    /**
     * 删除充值管理信息
     * 
     * @param recId 充值管理ID
     * @return 结果
     */
    @Override
    public int deleteRechargeById(Long recId)
    {
        return rechargeMapper.deleteRechargeById(recId);
    }
}
