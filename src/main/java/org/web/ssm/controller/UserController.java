package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.model.Role;
import org.web.ssm.model.User;
import org.web.ssm.service.IUserService;
import org.web.ssm.utils.JsonUtil;

import java.io.File;
import java.io.IOException;

/**
 * Created by LUOLIANG on 2016/5/19.
 */
@Controller
@RequestMapping("/User")
public class UserController {
    @Autowired
    private IUserService userService;
    private Logger logger = LogManager.getLogger(UserController.class);

    @RequestMapping("/ChangePwd")
    @ResponseBody
    public String ChangePwd(String pwd, @ModelAttribute("user") User user) {
        user.setUserpass(pwd);
        userService.updateUser(user);

        return JSON.toJSONString(new ResultModel<User>("修改成功！", true));
    }

    @RequestMapping(value = "/doLoad", method = RequestMethod.POST)
    public String doLoad(@RequestParam("file") MultipartFile file, @ModelAttribute("user") User user) throws IOException {
        if (!file.isEmpty()) {
            String filename = user.getUserid() + ".jpg";
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File("D:\\Apache Software Foundation\\tomcatimages", filename));
        }

        return "redirect:/loginController/index";
    }

    @RequestMapping(value = "/Userlist", method = RequestMethod.POST)
    @ResponseBody
    public String Userlist() {
        return JSON.toJSONString(new ResultModel<User>(userService.getAllUser(), true));
    }

    /**
     * 执行更新用户
     * @param user            前台的ajax直接和User实体进行数据绑定
     * @param roleid
     * @param rolename
     * @return
     */
    @RequestMapping(value = "/Edituser", method = RequestMethod.POST)
    @ResponseBody
    public String Edituser(User user, @RequestParam("roleid") String roleid, @RequestParam("rolename") String rolename) {
        user.setRole(new Role(roleid, rolename));

        try {
            userService.updateUserInfo(user);
            return JSON.toJSONString(new ResultModel<>("修改成功！", true));
        }catch (Exception e){
            e.getMessage();
            return JSON.toJSONString(new ResultModel<>("修改失败！", true));
        }
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping(value = "/Deluser", method = RequestMethod.POST)
    @ResponseBody
    public String Deluser(@RequestParam("id") String id) {

        try {
            userService.deleteUser(id);
            return JSON.toJSONString(new ResultModel<>("删除成功！", true));
        }catch (Exception e){
            e.getMessage();
            return JSON.toJSONString(new ResultModel<>("删除失败！", false));
        }
    }

    @RequestMapping(value = "/Adduser",method = RequestMethod.POST)
    @ResponseBody
    public String addUser(User user1, @RequestParam("roleid") String roleid, @RequestParam("rolename") String rolename) {
        user1.setRole(new Role(roleid, rolename));

        try {
            userService.insertUser(user1);
            return JSON.toJSONString(new ResultModel<>("添加成功！", true));
        }catch (Exception e){
            e.getMessage();
            return JSON.toJSONString(new ResultModel<>("添加失败！", true));
        }
    }
}
