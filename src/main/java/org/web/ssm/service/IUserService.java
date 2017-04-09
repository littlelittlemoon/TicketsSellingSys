package org.web.ssm.service;

import org.web.ssm.model.User;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/8.
 */
public interface IUserService {
    User getUserById(String userId);

    List<User> getAllUser();

    void updateUser(User user);

    void updateUserInfo(User user);

    void insertUser(User user);

    void deleteUser(String id);
}
