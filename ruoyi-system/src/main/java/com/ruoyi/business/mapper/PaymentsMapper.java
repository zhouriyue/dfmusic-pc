package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Payments;

/**
 * 支付管理Mapper接口
 * 
 * @author ruoyi
 * @date 2020-11-28
 */
public interface PaymentsMapper 
{
    /**
     * 查询支付管理
     * 
     * @param paId 支付管理ID
     * @return 支付管理
     */
    public Payments selectPaymentsById(Long paId);

    /**
     * 查询支付管理列表
     * 
     * @param payments 支付管理
     * @return 支付管理集合
     */
    public List<Payments> selectPaymentsList(Payments payments);

    /**
     * 新增支付管理
     * 
     * @param payments 支付管理
     * @return 结果
     */
    public int insertPayments(Payments payments);

    /**
     * 修改支付管理
     * 
     * @param payments 支付管理
     * @return 结果
     */
    public int updatePayments(Payments payments);

    /**
     * 删除支付管理
     * 
     * @param paId 支付管理ID
     * @return 结果
     */
    public int deletePaymentsById(Long paId);

    /**
     * 批量删除支付管理
     * 
     * @param paIds 需要删除的数据ID
     * @return 结果
     */
    public int deletePaymentsByIds(Long[] paIds);
}
