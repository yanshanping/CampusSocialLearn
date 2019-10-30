package com.social.project.system.friend.controller;

import com.social.common.constant.Constants;
import com.social.common.utils.poi.ExcelUtil;
import com.social.common.utils.security.ShiroUtils;
import com.social.framework.aspectj.lang.annotation.Log;
import com.social.framework.aspectj.lang.enums.BusinessType;
import com.social.framework.web.controller.BaseController;
import com.social.framework.web.domain.AjaxResult;
import com.social.framework.web.page.TableDataInfo;
import com.social.project.system.friend.domain.Friend;
import com.social.project.system.friend.service.IFriendService;
import com.social.project.system.role.domain.Role;
import com.social.project.system.user.domain.User;
import com.social.project.system.user.service.IUserService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户朋友 信息操作处理
 * 
 * @author yangjie
 * @date 2019-03-09
 */
@Controller
@RequestMapping("/system/friend")
public class FriendController extends BaseController
{
    private String prefix = "system/friend";
	
	@Autowired
	private IFriendService friendService;
	@Autowired
	private IUserService userService;
	
	@RequiresPermissions("system:friend:view")
	@GetMapping()
	public String friend()
	{
	    return prefix + "/friend";
	}
	
	/**
	 * 查询用户朋友列表
	 */
	@RequiresPermissions("system:friend:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Friend friend)
	{
		startPage();
		List<Role> roles = ShiroUtils.getSysUser().getRoles();
		if (CollectionUtils.isNotEmpty(roles)) {
			List<String> roleList = roles.stream().map(role -> role.getRoleKey()).collect(Collectors.toList());
			if (roleList.contains(Constants.STUDENT_KEY)) {
				friend.setCreateBy(ShiroUtils.getSysUser().getLoginName());
			}
		}
        List<Friend> list = friendService.selectFriendList(friend);
		if (CollectionUtils.isNotEmpty(list)) {
			list.stream().forEach(friend1 -> {
				Integer userId = friend1.getUserId();
				User user = userService.selectUserById(userId.longValue());
				if (user != null) {
					friend1.setUserName(user.getLoginName());
				}
				User friendUser = userService.selectUserById(friend1.getFriendId().longValue());
				if (friendUser != null) {
					friend1.setFriendName(friendUser.getLoginName());
				}
			});
		}
		return getDataTable(list);
	}
	
	
	/**
	 * 导出用户朋友列表
	 */
	@RequiresPermissions("system:friend:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Friend friend)
    {
    	List<Friend> list = friendService.selectFriendList(friend);
        ExcelUtil<Friend> util = new ExcelUtil<Friend>(Friend.class);
        return util.exportExcel(list, "friend");
    }
	
	/**
	 * 新增用户朋友
	 */
	@GetMapping("/add")
	public String add(ModelMap modelMap)
	{
		List<User> users = userService.selectUserList(new User());
		modelMap.put("userList", users);
		User sysUser = ShiroUtils.getSysUser();
		modelMap.put("sysUser", sysUser);
		return prefix + "/add";
	}
	
	/**
	 * 新增保存用户朋友
	 */
	@RequiresPermissions("system:friend:add")
	@Log(title = "用户朋友", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Friend friend)
	{		
		return toAjax(friendService.insertFriend(friend));
	}

	/**
	 * 修改用户朋友
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Friend friend = friendService.selectFriendById(id);
		mmap.put("friend", friend);
		List<User> users = userService.selectUserList(new User());
		mmap.put("userList", users);
		User sysUser = ShiroUtils.getSysUser();
		mmap.put("sysUser", sysUser);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存用户朋友
	 */
	@RequiresPermissions("system:friend:edit")
	@Log(title = "用户朋友", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Friend friend)
	{		
		return toAjax(friendService.updateFriend(friend));
	}
	
	/**
	 * 删除用户朋友
	 */
	@RequiresPermissions("system:friend:remove")
	@Log(title = "用户朋友", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(friendService.deleteFriendByIds(ids));
	}
	
}
