package com.ruoyi.business.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.business.domain.TOrder;
import com.ruoyi.business.domain.vo.OrderScopeCount;

/**
 * 订单管理Service接口
 * 
 * @author ruoyi
 * @date 2020-11-16
 */
public interface ITOrderService 
{
    /**
     * 查询订单管理
     * 
     * @param oId 订单管理ID
     * @return 订单管理
     */
    public TOrder selectTOrderById(Long oId);

    /**
     * 查询订单管理列表
     * 
     * @param tOrder 订单管理
     * @return 订单管理集合
     */
    public List<TOrder> selectTOrderList(TOrder tOrder);

    /**
     * 新增订单管理
     * 
     * @param tOrder 订单管理
     * @return 结果
     */
    public int insertTOrder(TOrder tOrder);

    /**
     * 修改订单管理
     * 
     * @param tOrder 订单管理
     * @return 结果
     */
    public int updateTOrder(TOrder tOrder);

    /**
     * 批量删除订单管理
     * 
     * @param oIds 需要删除的订单管理ID
     * @return 结果
     */
    public int deleteTOrderByIds(Long[] oIds);

    /**
     * 删除订单管理信息
     * 
     * @param oId 订单管理ID
     * @return 结果
     */
    public int deleteTOrderById(Long oId);

    public List<OrderScopeCount> getScopeOrderDay(Date startDate, Date endDate,Integer orderState);

    public List<OrderScopeCount> getScopeOrderMonth(Date startDate, Date endDate,Integer orderState);

    public Long getOrderTotal();
}
