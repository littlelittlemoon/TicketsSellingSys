package org.web.daotest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dao.EndStationMapper;
import org.web.ssm.model.EndStation;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/28.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-mybatis.xml"})
public class stationdaoTest {
    private Logger logger = LogManager.getLogger(stationdaoTest.class);
    @Autowired
    private EndStationMapper endStationMapper;

    @Test
    public void testSelectAll() {
        List<EndStation> list = endStationMapper.selectAll();

        logger.info("车站信息：" + list);
    }
}
