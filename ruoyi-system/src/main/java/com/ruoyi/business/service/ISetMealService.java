package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.SetMeal;

/**
 * 套餐信息管理Service接口
 * 
 * @author ruoyi
 * @date 2020-11-01
 */
public interface ISetMealService 
{
    /**
     * 查询套餐信息管理
     * 
     * @param smId 套餐信息管理ID
     * @return 套餐信息管理
     */
    public SetMeal selectSetMealById(Long smId);

    /**
     * 查询套餐信息管理列表
     * 
     * @param setMeal 套餐信息管理
     * @return 套餐信息管理集合
     */
    public List<SetMeal> selectSetMealList(SetMeal setMeal);

    /**
     * 新增套餐信息管理
     * 
     * @param setMeal 套餐信息管理
     * @return 结果
     */
    public int insertSetMeal(SetMeal setMeal);

    /**
     * 修改套餐信息管理
     * 
     * @param setMeal 套餐信息管理
     * @return 结果
     */
    public int updateSetMeal(SetMeal setMeal);

    /**
     * 批量删除套餐信息管理
     * 
     * @param smIds 需要删除的套餐信息管理ID
     * @return 结果
     */
    public int deleteSetMealByIds(Long[] smIds);

    /**
     * 删除套餐信息管理信息
     * 
     * @param smId 套餐信息管理ID
     * @return 结果
     */
    public int deleteSetMealById(Long smId);
}