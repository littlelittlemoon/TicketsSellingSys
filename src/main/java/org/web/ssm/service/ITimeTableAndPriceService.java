package org.web.ssm.service;

import org.web.ssm.model.TimeTableView;

import java.util.List;

/**
 * Created by TANKAIYUE on 2016/6/2.
 * 查询时刻表和票价的service
 */
public interface ITimeTableAndPriceService {
    List<TimeTableView> getTablebyTrainid(String trainid);
}
