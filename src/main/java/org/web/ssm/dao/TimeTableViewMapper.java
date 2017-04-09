package org.web.ssm.dao;

import org.web.ssm.model.TimeTableView;

import java.util.List;

/**
 * Created by TANKAIYUE on 2016/6/2.
 */
public interface TimeTableViewMapper {
    List<TimeTableView> selectByTrainid(String trainid);
}
