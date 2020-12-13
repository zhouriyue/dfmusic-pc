package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.PaymentsMapper;
import com.ruoyi.business.domain.Payments;
import com.ruoyi.business.service.IPaymentsService;

/**
 * 支付管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-28
 */
@Service
public class PaymentsServiceImpl implements IPaymentsService 
{
    @Autowired
    private PaymentsMapper paymentsMapper;

    /**
     * 查询支付管理
     * 
     * @param paId 支付管理ID
     * @return 支付管理
     */
    @Override
    public Payments selectPaymentsById(Long paId)
    {
        return paymentsMapper.selectPaymentsById(paId);
    }

    /**
     * 查询支付管理列表
     * 
     * @param payments 支付管理
     * @return 支付管理
     */
    @Override
    public List<Payments> selectPaymentsList(Payments payments)
    {
        return paymentsMapper.selectPaymentsList(payments);
    }

    /**
     * 新增支付管理
     * 
     * @param payments 支付管理
     * @return 结果
     */
    @Override
    public int insertPayments(Payments payments)
    {
        return paymentsMapper.insertPayments(payments);
    }

    /**
     * 修改支付管理
     * 
     * @param payments 支付管理
     * @return 结果
     */
    @Override
    public int updatePayments(Payments payments)
    {
        return paymentsMapper.updatePayments(payments);
    }

    /**
     * 批量删除支付管理
     * 
     * @param paIds 需要删除的支付管理ID
     * @return 结果
     */
    @Override
    public int deletePaymentsByIds(Long[] paIds)
    {
        return paymentsMapper.deletePaymentsByIds(paIds);
    }

    /**
     * 删除支付管理信息
     * 
     * @param paId 支付管理ID
     * @return 结果
     */
    @Override
    public int deletePaymentsById(Long paId)
    {
        return paymentsMapper.deletePaymentsById(paId);
    }
}
