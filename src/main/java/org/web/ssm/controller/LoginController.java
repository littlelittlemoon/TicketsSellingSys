package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.web.ssm.model.User;
import org.web.ssm.service.IUserService;
import org.web.ssm.dto.ResultModel;

/**
 * Created by LUOLIANG on 2016/5/14.
 */
@Controller
@RequestMapping("/loginController")
@SessionAttributes("user")
public class LoginController {
    @Autowired
    private IUserService userService;

    /**
     * 判断用户是否登陆成功，通过json返回结果
     *
     * @param name
     * @param pwd
     * @return json
     */
    @RequestMapping(value = "/isLogin")
    public
    @ResponseBody
    String isLogin(@RequestParam(value = "name") String name, @RequestParam(value = "pwd") String pwd, Model model) {
        ResultModel<User> resModel;

        User user = userService.getUserById(name);

        if (user != null && user.getUserpass().equals(pwd)) {
            resModel = new ResultModel<User>("登录成功", true);
            model.addAttribute("user", user);
        } else {
            resModel = new ResultModel<User>("登录失败", false);
        }

        System.out.println("返回json数据：" + JSON.toJSONString(resModel));

        //通过fastjson把resultmodel序列化成json数据
        return JSON.toJSONString(resModel);
    }


    /**
     * 获取session当中保存的当前登录用户信息，并返回json给前台
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/currentuser", method = RequestMethod.GET)
    @ResponseBody
    public String Currentuser(@ModelAttribute("user") User user) {
        ResultModel<User> resultModel = new ResultModel<User>(user, String.valueOf(user.getUserid()) + ".jpg", true);

        return JSON.toJSONString(resultModel);
    }

    /**
     * 当前用户退出登录，清除登录session
     *
     * @param sessionStatus
     * @return
     */
    @RequestMapping("/outLogin")
    public String outLogin(SessionStatus sessionStatus) {
        sessionStatus.setComplete();

        return "redirect:/";
    }
}
