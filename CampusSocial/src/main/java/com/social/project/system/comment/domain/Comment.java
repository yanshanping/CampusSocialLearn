package com.social.project.system.comment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.social.framework.web.domain.BaseEntity;
import java.util.Date;

/**
 * 评论表 cap_comment
 * 
 * @author yangjie
 * @date 2019-03-09
 */
public class Comment extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 评论ID */
	private Integer id;
	/** 评论内容 */
	private String content;
	/** 被评论帖子ID */
	private Integer noticeId;
	/** 创建者 */
	private String createBy;
	/** 创建时间 */
	private Date createTime;
	/** 更新者 */
	private String updateBy;
	/** 更新时间 */
	private Date updateTime;
	/** 删除标志（0代表存在 2代表删除） */
	private String delFlag;
	/** 备注 */
	private String remark;
	/**
	 * 用户头像
	 */
	private String avatar;
	/**
	 * 是否是回复，1 评论 2 回复
	 */
	private Integer replySign;
	/**
	 * 帖子创建者
	 */
	private String noticeCreate;
	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setContent(String content) 
	{
		this.content = content;
	}

	public String getContent() 
	{
		return content;
	}
	public void setNoticeId(Integer noticeId) 
	{
		this.noticeId = noticeId;
	}

	public Integer getNoticeId() 
	{
		return noticeId;
	}
	public void setCreateBy(String createBy) 
	{
		this.createBy = createBy;
	}

	public String getCreateBy() 
	{
		return createBy;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setUpdateBy(String updateBy) 
	{
		this.updateBy = updateBy;
	}

	public String getUpdateBy() 
	{
		return updateBy;
	}
	public void setUpdateTime(Date updateTime) 
	{
		this.updateTime = updateTime;
	}

	public Date getUpdateTime() 
	{
		return updateTime;
	}
	public void setDelFlag(String delFlag) 
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag() 
	{
		return delFlag;
	}
	public void setRemark(String remark) 
	{
		this.remark = remark;
	}

	public String getRemark() 
	{
		return remark;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getReplySign() {
		return replySign;
	}

	public void setReplySign(Integer replySign) {
		this.replySign = replySign;
	}

	public String getNoticeCreate() {
		return noticeCreate;
	}

	public void setNoticeCreate(String noticeCreate) {
		this.noticeCreate = noticeCreate;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("content", getContent())
            .append("noticeId", getNoticeId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .append("remark", getRemark())
            .toString();
    }
}
