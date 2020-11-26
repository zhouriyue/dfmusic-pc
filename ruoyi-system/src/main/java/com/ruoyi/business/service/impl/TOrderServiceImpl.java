package com.ruoyi.business.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.business.domain.vo.OrderScopeCount;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.TOrderMapper;
import com.ruoyi.business.domain.TOrder;
import com.ruoyi.business.service.ITOrderService;

/**
 * 订单管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
@Service
public class TOrderServiceImpl implements ITOrderService 
{
    @Autowired
    private TOrderMapper tOrderMapper;

    /**
     * 查询订单管理
     * 
     * @param oId 订单管理ID
     * @return 订单管理
     */
    @Override
    public TOrder selectTOrderById(Long oId)
    {
        return tOrderMapper.selectTOrderById(oId);
    }

    /**
     * 查询订单管理列表
     * 
     * @param tOrder 订单管理
     * @return 订单管理
     */
    @Override
    public List<TOrder> selectTOrderList(TOrder tOrder)
    {
        return tOrderMapper.selectTOrderList(tOrder);
    }

    /**
     * 新增订单管理
     * 
     * @param tOrder 订单管理
     * @return 结果
     */
    @Override
    public int insertTOrder(TOrder tOrder)
    {
        tOrder.setCreateTime(DateUtils.getNowDate());
        return tOrderMapper.insertTOrder(tOrder);
    }

    /**
     * 修改订单管理
     * 
     * @param tOrder 订单管理
     * @return 结果
     */
    @Override
    public int updateTOrder(TOrder tOrder)
    {
        tOrder.setUpdateTime(DateUtils.getNowDate());
        return tOrderMapper.updateTOrder(tOrder);
    }

    /**
     * 批量删除订单管理
     * 
     * @param oIds 需要删除的订单管理ID
     * @return 结果
     */
    @Override
    public int deleteTOrderByIds(Long[] oIds)
    {
        return tOrderMapper.deleteTOrderByIds(oIds);
    }

    /**
     * 删除订单管理信息
     * 
     * @param oId 订单管理ID
     * @return 结果
     */
    @Override
    public int deleteTOrderById(Long oId)
    {
        return tOrderMapper.deleteTOrderById(oId);
    }

    @Override
    public List<OrderScopeCount> getScopeOrderDay(Date startDate, Date endDate,Integer orderState) {
        return tOrderMapper.getScopeOrderDay(startDate,endDate,orderState);
    }

    @Override
    public List<OrderScopeCount> getScopeOrderMonth(Date startDate, Date endDate,Integer orderState) {
        return tOrderMapper.getScopeOrderMonth(startDate,endDate,orderState);
    }

    @Override
    public Long getOrderTotal() {
        return tOrderMapper.getOrderTotal();
    }
}
