package org.web.servicetest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.model.StartStation;
import org.web.ssm.service.IStationService;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/28.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-*.xml"})
public class StationServiceTest {
    private Logger logger = LogManager.getLogger(StationServiceTest.class);
    @Autowired
    private IStationService stationService;

    @Test
    public void testQuery() {
        List<StartStation> list = stationService.getAllStaStation();

        logger.info("查询到的结果：" + list);
    }
}
