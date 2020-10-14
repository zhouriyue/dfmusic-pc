package com.ruoyi.business.service;

import java.util.List;
import com.ruoyi.business.domain.Comment;

/**
 * 评论管理Service接口
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
public interface ICommentService 
{
    /**
     * 查询评论管理
     * 
     * @param comId 评论管理ID
     * @return 评论管理
     */
    public Comment selectCommentById(Long comId);

    /**
     * 查询评论管理列表
     * 
     * @param comment 评论管理
     * @return 评论管理集合
     */
    public List<Comment> selectCommentList(Comment comment);

    /**
     * 新增评论管理
     * 
     * @param comment 评论管理
     * @return 结果
     */
    public int insertComment(Comment comment);

    /**
     * 修改评论管理
     * 
     * @param comment 评论管理
     * @return 结果
     */
    public int updateComment(Comment comment);

    /**
     * 批量删除评论管理
     * 
     * @param comIds 需要删除的评论管理ID
     * @return 结果
     */
    public int deleteCommentByIds(Long[] comIds);

    /**
     * 删除评论管理信息
     * 
     * @param comId 评论管理ID
     * @return 结果
     */
    public int deleteCommentById(Long comId);
}
