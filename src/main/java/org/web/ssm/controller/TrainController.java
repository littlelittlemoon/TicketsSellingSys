package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.apache.ibatis.executor.ExecutorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.web.ssm.dao.EndStationMapper;
import org.web.ssm.dao.StartStationMapper;
import org.web.ssm.dao.TrainMapper;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.model.EndStation;
import org.web.ssm.model.Pages;
import org.web.ssm.model.StartStation;
import org.web.ssm.model.Train;
import org.web.ssm.service.ITrainService;
import org.web.ssm.utils.JsonUtil;

/**
 * 车次管理Controller
 */
@RestController
@RequestMapping("/Train")
public class TrainController {
    @Autowired
    private ITrainService trainService;
    @Autowired
    private StartStationMapper startStationMapper;
    @Autowired
    private EndStationMapper endStationMapper;

    @RequestMapping(value = "/trainlist", method = RequestMethod.POST)
    public String trainlist(Integer pageSize, Integer pageCurrent, String keyword) {
        Pages<Train> passengerInfoPages = trainService.getAllTrain(pageSize, pageCurrent, keyword);

        return JSON.toJSONString(new ResultModel<Pages<Train>>(passengerInfoPages, true), SerializerFeature.WriteDateUseDateFormat, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping(value = "/addTrain", method = RequestMethod.POST)
    public String addTrain(Train train, String sStation, String eStation) {
        System.out.println(train);
        StartStation startStation = startStationMapper.selectByName(sStation);
        EndStation endStation = endStationMapper.selectByName(eStation);
        train.setStartstation(startStation);
        train.setEndstation(endStation);

        try {
            trainService.insertTrain(train);
            return JSON.toJSONString(new ResultModel<>("添加列车成功", true));
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString(new ResultModel<>("添加列车失败", false));
        }

    }

    @RequestMapping(value = "/delTrain", method = RequestMethod.POST)
    public String delTrain(String trainid) {
        try {
            trainService.deleteTrain(trainid);
            return JSON.toJSONString(new ResultModel<>("删除成功", true));
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString(new ResultModel<>("删除失败", false));
        }
    }

    @RequestMapping(value = "/updateTrain", method = RequestMethod.POST)
    public String updateTrain(Train train, String sStation, String eStation) {
        try {
            StartStation startStation = startStationMapper.selectByName(sStation);
            EndStation endStation = endStationMapper.selectByName(eStation);
            train.setStartstation(startStation);
            train.setEndstation(endStation);
            trainService.updateTrain(train);
            return JSON.toJSONString(new ResultModel<>("更新成功", true));
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString(new ResultModel<>("更新失败", false));
        }
    }
}
