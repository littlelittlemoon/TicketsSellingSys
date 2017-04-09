package org.web.servicetest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.model.User;
import org.web.ssm.service.IUserService;
import javax.annotation.Resource;


/**
 * Created by LUOLIANG on 2016/5/8.
 */
@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath*:configs/spring-mybatis.xml"})
public class UserServiceTest {
    private static Logger logger = LogManager.getLogger(UserServiceTest.class);
    // private ApplicationContext ac = null;

    @Resource
    private IUserService userService;

    // @Before
    // public void before() {
    // ac = new
    // ClassPathXmlApplicationContext("classpath:/configs/spring-mybatis.xml");
    // userService = (IUserService) ac.getBean("userService");
    // }

//    @Test
//    public void testQuery() {
//        User user = userService.getUserById(1L);
//        logger.info("值：" + user.toString());
//    }

//    @Test
//    public void testUpdate() {
//        User user = new User();
//        user.setId(33L);
//        user.setName("罗亮啊");
//        user.setAge("20");
//
//        userService.updateUser(user);
//
//        logger.info("更新成功："+user.toString());
//    }

//    @Test
//    public void testInsert() {
//        User user = new User();
//        user.setName("1234");
//        user.setAge("1234");
//
//        userService.insertUser(user);
//
//        logger.info("插入成功：" + user.toString());
//    }

//    @Test
//    public void testDelete() {
//        Long id = 26L;
//
//        userService.deleteUser(id);
//
//        logger.info("删除成功,id为" + id);
//    }

}
