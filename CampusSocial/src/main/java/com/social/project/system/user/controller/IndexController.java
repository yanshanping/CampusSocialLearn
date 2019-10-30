package com.social.project.system.user.controller;

import com.social.common.utils.StringUtils;
import com.social.framework.config.SocialConfig;
import com.social.framework.web.controller.BaseController;
import com.social.framework.web.page.PageDomain;
import com.social.framework.web.service.DictService;
import com.social.project.system.comment.domain.Comment;
import com.social.project.system.comment.service.ICommentService;
import com.social.project.system.friend.domain.Friend;
import com.social.project.system.friend.service.IFriendService;
import com.social.project.system.menu.domain.Menu;
import com.social.project.system.menu.service.IMenuService;
import com.social.project.system.notice.domain.Notice;
import com.social.project.system.notice.service.INoticeService;
import com.social.project.system.user.domain.User;
import com.social.project.system.user.service.IUserService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * 首页 业务处理
 * 
* @author yanggang
 */
@Controller
public class IndexController extends BaseController
{
    @Autowired
    private IMenuService menuService;

    @Autowired
    private SocialConfig socialConfig;
    @Autowired
    private DictService dictService;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ICommentService commentService;
    @Autowired
    private IFriendService friendService;
    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        User user = getSysUser();
        // 根据用户id取出菜单
        List<Menu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", socialConfig.getCopyrightYear());
        return "index";
    }

    // 系统首页
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        User user = getSysUser();
        PageDomain pageDomain = new PageDomain();
        pageDomain.setPageNum(1);
        pageDomain.setPageSize(5);
        startPage(pageDomain);
        List<Notice> notices = noticeService.selectNoticeList(new Notice());
        if (CollectionUtils.isNotEmpty(notices)) {
            notices.stream().forEach(notice -> {
                Comment comment = new Comment();
                comment.setNoticeId(notice.getNoticeId().intValue());
                List<Comment> comments = commentService.selectCommentList(comment);
                if (CollectionUtils.isNotEmpty(comments)) {
                    comments.stream().forEach(comment1 -> {
                        User userByLoginName = userService.selectUserByLoginName(comment1.getCreateBy());
                        if (userByLoginName != null) {
                            if (StringUtils.isNotEmpty(userByLoginName.getUserName())) {
                                comment1.setCreateBy(userByLoginName.getUserName());
                            }
                            comment1.setAvatar(userByLoginName.getAvatar());
                        }
                    });
                    notice.setComments(comments);
                }
                User userByLoginName = userService.selectUserByLoginName(notice.getCreateBy());
                if (userByLoginName != null) {
                    if (StringUtils.isNotEmpty(userByLoginName.getUserName())) {
                        notice.setCreateBy(userByLoginName.getUserName());
                    }
                    notice.setAvatar(userByLoginName.getAvatar());
                }
            });
        }
        user.setSex(dictService.getLabel("sys_user_sex", user.getSex()));
        Notice notice = new Notice();
        notice.setCreateBy(user.getLoginName());
        List<Notice> noticeList = noticeService.selectNoticeList(notice);
        Friend friend = new Friend();
        friend.setUserId(user.getUserId().intValue());
        List<Friend> friends = friendService.selectFriendList(friend);
        mmap.put("friendsSize", friends.size());
        friend.setUserId(null);
        friend.setFriendId(user.getUserId().intValue());
        List<Friend> addMe = friendService.selectFriendList(friend);
        mmap.put("addMeSize", addMe.size());
        mmap.put("user", user);
        mmap.put("noticeSize", noticeList.size());
        mmap.put("notices", notices);
        mmap.put("version", socialConfig.getVersion());
        return "main";
    }
}
