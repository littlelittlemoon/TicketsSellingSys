package org.web.ssm.dao;

import org.web.ssm.model.PriceInfo;

/**
 * Created by LUOLIANG on 2016/6/27.
 */
public interface PriceInfoMapper {
    Integer insertPriceInfo(PriceInfo priceInfo);

    Integer deletePriceInfo(PriceInfo priceInfo);

    Integer deletePriceInfoBytrain(String trainid);
}
