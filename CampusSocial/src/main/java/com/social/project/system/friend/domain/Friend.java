package com.social.project.system.friend.domain;

import com.social.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户朋友表 cap_friend
 * 
 * @author yangjie
 * @date 2019-03-09
 */
public class Friend extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/**  */
	private Integer id;
	/** 用户ID */
	private Integer userId;
	/** 用户分组 */
	private String userGroup;
	/** 朋友ID */
	private Integer friendId;
	/** 好友分组 */
	private String friendGroup;
	/** 好友备注 */
	private String friendRemark;
	private String userName;
	private String friendName;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setUserId(Integer userId) 
	{
		this.userId = userId;
	}

	public Integer getUserId() 
	{
		return userId;
	}
	public void setUserGroup(String userGroup) 
	{
		this.userGroup = userGroup;
	}

	public String getUserGroup() 
	{
		return userGroup;
	}
	public void setFriendId(Integer friendId) 
	{
		this.friendId = friendId;
	}

	public Integer getFriendId() 
	{
		return friendId;
	}
	public void setFriendGroup(String friendGroup) 
	{
		this.friendGroup = friendGroup;
	}

	public String getFriendGroup() 
	{
		return friendGroup;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFriendName() {
		return friendName;
	}

	public void setFriendName(String friendName) {
		this.friendName = friendName;
	}

	public String getFriendRemark() {
		return friendRemark;
	}

	public void setFriendRemark(String friendRemark) {
		this.friendRemark = friendRemark;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("userGroup", getUserGroup())
            .append("friendId", getFriendId())
            .append("friendGroup", getFriendGroup())
            .append("friendRemark", getFriendRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
