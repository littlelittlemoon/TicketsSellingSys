package org.web.ssm.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.util.StringBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.web.ssm.dao.SeatMapper;
import org.web.ssm.dao.TrainMapper;
import org.web.ssm.dto.OrderInfo;
import org.web.ssm.dto.Orderresult;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.model.Pages;
import org.web.ssm.model.PassengerInfo;
import org.web.ssm.model.Seat;
import org.web.ssm.service.IOrderService;
import org.web.ssm.utils.JsonUtil;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    private Logger logger = LogManager.getLogger(OrderController.class);
    @Autowired
    private IOrderService orderService;

    @RequestMapping(value = "/executeOrder", method = RequestMethod.POST)
    @ResponseBody
    public String executeOrder(@RequestParam("json") String json, @RequestParam("orderinfo") String orderinfo) throws Exception {

        List<OrderInfo> list = JSON.parseObject(orderinfo, new TypeReference<List<OrderInfo>>() {
        });
        List<Orderresult> orderresultList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Orderresult orderresult = orderService.insertOrder(json, list.get(i).getSeat(), list.get(i).getIdcard(), list.get(i).getName());
            orderresultList.add(orderresult);
        }
        return JSON.toJSONString(new ResultModel(orderresultList, true));
    }

    @RequestMapping(value = "/OrderList", method = RequestMethod.POST)
    @ResponseBody
    public String OrderList(Integer pageSize, Integer pageCurrent, String keyword) {
        Pages<PassengerInfo> passengerInfoPages = orderService.getAllOrder(pageSize, pageCurrent, keyword);

        return JsonUtil.toJson("yyyy-MM-dd HH:mm:ss", new ResultModel<Pages<PassengerInfo>>(passengerInfoPages, true));
    }

    @RequestMapping(value = "/OrderListOnlyBuy", method = RequestMethod.POST)
    @ResponseBody
    public String OrderListOnlyBuy(Integer pageSize, Integer pageCurrent, String keyword) {
        Pages<PassengerInfo> passengerInfoPages = orderService.getOnlyBuy(pageSize, pageCurrent, keyword);

        return JsonUtil.toJson("yyyy-MM-dd HH:mm:ss", new ResultModel<Pages<PassengerInfo>>(passengerInfoPages, true));
    }

    @RequestMapping(value = "/executeReturn", method = RequestMethod.POST)
    @ResponseBody
    public String executeReturn(@RequestParam("idcard") String idcard) {

        try {
            //根据身份证号执行退票操作
            orderService.BackOrder(idcard.trim());
            return JSON.toJSONString(new ResultModel("退票成功", true));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return JSON.toJSONString(new ResultModel("退票失败", false));
        }
    }
}

