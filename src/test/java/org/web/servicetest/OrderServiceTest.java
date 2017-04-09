package org.web.servicetest;

import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web.ssm.model.Pages;
import org.web.ssm.model.PassengerInfo;
import org.web.ssm.service.IOrderService;
import org.web.ssm.utils.JsonUtil;

import java.util.List;

/**
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:configs/spring-*.xml"})
public class OrderServiceTest {
    @Autowired
    private IOrderService orderService;

//    @Test
//    public void testInsertorder() {
//        String jsonp = "{\"ticketinfolist\":[{\"arrTime\":\"2016-05-20 12:30:00\",\"distance\":1024,\"endStation\":\"资中\",\"seatType\":\"站票\",\"staStation\":\"成都\",\"staTime\":\"2016-05-20 09:00:00\",\"ticketprice\":20,\"trainid\":\"CK1001\"},{\"arrTime\":\"2016-05-20 12:30:00\",\"distance\":1024,\"endStation\":\"资中\",\"seatType\":\"坐票\",\"staStation\":\"成都\",\"staTime\":\"2016-05-20 09:00:00\",\"ticketprice\":30,\"trainid\":\"CK1001\"},{\"arrTime\":\"2016-05-20 12:30:00\",\"distance\":1024,\"endStation\":\"资中\",\"seatType\":\"卧票\",\"staStation\":\"成都\",\"staTime\":\"2016-05-20 09:00:00\",\"ticketprice\":40,\"trainid\":\"CK1001\"}],\"train\":{\"carid\":\"TR1001\",\"distance\":1024,\"endstation\":{\"stationid\":\"EST105\",\"stationname\":\"资中\"},\"seatticketnum\":45,\"sleepticketnum\":12,\"standticketnum\":24,\"startstation\":{\"stationid\":\"SST102\",\"stationname\":\"成都\"},\"starttime\":\"2016-05-20 00:00:00\",\"trainid\":\"CK1001\"}}";
//
//
//
//        orderService.insertOrder(jsonp,"站票","123412","luoll");
//    }

    @Test
    public void testSelect() {
        Pages<PassengerInfo> passengerInfoPages = orderService.getOnlyBuy(2, 1, "罗亮");

        System.out.println(passengerInfoPages);
    }

//    @Test
//    public void testUpdate() {
//        orderService.BackOrder("1234245345");
//    }
}

