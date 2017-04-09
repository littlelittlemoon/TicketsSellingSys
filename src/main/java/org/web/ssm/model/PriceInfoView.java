package org.web.ssm.model;

import org.web.ssm.model.Train;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 视图V_TICKETPRICE的实体类，返回票价信息
 */
public class PriceInfoView implements Serializable {
    private String trainid;
    private String staStation;
    private String endStation;
    private Date staTime;
    private Date arrTime;
    private Integer distance;
    private String seatType;
    private Integer ticketprice;

    @Override
    public String toString() {
        return "PriceInfoView{" +
                "trainid='" + trainid + '\'' +
                ", staStation='" + staStation + '\'' +
                ", endStation='" + endStation + '\'' +
                ", staTime=" + staTime +
                ", arrTime=" + arrTime +
                ", distance=" + distance +
                ", seatType='" + seatType + '\'' +
                ", ticketprice=" + ticketprice +
                '}';
    }

    public String getTrainid() {
        return trainid;
    }

    public void setTrainid(String trainid) {
        this.trainid = trainid;
    }

    public String getStaStation() {
        return staStation;
    }

    public void setStaStation(String staStation) {
        this.staStation = staStation;
    }

    public String getEndStation() {
        return endStation;
    }

    public void setEndStation(String endStation) {
        this.endStation = endStation;
    }

    public Date getStaTime() {
        return staTime;
    }

    public void setStaTime(Date staTime) {
        this.staTime = staTime;
    }

    public Date getArrTime() {
        return arrTime;
    }

    public void setArrTime(Date arrTime) {
        this.arrTime = arrTime;
    }

    public Integer getDistance() {
        return distance;
    }

    public void setDistance(Integer distance) {
        this.distance = distance;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public Integer getTicketprice() {
        return ticketprice;
    }

    public void setTicketprice(Integer ticketprice) {
        this.ticketprice = ticketprice;
    }
}
