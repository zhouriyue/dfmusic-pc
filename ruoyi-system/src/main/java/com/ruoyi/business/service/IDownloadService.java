package com.ruoyi.business.service;

import com.ruoyi.business.domain.Download;

import java.util.List;

/**
 * 下载信息Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface IDownloadService 
{
    /**
     * 查询下载信息
     * 
     * @param dlId 下载信息ID
     * @return 下载信息
     */
    public Download selectDownloadById(Long dlId);

    /**
     * 查询下载信息列表
     * 
     * @param download 下载信息
     * @return 下载信息集合
     */
    public List<Download> selectDownloadList(Download download);

    /**
     * 新增下载信息
     * 
     * @param download 下载信息
     * @return 结果
     */
    public int insertDownload(Download download);

    /**
     * 修改下载信息
     * 
     * @param download 下载信息
     * @return 结果
     */
    public int updateDownload(Download download);

    /**
     * 批量删除下载信息
     * 
     * @param dlIds 需要删除的下载信息ID
     * @return 结果
     */
    public int deleteDownloadByIds(Long[] dlIds);

    /**
     * 删除下载信息信息
     * 
     * @param dlId 下载信息ID
     * @return 结果
     */
    public int deleteDownloadById(Long dlId);
}
