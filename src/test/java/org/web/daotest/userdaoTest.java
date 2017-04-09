package org.web.daotest;

import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dao.RoleMapper;
import org.web.ssm.dao.UserMapper;
import org.web.ssm.model.Role;
import org.web.ssm.model.User;

import java.awt.*;
import java.util.*;
import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/25.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-mybatis.xml"})
public class userdaoTest {
    private static Logger logger = LogManager.getLogger(userdaoTest.class);
    @Autowired
    private UserMapper userMapper;

//    @Test
//    public void testquery() {
//        List<User> list = userMapper.selectAll();
//
//        logger.info("用户信息：" + list);
//    }

//    @Test
//    public void testupdate() {
//        User user = userMapper.selectByPrimaryKey("US1001");
//        user.setUserpass("123456");
//        userMapper.updateUser(user);
//
//        try {
//            userMapper.updateUser(user);
//            logger.info("更新成功：" + user);
//        } catch (Exception e) {
//            logger.error("更新失败" + e.getMessage());
//        }
//    }

    @Test
    public void testinsert() {
        User user = new User();

        user.setRole(new Role("R101", "管理员"));
        try {
            user.setUserpass("123456");
            user.setUsername("罗亮");
            user.setUsersex("男");
            userMapper.insertUser(user);

            logger.info("插入成功：" + user.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

//    @Test
//    public void testdelete(){
//        userMapper.deleteUser("US1004");
//    }
}
