package org.web.ssm.service;

import org.web.ssm.dto.Orderresult;
import org.web.ssm.model.Pages;
import org.web.ssm.model.PassengerInfo;

//订单处理接口
public interface IOrderService {
    Orderresult insertOrder(String json, String seat, String idcard, String passname) throws Exception;

    Pages<PassengerInfo> getAllOrder(int pageSize, int pageCurrent, String keyword);

    Pages<PassengerInfo> getOnlyBuy(int pageSize, int pageCurrent, String keyword);

    void BackOrder(String idcard);
}
