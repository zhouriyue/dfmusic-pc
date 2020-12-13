package com.ruoyi.business.mapper;

import java.util.List;
import com.ruoyi.business.domain.Collectiones;
import org.apache.ibatis.annotations.Param;

/**
 * 歌单收藏Mapper接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface CollectionesMapper 
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
     * 删除歌单收藏
     * 
     * @param colId 歌单收藏ID
     * @return 结果
     */
    public int deleteCollectionesById(Long colId);

    /**
     * 批量删除歌单收藏
     * 
     * @param colIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteCollectionesByIds(Long[] colIds);

    /** 取消收藏 **/
    public int cancel(@Param("userId") Long userId,@Param("slId") Long slId);
}
