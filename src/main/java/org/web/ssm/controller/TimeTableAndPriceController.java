package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web.ssm.dao.TrainMapper;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.model.Pages;
import org.web.ssm.model.TimeTableView;
import org.web.ssm.model.Train;
import org.web.ssm.service.ITimeTableAndPriceService;
import org.web.ssm.service.ITrainService;
import org.web.ssm.service.impl.TimeTableAndPriceService;
import org.web.ssm.service.impl.TrainServiceImpl;
import org.web.ssm.utils.JsonUtil;

import java.util.List;

/**
 * Created by TANKAIYUE on 2016/6/2.
 */
@Controller
@RequestMapping("/TimeAndPrice")
public class TimeTableAndPriceController {
    @Autowired
    private ITimeTableAndPriceService timeTableAndPriceService;
    @Autowired
    private ITrainService trainService;


    @RequestMapping(value = "/trainlist", method = RequestMethod.GET)
    @ResponseBody
    public String trainlist(Integer pageSize, Integer pageCurrent, String keyword) {
        Pages<Train> passengerInfoPages = trainService.getAllTrain(20, 1, keyword);

        return JsonUtil.toJson("yyyy-MM-dd HH:mm:ss", new ResultModel<Pages<Train>>(passengerInfoPages, true));
    }

    @RequestMapping(value = "/searchTable", method = RequestMethod.POST)
    @ResponseBody
    public String searchTable(@RequestParam("trainid") String trainid) {

        return JsonUtil.toJson(new ResultModel<TimeTableView>(timeTableAndPriceService.getTablebyTrainid(trainid), true));
    }
}
