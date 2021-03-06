package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.SpecialFun;

/**
 * 个性功能Mapper接口
 * 
 * @author zhouriyue
 * @date 2020-12-11
 */
public interface SpecialFunMapper 
{
    /**
     * 查询个性功能
     * 
     * @param id 个性功能ID
     * @return 个性功能
     */
    public SpecialFun selectSpecialFunById(Long id);

    /**
     * 查询个性功能列表
     * 
     * @param specialFun 个性功能
     * @return 个性功能集合
     */
    public List<SpecialFun> selectSpecialFunList(SpecialFun specialFun);

    /**
     * 新增个性功能
     * 
     * @param specialFun 个性功能
     * @return 结果
     */
    public int insertSpecialFun(SpecialFun specialFun);

    /**
     * 修改个性功能
     * 
     * @param specialFun 个性功能
     * @return 结果
     */
    public int updateSpecialFun(SpecialFun specialFun);

    /**
     * 删除个性功能
     * 
     * @param id 个性功能ID
     * @return 结果
     */
    public int deleteSpecialFunById(Long id);

    /**
     * 批量删除个性功能
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSpecialFunByIds(Long[] ids);
}
