package org.web.ssm.dao;

import org.web.ssm.model.StartStation;

import java.util.List;

public interface StartStationMapper {
    StartStation selectByPrimaryKey(String stationid);

    List<StartStation> selectAll();

    StartStation selectByName(String stationname);
}
