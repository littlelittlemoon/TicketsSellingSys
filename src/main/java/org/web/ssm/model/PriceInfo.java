package org.web.ssm.model;

import java.util.Date;

public class PriceInfo {
    private Train train;
    private Seat seat;
    private StartStation startStation;
    private EndStation endStation;
    private Date starttime;
    private Date arrtime;
    private Double distance;
    private Double price;

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    @Override
    public String toString() {
        return "PriceInfo{" +
                "train=" + train +
                ", seat=" + seat +
                ", startStation=" + startStation +
                ", endStation=" + endStation +
                ", starttime=" + starttime +
                ", arrtime=" + arrtime +
                ", distance=" + distance +
                ", price=" + price +
                '}';
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public StartStation getStartStation() {
        return startStation;
    }

    public void setStartStation(StartStation startStation) {
        this.startStation = startStation;
    }

    public EndStation getEndStation() {
        return endStation;
    }

    public void setEndStation(EndStation endStation) {
        this.endStation = endStation;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getArrtime() {
        return arrtime;
    }

    public void setArrtime(Date arrtime) {
        this.arrtime = arrtime;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}