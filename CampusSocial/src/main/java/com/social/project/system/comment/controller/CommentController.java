package com.social.project.system.comment.controller;

import com.social.common.constant.Constants;
import com.social.common.utils.poi.ExcelUtil;
import com.social.common.utils.security.ShiroUtils;
import com.social.framework.aspectj.lang.annotation.Log;
import com.social.framework.aspectj.lang.enums.BusinessType;
import com.social.framework.web.controller.BaseController;
import com.social.framework.web.domain.AjaxResult;
import com.social.framework.web.page.TableDataInfo;
import com.social.project.system.comment.domain.Comment;
import com.social.project.system.comment.service.ICommentService;
import com.social.project.system.notice.domain.Notice;
import com.social.project.system.notice.service.INoticeService;
import com.social.project.system.role.domain.Role;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 评论 信息操作处理
 * 
 * @author yangjie
 * @date 2019-03-09
 */
@Controller
@RequestMapping("/system/comment")
public class CommentController extends BaseController
{
    private String prefix = "system/comment";
	
	@Autowired
	private ICommentService commentService;
	@Autowired
	private INoticeService noticeService;
	
	@RequiresPermissions("system:comment:view")
	@GetMapping()
	public String comment()
	{
	    return prefix + "/comment";
	}
	
	/**
	 * 查询评论列表
	 */
	@RequiresPermissions("system:comment:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Comment comment)
	{
		startPage();
		List<Role> roles = ShiroUtils.getSysUser().getRoles();
		if (CollectionUtils.isNotEmpty(roles)) {
			List<String> roleList = roles.stream().map(role -> role.getRoleKey()).collect(Collectors.toList());
			if (roleList.contains(Constants.STUDENT_KEY)) {
				comment.setCreateBy(ShiroUtils.getSysUser().getLoginName());
			}
		}
		List<Comment> list = commentService.selectCommentList(comment);
		list.stream().forEach(comment1 -> {
			Integer noticeId = comment1.getNoticeId();
			Notice notice = noticeService.selectNoticeById(noticeId.longValue());
			if (notice != null) {
				comment1.setNoticeCreate(notice.getCreateBy());
			}
		});
		return getDataTable(list);
	}


	
	/**
	 * 导出评论列表
	 */
	@RequiresPermissions("system:comment:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Comment comment)
    {
    	List<Comment> list = commentService.selectCommentList(comment);
        ExcelUtil<Comment> util = new ExcelUtil<Comment>(Comment.class);
        return util.exportExcel(list, "comment");
    }
	
	/**
	 * 新增评论
	 */
	@GetMapping("/add")
	public String add(Integer noticeId,ModelMap modelMap)
	{
		if (noticeId != null) {
			modelMap.put("noticeId", noticeId);
		}
		return prefix + "/add";
	}
	
	/**
	 * 新增保存评论
	 */
	@RequiresPermissions("system:comment:add")
	@Log(title = "评论", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Comment comment)
	{		
		return toAjax(commentService.insertComment(comment));
	}

	/**
	 * 修改评论
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Comment comment = commentService.selectCommentById(id);
		mmap.put("comment", comment);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存评论
	 */
	@RequiresPermissions("system:comment:edit")
	@Log(title = "评论", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Comment comment)
	{		
		return toAjax(commentService.updateComment(comment));
	}
	
	/**
	 * 删除评论
	 */
	@RequiresPermissions("system:comment:remove")
	@Log(title = "评论", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(commentService.deleteCommentByIds(ids));
	}
	
}
