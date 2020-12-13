package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Find;

/**
 * 发现页管理Service接口
 * 
 * @author zhouriyue
 * @date 2020-12-10
 */
public interface IFindService 
{
    /**
     * 查询发现页管理
     * 
     * @param id 发现页管理ID
     * @return 发现页管理
     */
    public Find selectFindById(Long id);

    /**
     * 查询发现页管理列表
     * 
     * @param find 发现页管理
     * @return 发现页管理集合
     */
    public List<Find> selectFindList(Find find);

    /**
     * 新增发现页管理
     * 
     * @param find 发现页管理
     * @return 结果
     */
    public int insertFind(Find find);

    /**
     * 修改发现页管理
     * 
     * @param find 发现页管理
     * @return 结果
     */
    public int updateFind(Find find);

    /**
     * 批量删除发现页管理
     * 
     * @param ids 需要删除的发现页管理ID
     * @return 结果
     */
    public int deleteFindByIds(Long[] ids);

    /**
     * 删除发现页管理信息
     * 
     * @param id 发现页管理ID
     * @return 结果
     */
    public int deleteFindById(Long id);
}
