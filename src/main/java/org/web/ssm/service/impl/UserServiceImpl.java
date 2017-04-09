package org.web.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.web.ssm.dao.UserMapper;
import org.web.ssm.model.User;
import org.web.ssm.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by LUOLIANG on 2016/5/8.
 */

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserById(String userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public List<User> getAllUser() {

        return userMapper.selectAll();
    }

    @Override
    public void updateUserInfo(User user) {
        userMapper.updateUserInfo(user);
    }

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public void deleteUser(String id) {
        userMapper.deleteUser(id);
    }
}
