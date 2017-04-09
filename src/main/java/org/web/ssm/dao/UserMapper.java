package org.web.ssm.dao;

import org.web.ssm.model.User;

import java.util.List;

public interface UserMapper {

    User selectByPrimaryKey(String userid);

    void updateUser(User user);            //更新密码方法

    void updateUserInfo(User user);        //更新用户信息方法

    void insertUser(User user);

    void deleteUser(String userid);

    List<User> selectAll();
}