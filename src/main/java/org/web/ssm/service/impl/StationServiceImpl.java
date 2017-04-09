package org.web.ssm.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web.ssm.dao.EndStationMapper;
import org.web.ssm.dao.StartStationMapper;
import org.web.ssm.model.EndStation;
import org.web.ssm.model.StartStation;
import org.web.ssm.service.IStationService;

import java.util.List;

/**
 * Created by LUOLIANG on 2016/5/28.
 */
@Service("stationService")
public class StationServiceImpl implements IStationService {
    private Logger logger = LogManager.getLogger(StationServiceImpl.class);
    @Autowired
    private StartStationMapper startStationMapper;
    @Autowired
    private EndStationMapper endStationMapper;

    @Override
    public List<StartStation> getAllStaStation() {
        List<StartStation> list = startStationMapper.selectAll();

        return list;
    }

    @Override
    public List<EndStation> getAllEndStation() {
        List<EndStation> list = endStationMapper.selectAll();

        return list;
    }

    @Override
    public StartStation getStartstaionbyName(String stationname) {
        return startStationMapper.selectByName(stationname);
    }

    @Override
    public EndStation getEndstaionbyName(String stationname) {
        return endStationMapper.selectByName(stationname);
    }
}
