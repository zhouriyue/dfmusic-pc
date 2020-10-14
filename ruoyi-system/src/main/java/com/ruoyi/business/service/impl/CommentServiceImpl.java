package com.ruoyi.business.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.business.mapper.CommentMapper;
import com.ruoyi.business.domain.Comment;
import com.ruoyi.business.service.ICommentService;

/**
 * 评论管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-10-09
 */
@Service
public class CommentServiceImpl implements ICommentService 
{
    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查询评论管理
     * 
     * @param comId 评论管理ID
     * @return 评论管理
     */
    @Override
    public Comment selectCommentById(Long comId)
    {
        return commentMapper.selectCommentById(comId);
    }

    /**
     * 查询评论管理列表
     * 
     * @param comment 评论管理
     * @return 评论管理
     */
    @Override
    public List<Comment> selectCommentList(Comment comment)
    {
        return commentMapper.selectCommentList(comment);
    }

    /**
     * 新增评论管理
     * 
     * @param comment 评论管理
     * @return 结果
     */
    @Override
    public int insertComment(Comment comment)
    {
        comment.setCreateTime(DateUtils.getNowDate());
        return commentMapper.insertComment(comment);
    }

    /**
     * 修改评论管理
     * 
     * @param comment 评论管理
     * @return 结果
     */
    @Override
    public int updateComment(Comment comment)
    {
        comment.setUpdateTime(DateUtils.getNowDate());
        return commentMapper.updateComment(comment);
    }

    /**
     * 批量删除评论管理
     * 
     * @param comIds 需要删除的评论管理ID
     * @return 结果
     */
    @Override
    public int deleteCommentByIds(Long[] comIds)
    {
        return commentMapper.deleteCommentByIds(comIds);
    }

    /**
     * 删除评论管理信息
     * 
     * @param comId 评论管理ID
     * @return 结果
     */
    @Override
    public int deleteCommentById(Long comId)
    {
        return commentMapper.deleteCommentById(comId);
    }
}
