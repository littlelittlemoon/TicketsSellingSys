package org.web.ssm.service.impl;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.web.ssm.dao.*;
import org.web.ssm.dto.Orderresult;
import org.web.ssm.dto.SearchTicketsResult;
import org.web.ssm.model.*;
import org.web.ssm.service.IOrderService;

import java.util.List;

/**
 *
 */
@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    //    进行dao的依赖注入
    @Autowired
    private TicketInfoMapper ticketInfoMapper;
    @Autowired
    private PassengerInfoMapper passengerInfoMapper;
    @Autowired
    private SellstyleMapper sellstyleMapper;
    @Autowired
    private SeatMapper seatMapper;
    @Autowired
    private StartStationMapper startStationMapper;
    @Autowired
    private EndStationMapper endStationMapper;
    @Autowired
    private TrainMapper trainMapper;

    @Override
    public Pages<PassengerInfo> getAllOrder(int pageSize, int pageCurrent, String keyword) {
        Pages<PassengerInfo> passengerInfoPages = new Pages<PassengerInfo>();
        passengerInfoPages.setPageSize(pageSize);
        passengerInfoPages.setMaxRow(pageSize * pageCurrent + 1);
        passengerInfoPages.setMinRow(pageSize * (pageCurrent - 1));
        passengerInfoPages.setCurrentPage(pageCurrent);
        passengerInfoPages.setKeyWords(keyword);
        passengerInfoPages.setResults(passengerInfoMapper.selectAll(passengerInfoPages));
        passengerInfoPages.setTotalRow(passengerInfoMapper.getCount(passengerInfoPages));
        int totalPage = passengerInfoPages.getTotalRow() % passengerInfoPages.getPageSize() == 0 ? passengerInfoPages.getTotalRow() / passengerInfoPages.getPageSize() : passengerInfoPages.getTotalRow() / passengerInfoPages.getPageSize() + 1;
        passengerInfoPages.setTotalPage(totalPage);

        return passengerInfoPages;
    }

    @Override
    public Pages<PassengerInfo> getOnlyBuy(int pageSize, int pageCurrent, String keyword) {
        Pages<PassengerInfo> passengerInfoPages = new Pages<PassengerInfo>();
        passengerInfoPages.setPageSize(pageSize);
        passengerInfoPages.setMaxRow(pageSize * pageCurrent + 1);
        passengerInfoPages.setMinRow(pageSize * (pageCurrent - 1));
        passengerInfoPages.setCurrentPage(pageCurrent);
        passengerInfoPages.setKeyWords(keyword);
        passengerInfoPages.setMsg("Onlybuy");
        passengerInfoPages.setResults(passengerInfoMapper.selectOnlybuy(passengerInfoPages));
        passengerInfoPages.setTotalRow(passengerInfoMapper.getCount(passengerInfoPages));
        int totalPage = passengerInfoPages.getTotalRow() % passengerInfoPages.getPageSize() == 0 ? passengerInfoPages.getTotalRow() / passengerInfoPages.getPageSize() : passengerInfoPages.getTotalRow() / passengerInfoPages.getPageSize() + 1;
        passengerInfoPages.setTotalPage(totalPage);

        return passengerInfoPages;
    }

    @Override
    public Orderresult insertOrder(String json, String seat, String idcard, String passname) throws Exception {

        //通过fastjson把json字符串转化为搜索结果实体   此实体里面包括列车信息，以及list类型的票价信息
        SearchTicketsResult searchTicketsResult = JSON.parseObject(json, SearchTicketsResult.class);

        //定义票价
        Integer price;
        if (seat.equals("站票")) {
            price = searchTicketsResult.getTicketinfolist().get(0).getTicketprice();
        } else if (seat.equals("坐票")) {
            price = searchTicketsResult.getTicketinfolist().get(1).getTicketprice();
        } else {
            price = searchTicketsResult.getTicketinfolist().get(2).getTicketprice();
        }

        // 查询座位实体
        Seat seat1 = seatMapper.selectByName(seat);

        TicketInfo ticketInfo = new TicketInfo(startStationMapper.selectByName(searchTicketsResult.getTicketinfolist().get(0).getStaStation()),
                endStationMapper.selectByName(searchTicketsResult.getTicketinfolist().get(0).getEndStation()), searchTicketsResult.getTicketinfolist().get(0).getStaTime(),
                searchTicketsResult.getTicketinfolist().get(0).getArrTime(), seat1, price, searchTicketsResult.getTrain());

        // 生成购票类型，默认为购票
        Sellstyle sellstyle = sellstyleMapper.selectByPrimaryKey("B101");

        PassengerInfo passengerInfo = passengerInfoMapper.selectByPrimaryKey(idcard);
        if (passengerInfo == null) {
            //插入车票信息
            ticketInfoMapper.insertTicketInfo(ticketInfo);
            // 生成订单，保存数据库
            passengerInfo = new PassengerInfo(sellstyle, idcard, passname, ticketInfoMapper.selectByPrimaryKey(ticketInfo.getTicketid()));
            Integer res = passengerInfoMapper.insertPassengerInfo(passengerInfo);
            Orderresult orderresult = new Orderresult();
            if (res == 1) {
                orderresult.setSuccess(true);
            } else {
                orderresult.setSuccess(false);
            }
            orderresult.setPassengerInfo(passengerInfo);
            //座位-1
            reducenum(seat, searchTicketsResult);
            return orderresult;
        } else if (passengerInfo.getSellstyle().getSname().equals("退票")) {
            passengerInfo.setSellstyle(sellstyle);
            passengerInfo.setTicketInfo(ticketInfoMapper.selectByPrimaryKey(ticketInfo.getTicketid()));
            Integer res = passengerInfoMapper.updatePassgerInfo(passengerInfo);
            Orderresult orderresult = new Orderresult();
            if (res == 1) {
                orderresult.setSuccess(true);
            } else {
                orderresult.setSuccess(false);
            }
            orderresult.setPassengerInfo(passengerInfo);
            //座位-1
            reducenum(seat, searchTicketsResult);
            return orderresult;
        } else {
            Orderresult orderresult = new Orderresult();
            orderresult.setSuccess(false);
            orderresult.setPassengerInfo(passengerInfo);
            return orderresult;
        }
    }

    //用来减座位数量
    public void reducenum(String seat, SearchTicketsResult searchTicketsResult) {
        if (seat.equals("站票")) {
            trainMapper.reduceStandNumberByid(searchTicketsResult.getTrain().getTrainid());
        } else if (seat.equals("坐票")) {
            trainMapper.reduceSeatNumberByid(searchTicketsResult.getTrain().getTrainid());
        } else {
            trainMapper.reduceSleepNumberByid(searchTicketsResult.getTrain().getTrainid());
        }
    }

    @Override
    @Transactional
    public void BackOrder(String idcard) {
        //查询旅客信息
        PassengerInfo passengerInfo = passengerInfoMapper.selectByPrimaryKey(idcard);

        //获取到列车编号
        String trainid = passengerInfo.getTicketInfo().getTrain().getTrainid();
        //获取座位信息
        String seat = passengerInfo.getTicketInfo().getSeat().getSeatid();

        //修改订单为退票
        passengerInfo.setSellstyle(sellstyleMapper.selectByPrimaryKey("B103"));

        // 存入数据库
        passengerInfoMapper.updatePassgerInfo(passengerInfo);

        if ("S101".equals(seat)) {
            trainMapper.addStandNumberByid(trainid);
        } else if ("S102".equals(seat)) {
            trainMapper.addSeatNumberByid(trainid);
        } else if ("S103".equals(seat)) {
            trainMapper.addSleepNumberByid(trainid);
        }
    }
}
