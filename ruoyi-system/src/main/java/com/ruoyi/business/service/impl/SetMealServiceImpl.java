package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SetMealMapper;
import com.ruoyi.business.domain.SetMeal;
import com.ruoyi.business.service.ISetMealService;

/**
 * 套餐信息管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-11-01
 */
@Service
public class SetMealServiceImpl implements ISetMealService 
{
    @Autowired
    private SetMealMapper setMealMapper;

    /**
     * 查询套餐信息管理
     * 
     * @param smId 套餐信息管理ID
     * @return 套餐信息管理
     */
    @Override
    public SetMeal selectSetMealById(Long smId)
    {
        return setMealMapper.selectSetMealById(smId);
    }

    /**
     * 查询套餐信息管理列表
     * 
     * @param setMeal 套餐信息管理
     * @return 套餐信息管理
     */
    @Override
    public List<SetMeal> selectSetMealList(SetMeal setMeal)
    {
        return setMealMapper.selectSetMealList(setMeal);
    }

    /**
     * 新增套餐信息管理
     * 
     * @param setMeal 套餐信息管理
     * @return 结果
     */
    @Override
    public int insertSetMeal(SetMeal setMeal)
    {
        return setMealMapper.insertSetMeal(setMeal);
    }

    /**
     * 修改套餐信息管理
     * 
     * @param setMeal 套餐信息管理
     * @return 结果
     */
    @Override
    public int updateSetMeal(SetMeal setMeal)
    {
        return setMealMapper.updateSetMeal(setMeal);
    }

    /**
     * 批量删除套餐信息管理
     * 
     * @param smIds 需要删除的套餐信息管理ID
     * @return 结果
     */
    @Override
    public int deleteSetMealByIds(Long[] smIds)
    {
        return setMealMapper.deleteSetMealByIds(smIds);
    }

    /**
     * 删除套餐信息管理信息
     * 
     * @param smId 套餐信息管理ID
     * @return 结果
     */
    @Override
    public int deleteSetMealById(Long smId)
    {
        return setMealMapper.deleteSetMealById(smId);
    }
}
