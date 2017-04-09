package org.web.daotest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.dao.*;
import org.web.ssm.model.PassengerInfo;
import org.web.ssm.model.Sellstyle;
import org.web.ssm.model.TicketInfo;
import org.web.ssm.model.Train;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-mybatis.xml"})
public class TicketInfodaoTest {
    private Logger logger = LogManager.getLogger(TicketInfodaoTest.class);
    @Autowired
    private TicketInfoMapper ticketInfoMapper;
    @Autowired
    private PassengerInfoMapper passengerInfoMapper;
    @Autowired
    private SellstyleMapper sellstyleMapper;

//    @Test
//    public void Testquery() {
//        TicketInfo ticketInfo = ticketInfoMapper.selectByPrimaryKey("TK1001");
//        System.out.println(passengerInfoMapper.selectAll());
//        List<PassengerInfo> list = passengerInfoMapper.selectOnlybuy();
//        System.out.println(list);
//    }

//    @Test
//    public void TestInsert() {
//
//        Sellstyle sellstyle = sellstyleMapper.selectByPrimaryKey("B101");
//
//       PassengerInfo passengerInfo = new PassengerInfo(sellstyle,"123132","1234", ticketInfoMapper.selectByPrimaryKey("TK1001"));
//        System.out.println(passengerInfo.toString());
//       passengerInfoMapper.insertPassengerInfo(passengerInfo);
//
//    }
}