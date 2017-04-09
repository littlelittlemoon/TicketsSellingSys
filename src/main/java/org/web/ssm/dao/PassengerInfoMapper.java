package org.web.ssm.dao;

import org.web.ssm.model.Pages;
import org.web.ssm.model.PassengerInfo;

import java.util.List;

public interface PassengerInfoMapper {
    /**
     * 查询所有的订单
     *
     * @param pages
     * @return
     */
    List<PassengerInfo> selectAll(Pages<PassengerInfo> pages);

    /**
     * 查询只买了票的乘客信息List
     *
     * @return
     */
    List<PassengerInfo> selectOnlybuy(Pages<PassengerInfo> pages);

    Integer getCount(Pages<PassengerInfo> pages);

    Integer insertPassengerInfo(PassengerInfo passengerInfo);

    PassengerInfo selectByPrimaryKey(String idcard);

    Integer updatePassgerInfo(PassengerInfo passengerInfo);
}
