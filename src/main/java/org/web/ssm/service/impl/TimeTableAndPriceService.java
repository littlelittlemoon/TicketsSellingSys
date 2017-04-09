package org.web.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web.ssm.dao.TimeTableViewMapper;
import org.web.ssm.model.TimeTableView;
import org.web.ssm.service.ITimeTableAndPriceService;

import java.util.List;

/**
 * Created by TANKAIYUE on 2016/6/2.
 */
@Service
public class TimeTableAndPriceService implements ITimeTableAndPriceService{
    @Autowired
    private TimeTableViewMapper timeTableViewMapper;

    @Override
    public List<TimeTableView> getTablebyTrainid(String trainid) {

        return timeTableViewMapper.selectByTrainid(trainid);
    }
}
