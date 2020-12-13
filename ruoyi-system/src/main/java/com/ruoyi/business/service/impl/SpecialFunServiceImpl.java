package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.SpecialFunMapper;
import com.ruoyi.business.domain.SpecialFun;
import com.ruoyi.business.service.ISpecialFunService;

/**
 * 个性功能Service业务层处理
 * 
 * @author zhouriyue
 * @date 2020-12-11
 */
@Service
public class SpecialFunServiceImpl implements ISpecialFunService 
{
    @Autowired
    private SpecialFunMapper specialFunMapper;

    /**
     * 查询个性功能
     * 
     * @param id 个性功能ID
     * @return 个性功能
     */
    @Override
    public SpecialFun selectSpecialFunById(Long id)
    {
        return specialFunMapper.selectSpecialFunById(id);
    }

    /**
     * 查询个性功能列表
     * 
     * @param specialFun 个性功能
     * @return 个性功能
     */
    @Override
    public List<SpecialFun> selectSpecialFunList(SpecialFun specialFun)
    {
        return specialFunMapper.selectSpecialFunList(specialFun);
    }

    /**
     * 新增个性功能
     * 
     * @param specialFun 个性功能
     * @return 结果
     */
    @Override
    public int insertSpecialFun(SpecialFun specialFun)
    {
        return specialFunMapper.insertSpecialFun(specialFun);
    }

    /**
     * 修改个性功能
     * 
     * @param specialFun 个性功能
     * @return 结果
     */
    @Override
    public int updateSpecialFun(SpecialFun specialFun)
    {
        return specialFunMapper.updateSpecialFun(specialFun);
    }

    /**
     * 批量删除个性功能
     * 
     * @param ids 需要删除的个性功能ID
     * @return 结果
     */
    @Override
    public int deleteSpecialFunByIds(Long[] ids)
    {
        return specialFunMapper.deleteSpecialFunByIds(ids);
    }

    /**
     * 删除个性功能信息
     * 
     * @param id 个性功能ID
     * @return 结果
     */
    @Override
    public int deleteSpecialFunById(Long id)
    {
        return specialFunMapper.deleteSpecialFunById(id);
    }
}
