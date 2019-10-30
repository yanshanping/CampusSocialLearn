package com.social.project.system.comment.mapper;

import com.social.project.system.comment.domain.Comment;
import java.util.List;	

/**
 * 评论 数据层
 * 
 * @author yangjie
 * @date 2019-03-09
 */
public interface CommentMapper 
{
	/**
     * 查询评论信息
     * 
     * @param id 评论ID
     * @return 评论信息
     */
	public Comment selectCommentById(Integer id);
	
	/**
     * 查询评论列表
     * 
     * @param comment 评论信息
     * @return 评论集合
     */
	public List<Comment> selectCommentList(Comment comment);
	
	/**
     * 新增评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
	public int insertComment(Comment comment);
	
	/**
     * 修改评论
     * 
     * @param comment 评论信息
     * @return 结果
     */
	public int updateComment(Comment comment);
	
	/**
     * 删除评论
     * 
     * @param id 评论ID
     * @return 结果
     */
	public int deleteCommentById(Integer id);
	
	/**
     * 批量删除评论
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCommentByIds(String[] ids);
	
}