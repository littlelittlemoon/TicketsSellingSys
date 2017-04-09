package org.web.daotest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dao.TimeTableViewMapper;
import org.web.ssm.model.TimeTableView;

import java.util.List;

/**
 * Created by TANKAIYUE on 2016/6/2.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-mybatis.xml"})
public class timetabledaoTest {
    @Autowired
    private TimeTableViewMapper timeTableViewMapper;

    @Test
    public void testquery(){
        List<TimeTableView> list = timeTableViewMapper.selectByTrainid("CK1001");

        System.out.println(list);
    }
}
