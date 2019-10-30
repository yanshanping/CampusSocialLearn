package com.social.project.system.comment.service;

import com.social.common.support.Convert;
import com.social.common.utils.security.ShiroUtils;
import com.social.project.system.comment.domain.Comment;
import com.social.project.system.comment.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 评论 服务层实现
 * 
 * @author yangjie
 * @date 2019-03-09
 */
@Service
public class CommentServiceImpl implements ICommentService 
{
	@Autowired
	private CommentMapper commentMapper;

	/**
     * 查询评论信息
     * 
     * @param id 评论ID
     * @return 评论信息
     */
    @Override
	public Comment selectCommentById(Integer id)
	{
	    return commentMapper.selectCommentById(id);
	}
	
	/**
     * 查询评论列表
     * 
     * @param comment 评论信息
     * @return 评论集合
     */
	@Override
	public List<Comment> selectCommentList(Comment comment)
	{
	    return commentMapper.selectCommentList(comment);
	}
	
    /**
     * 新增评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
	@Override
	public int insertComment(Comment comment)
	{
		comment.setCreateBy(ShiroUtils.getLoginName());
	    return commentMapper.insertComment(comment);
	}
	
	/**
     * 修改评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
	@Override
	public int updateComment(Comment comment)
	{
		comment.setUpdateBy(ShiroUtils.getLoginName());
	    return commentMapper.updateComment(comment);
	}

	/**
     * 删除评论对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteCommentByIds(String ids)
	{
		return commentMapper.deleteCommentByIds(Convert.toStrArray(ids));
	}
	
}
