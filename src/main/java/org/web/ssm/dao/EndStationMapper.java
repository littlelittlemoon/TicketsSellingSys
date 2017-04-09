package org.web.ssm.dao;

import org.web.ssm.model.EndStation;
import org.web.ssm.model.StartStation;

import java.util.List;

public interface EndStationMapper {
    EndStation selectByPrimaryKey(String stationid);

    List<EndStation> selectAll();

    EndStation selectByName(String stationname);
}
