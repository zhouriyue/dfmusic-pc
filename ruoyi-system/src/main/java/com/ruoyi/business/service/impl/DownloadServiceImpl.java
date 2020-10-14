package com.ruoyi.business.service.impl;

import java.util.List;

import com.ruoyi.business.domain.Download;
import com.ruoyi.business.mapper.DownloadMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.service.IDownloadService;

/**
 * 下载信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class DownloadServiceImpl implements IDownloadService 
{
    @Autowired
    private DownloadMapper downloadMapper;

    /**
     * 查询下载信息
     * 
     * @param dlId 下载信息ID
     * @return 下载信息
     */
    @Override
    public Download selectDownloadById(Long dlId)
    {
        return downloadMapper.selectDownloadById(dlId);
    }

    /**
     * 查询下载信息列表
     * 
     * @param download 下载信息
     * @return 下载信息
     */
    @Override
    public List<Download> selectDownloadList(Download download)
    {
        return downloadMapper.selectDownloadList(download);
    }

    /**
     * 新增下载信息
     * 
     * @param download 下载信息
     * @return 结果
     */
    @Override
    public int insertDownload(Download download)
    {
        download.setCreateTime(DateUtils.getNowDate());
        return downloadMapper.insertDownload(download);
    }

    /**
     * 修改下载信息
     * 
     * @param download 下载信息
     * @return 结果
     */
    @Override
    public int updateDownload(Download download)
    {
        download.setUpdateTime(DateUtils.getNowDate());
        return downloadMapper.updateDownload(download);
    }

    /**
     * 批量删除下载信息
     * 
     * @param dlIds 需要删除的下载信息ID
     * @return 结果
     */
    @Override
    public int deleteDownloadByIds(Long[] dlIds)
    {
        return downloadMapper.deleteDownloadByIds(dlIds);
    }

    /**
     * 删除下载信息信息
     * 
     * @param dlId 下载信息ID
     * @return 结果
     */
    @Override
    public int deleteDownloadById(Long dlId)
    {
        return downloadMapper.deleteDownloadById(dlId);
    }
}
