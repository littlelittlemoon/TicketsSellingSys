package org.web.daotest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dao.StartStationMapper;
import org.web.ssm.dao.TrainMapper;
import org.web.ssm.model.PriceInfoView;
import org.web.ssm.utils.JsonUtil;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by LUOLIANG on 2016/5/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-mybatis.xml"})
public class traindaoTest {
    private Logger logger = LogManager.getLogger(traindaoTest.class);
    @Autowired
    private TrainMapper trainMapper;
    @Autowired
    private StartStationMapper stationMapper;

//    @Test
//    public void testQuery() throws ParseException {
//        //2016-05-25
//        Train train = trainMapper.selectByPrimaryKey("CK1001");
//        System.out.println("查询到列车车次："+train.toString());
//        //logger.info("查询到列车车次：", train.toString());
//    }

    @Test
    public void testquerybyStation() throws ParseException {
//        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = format1.parse("2016-05-20");
//        System.out.println(date.toString());

        //查询票价信息的视图
        List<PriceInfoView> list = trainMapper.selectPriceByStation("成都", "资中");

        System.out.println(JsonUtil.toJson(list));
    }
}
