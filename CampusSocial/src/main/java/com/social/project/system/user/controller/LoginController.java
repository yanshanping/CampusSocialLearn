package com.social.project.system.user.controller;

import com.social.common.utils.ServletUtils;
import com.social.common.utils.StringUtils;
import com.social.framework.web.controller.BaseController;
import com.social.framework.web.domain.AjaxResult;
import com.social.project.system.user.domain.User;
import com.social.project.system.user.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录验证
 * 
* @author yanggang
 */
@Controller
public class LoginController extends BaseController
{
    @Autowired
    private IUserService userService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response)
    {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request))
        {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public AjaxResult ajaxLogin(String username, String password, Boolean rememberMe)
    {
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try
        {
            subject.login(token);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    @PostMapping("/register")
    @ResponseBody
    public AjaxResult ajaxRegister(User user)
    {
        try
        {
            userService.insertUser(user);
            return success();
        }
        catch (AuthenticationException e)
        {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage()))
            {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    /**
     * 注册页面
     * @return
     */
    @GetMapping("/register")
    public String register()
    {
        return "register";
    }

    @GetMapping("/unauth")
    public String unauth()
    {
        return "/error/unauth";
    }
}
