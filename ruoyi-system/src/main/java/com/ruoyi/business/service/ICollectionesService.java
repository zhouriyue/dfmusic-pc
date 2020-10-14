package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Collectiones;

/**
 * 歌单收藏Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface ICollectionesService 
{
    /**
     * 查询歌单收藏
     * 
     * @param colId 歌单收藏ID
     * @return 歌单收藏
     */
    public Collectiones selectCollectionesById(Long colId);

    /**
     * 查询歌单收藏列表
     * 
     * @param collectiones 歌单收藏
     * @return 歌单收藏集合
     */
    public List<Collectiones> selectCollectionesList(Collectiones collectiones);

    /**
     * 新增歌单收藏
     * 
     * @param collectiones 歌单收藏
     * @return 结果
     */
    public int insertCollectiones(Collectiones collectiones);

    /**
     * 修改歌单收藏
     * 
     * @param collectiones 歌单收藏
     * @return 结果
     */
    public int updateCollectiones(Collectiones collectiones);

    /**
     * 批量删除歌单收藏
     * 
     * @param colIds 需要删除的歌单收藏ID
     * @return 结果
     */
    public int deleteCollectionesByIds(Long[] colIds);

    /**
     * 删除歌单收藏信息
     * 
     * @param colId 歌单收藏ID
     * @return 结果
     */
    public int deleteCollectionesById(Long colId);
}
