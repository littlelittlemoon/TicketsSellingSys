package org.web.ssm.dto;

import org.web.ssm.model.PassengerInfo;

/**
 * 向前台返回的订单结果
 */
public class Orderresult {
    private PassengerInfo passengerInfo;
    private boolean isSuccess;

    @Override
    public String toString() {
        return "Orderresult{" +
                "passengerInfo=" + passengerInfo +
                ", isSuccess=" + isSuccess +
                '}';
    }

    public PassengerInfo getPassengerInfo() {
        return passengerInfo;
    }

    public void setPassengerInfo(PassengerInfo passengerInfo) {
        this.passengerInfo = passengerInfo;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean success) {
        isSuccess = success;
    }
}
