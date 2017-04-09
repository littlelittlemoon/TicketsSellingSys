package org.web.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web.ssm.dao.PriceInfoMapper;
import org.web.ssm.dao.SeatMapper;
import org.web.ssm.model.PriceInfo;
import org.web.ssm.model.Seat;
import org.web.ssm.service.IPriceInfoService;

/**
 * Created by LUOLIANG on 2016/6/27.
 */
@Service
public class PriceInfoService implements IPriceInfoService {
    @Autowired
    private PriceInfoMapper priceInfoMapper;
    @Autowired
    private SeatMapper seatMapper;

    @Override
    public Integer addPriceInfo(PriceInfo priceInfo) {
        return priceInfoMapper.insertPriceInfo(priceInfo);
    }

    @Override
    public Seat getSeat(String name) {
        return seatMapper.selectByName(name);
    }

    @Override
    public Integer delPriceInfo(PriceInfo priceInfo) {
        return priceInfoMapper.deletePriceInfo(priceInfo);
    }
}
