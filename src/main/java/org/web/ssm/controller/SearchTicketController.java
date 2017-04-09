package org.web.ssm.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.web.ssm.dto.ResultModel;
import org.web.ssm.dto.SearchTicketsResult;
import org.web.ssm.model.EndStation;
import org.web.ssm.model.StartStation;
import org.web.ssm.service.IStationService;
import org.web.ssm.service.ITrainService;
import org.web.ssm.utils.JsonUtil;

import java.text.ParseException;
import java.util.List;

/**
 * 此controller用于处理前台查询的结果
 */
@RestController
@RequestMapping("/search")
public class SearchTicketController {
    @Autowired
    private IStationService stationService;
    @Autowired
    private ITrainService trainService;

    /**
     * 根据条件返回查询结果
     *
     * @param start
     * @param end
     * @param date
     * @return
     * @throws ParseException
     */
    @RequestMapping("/detail")
    public String ExecutionSearch(@RequestParam("start") String start, @RequestParam("end") String end, @RequestParam("date") String date) throws ParseException {
        System.out.println(start + "  " + end);
        List<SearchTicketsResult> list = trainService.getTrainByStation(start, end, date);

        return JsonUtil.toJson(new ResultModel<SearchTicketsResult>(list, true));
    }

    @RequestMapping("/Pricelist")
    public String Pricelist(@RequestParam("start") String start, @RequestParam("end") String end) {
        System.out.println(start + "  " + end);
        List<SearchTicketsResult> list = trainService.getTrainByStation(start, end);

        return JsonUtil.toJson(new ResultModel<SearchTicketsResult>(list, true));
    }

    @RequestMapping("/Stationlist")
    public String StastationList(@RequestParam("type") String type) {
        ResultModel resultModel = null;
        if ("sta".equals(type)) {
            List<StartStation> list = stationService.getAllStaStation();
            resultModel = new ResultModel(list, true);
        } else if ("end".equals(type)) {
            List<EndStation> list = stationService.getAllEndStation();
            resultModel = new ResultModel(list, true);
        }

        return JSON.toJSONString(resultModel);
    }
}
