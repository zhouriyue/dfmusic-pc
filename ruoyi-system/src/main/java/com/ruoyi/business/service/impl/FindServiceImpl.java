package com.ruoyi.business.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.FindMapper;
import com.ruoyi.business.domain.Find;
import com.ruoyi.business.service.IFindService;

/**
 * 发现页管理Service业务层处理
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
@Service
public class FindServiceImpl implements IFindService 
{
    @Autowired
    private FindMapper findMapper;

    /**
     * 查询发现页管理
     * 
     * @param id 发现页管理ID
     * @return 发现页管理
     */
    @Override
    public Find selectFindById(Long id)
    {
        return findMapper.selectFindById(id);
    }

    /**
     * 查询发现页管理列表
     * 
     * @param find 发现页管理
     * @return 发现页管理
     */
    @Override
    public List<Find> selectFindList(Find find)
    {
        return findMapper.selectFindList(find);
    }

    /**
     * 新增发现页管理
     * 
     * @param find 发现页管理
     * @return 结果
     */
    @Override
    public int insertFind(Find find)
    {
        return findMapper.insertFind(find);
    }

    /**
     * 修改发现页管理
     * 
     * @param find 发现页管理
     * @return 结果
     */
    @Override
    public int updateFind(Find find)
    {
        return findMapper.updateFind(find);
    }

    /**
     * 批量删除发现页管理
     * 
     * @param ids 需要删除的发现页管理ID
     * @return 结果
     */
    @Override
    public int deleteFindByIds(Long[] ids)
    {
        return findMapper.deleteFindByIds(ids);
    }

    /**
     * 删除发现页管理信息
     * 
     * @param id 发现页管理ID
     * @return 结果
     */
    @Override
    public int deleteFindById(Long id)
    {
        return findMapper.deleteFindById(id);
    }
}
