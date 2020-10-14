package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.CollectionesMapper;
import com.ruoyi.business.domain.Collectiones;
import com.ruoyi.business.service.ICollectionesService;

/**
 * 歌单收藏Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class CollectionesServiceImpl implements ICollectionesService 
{
    @Autowired
    private CollectionesMapper collectionesMapper;

    /**
     * 查询歌单收藏
     * 
     * @param colId 歌单收藏ID
     * @return 歌单收藏
     */
    @Override
    public Collectiones selectCollectionesById(Long colId)
    {
        return collectionesMapper.selectCollectionesById(colId);
    }

    /**
     * 查询歌单收藏列表
     * 
     * @param collectiones 歌单收藏
     * @return 歌单收藏
     */
    @Override
    public List<Collectiones> selectCollectionesList(Collectiones collectiones)
    {
        return collectionesMapper.selectCollectionesList(collectiones);
    }

    /**
     * 新增歌单收藏
     * 
     * @param collectiones 歌单收藏
     * @return 结果
     */
    @Override
    public int insertCollectiones(Collectiones collectiones)
    {
        collectiones.setCreateTime(DateUtils.getNowDate());
        return collectionesMapper.insertCollectiones(collectiones);
    }

    /**
     * 修改歌单收藏
     * 
     * @param collectiones 歌单收藏
     * @return 结果
     */
    @Override
    public int updateCollectiones(Collectiones collectiones)
    {
        collectiones.setUpdateTime(DateUtils.getNowDate());
        return collectionesMapper.updateCollectiones(collectiones);
    }

    /**
     * 批量删除歌单收藏
     * 
     * @param colIds 需要删除的歌单收藏ID
     * @return 结果
     */
    @Override
    public int deleteCollectionesByIds(Long[] colIds)
    {
        return collectionesMapper.deleteCollectionesByIds(colIds);
    }

    /**
     * 删除歌单收藏信息
     * 
     * @param colId 歌单收藏ID
     * @return 结果
     */
    @Override
    public int deleteCollectionesById(Long colId)
    {
        return collectionesMapper.deleteCollectionesById(colId);
    }
}
