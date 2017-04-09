package org.web.ssm.model;


import java.util.Date;

//票价信息表实体类
public class TicketInfo {
    private String ticketid;
    private StartStation startStation;
    private EndStation endStation;
    private Date statime;
    private Date arrtime;
    private Seat seat;
    private Integer price;
    private Train train;

    public TicketInfo() {
    }

    public TicketInfo(StartStation startStation, EndStation endStation, Date statime, Date arrtime, Seat seat, Integer price, Train train) {
        this.startStation = startStation;
        this.endStation = endStation;
        this.statime = statime;
        this.arrtime = arrtime;
        this.seat = seat;
        this.price = price;
        this.train = train;
    }

    @Override
    public String toString() {
        return "TicketInfo{" +
                "ticketid='" + ticketid + '\'' +
                ", startStation=" + startStation +
                ", endStation=" + endStation +
                ", statime=" + statime +
                ", arrtime=" + arrtime +
                ", seat=" + seat +
                ", price=" + price +
                ", train=" + train +
                '}';
    }

    public String getTicketid() {
        return ticketid;
    }

    public void setTicketid(String ticketid) {
        this.ticketid = ticketid;
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

    public Date getStatime() {
        return statime;
    }

    public void setStatime(Date statime) {
        this.statime = statime;
    }

    public Date getArrtime() {
        return arrtime;
    }

    public void setArrtime(Date arrtime) {
        this.arrtime = arrtime;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }
}
