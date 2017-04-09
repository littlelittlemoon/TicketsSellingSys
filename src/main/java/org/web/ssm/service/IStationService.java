package org.web.ssm.service;

import org.web.ssm.model.EndStation;
import org.web.ssm.model.StartStation;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/28.
 */
public interface IStationService {
    List<StartStation> getAllStaStation();

    List<EndStation> getAllEndStation();

    StartStation getStartstaionbyName(String stationname);

    EndStation getEndstaionbyName(String stationname);
}
