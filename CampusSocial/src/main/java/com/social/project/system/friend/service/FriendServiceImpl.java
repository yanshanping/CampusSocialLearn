package com.social.project.system.friend.service;

import java.util.List;

import com.social.common.utils.security.ShiroUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.social.project.system.friend.mapper.FriendMapper;
import com.social.project.system.friend.domain.Friend;
import com.social.common.support.Convert;

/**
 * 用户朋友 服务层实现
 * 
 * @author yangjie
 * @date 2019-03-09
 */
@Service
public class FriendServiceImpl implements IFriendService 
{
	@Autowired
	private FriendMapper friendMapper;

	/**
     * 查询用户朋友信息
     * 
     * @param id 用户朋友ID
     * @return 用户朋友信息
     */
    @Override
	public Friend selectFriendById(Integer id)
	{
	    return friendMapper.selectFriendById(id);
	}
	
	/**
     * 查询用户朋友列表
     * 
     * @param friend 用户朋友信息
     * @return 用户朋友集合
     */
	@Override
	public List<Friend> selectFriendList(Friend friend)
	{
	    return friendMapper.selectFriendList(friend);
	}
	
    /**
     * 新增用户朋友
     * 
     * @param friend 用户朋友信息
     * @return 结果
     */
	@Override
	public int insertFriend(Friend friend)
	{
		friend.setUserId(ShiroUtils.getUserId().intValue());
		friend.setCreateBy(ShiroUtils.getLoginName());
	    return friendMapper.insertFriend(friend);
	}
	
	/**
     * 修改用户朋友
     * 
     * @param friend 用户朋友信息
     * @return 结果
     */
	@Override
	public int updateFriend(Friend friend)
	{
		friend.setUserId(ShiroUtils.getUserId().intValue());
		friend.setUpdateBy(ShiroUtils.getLoginName());
	    return friendMapper.updateFriend(friend);
	}

	/**
     * 删除用户朋友对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteFriendByIds(String ids)
	{
		return friendMapper.deleteFriendByIds(Convert.toStrArray(ids));
	}
	
}
