package org.web.ssm.service;

import org.web.ssm.model.PriceInfo;
import org.web.ssm.model.Seat;

public interface IPriceInfoService {
    Integer addPriceInfo(PriceInfo priceInfo);

    Integer delPriceInfo(PriceInfo priceInfo);

    Seat getSeat(String name);
}
