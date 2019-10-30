package com.social.project.system.friend.mapper;

import com.social.project.system.friend.domain.Friend;
import java.util.List;	

/**
 * 用户朋友 数据层
 * 
 * @author yangjie
 * @date 2019-03-09
 */
public interface FriendMapper 
{
	/**
     * 查询用户朋友信息
     * 
     * @param id 用户朋友ID
     * @return 用户朋友信息
     */
	public Friend selectFriendById(Integer id);
	
	/**
     * 查询用户朋友列表
     * 
     * @param friend 用户朋友信息
     * @return 用户朋友集合
     */
	public List<Friend> selectFriendList(Friend friend);
	
	/**
     * 新增用户朋友
     * 
     * @param friend 用户朋友信息
     * @return 结果
     */
	public int insertFriend(Friend friend);
	
	/**
     * 修改用户朋友
     * 
     * @param friend 用户朋友信息
     * @return 结果
     */
	public int updateFriend(Friend friend);
	
	/**
     * 删除用户朋友
     * 
     * @param id 用户朋友ID
     * @return 结果
     */
	public int deleteFriendById(Integer id);
	
	/**
     * 批量删除用户朋友
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteFriendByIds(String[] ids);
	
}