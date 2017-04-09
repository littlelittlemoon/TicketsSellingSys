package org.web.ssm.dto;

/**
 * 前台传来的订单对象
 */
public class OrderInfo {
    private String idcard;
    private String name;
    private String seat;

    @Override
    public String toString() {
        return "OrderInfo{" +
                "idcard='" + idcard + '\'' +
                ", name='" + name + '\'' +
                ", seat='" + seat + '\'' +
                '}';
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }
}
