package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.model.EndStation;
import org.web.ssm.model.PriceInfo;
import org.web.ssm.model.StartStation;
import org.web.ssm.model.Train;
import org.web.ssm.service.IPriceInfoService;
import org.web.ssm.service.IStationService;
import org.web.ssm.service.ITrainService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/PriceInfo")
public class PriceInfoController {
    @Autowired
    private IPriceInfoService priceInfoService;
    @Autowired
    private IStationService stationService;
    @Autowired
    private ITrainService trainService;

    @RequestMapping(value = "/addPriceInfo", method = RequestMethod.POST)
    public String addPriceInfo(@RequestParam("trainid") String trainid, @RequestParam("seat") String seat, @RequestParam("stastation") String stastation,
                               @RequestParam("endstation") String endstation, @RequestParam("starttime") String starttime,
                               @RequestParam("arrtime") String arrtime, @RequestParam("distance") Double distance, @RequestParam("price") Double price) throws ParseException {
        PriceInfo priceInfo = new PriceInfo();

        StartStation startStation1 = stationService.getStartstaionbyName(stastation);
        EndStation endStation1 = stationService.getEndstaionbyName(endstation);
        Train train1 = trainService.getTrainById(trainid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        priceInfo.setTrain(train1);
        priceInfo.setStartStation(startStation1);
        priceInfo.setEndStation(endStation1);
        priceInfo.setSeat(priceInfoService.getSeat(seat));
        priceInfo.setStarttime(sdf.parse(starttime));
        priceInfo.setArrtime(sdf.parse(arrtime));
        priceInfo.setDistance(distance);
        priceInfo.setPrice(price);
        System.out.println(priceInfo);
        int res = priceInfoService.addPriceInfo(priceInfo);
        if (res == 1) {
            return JSON.toJSONString(new ResultModel<>("添加成功！", true));
        } else
            return JSON.toJSONString(new ResultModel<>("添加失败！", false));

    }
}
