package org.web.ssm.model;

import java.util.Date;

public class Train {
    private String trainid;
    private String carid;    //列车编号
    private StartStation startstation;
    private EndStation endstation;
    private String starttime;
    private Integer distance;
    private Integer standticketnum;
    private Integer seatticketnum;
    private Integer sleepticketnum;
    private String arrtime;

    public Train() {
    }

    public Train(String carid, StartStation startstation, EndStation endstation, String starttime, String arrtime, Integer distance, Integer standticketnum, Integer seatticketnum, Integer sleepticketnum) {
        this.carid = carid;
        this.startstation = startstation;
        this.endstation = endstation;
        this.starttime = starttime;
        this.arrtime = arrtime;
        this.distance = distance;
        this.standticketnum = standticketnum;
        this.seatticketnum = seatticketnum;
        this.sleepticketnum = sleepticketnum;
    }

    @Override
    public String toString() {
        return "Train{" +
                "trainid='" + trainid + '\'' +
                ", carid='" + carid + '\'' +
                ", startstation=" + startstation +
                ", endstation=" + endstation +
                ", starttime=" + starttime +
                ", endtime=" + arrtime +
                ", distance=" + distance +
                ", standticketnum=" + standticketnum +
                ", seatticketnum=" + seatticketnum +
                ", sleepticketnum=" + sleepticketnum +
                '}';
    }

    public String getTrainid() {
        return trainid;
    }

    public void setTrainid(String trainid) {
        this.trainid = trainid;
    }

    public String getCarid() {
        return carid;
    }

    public void setCarid(String carid) {
        this.carid = carid;
    }

    public StartStation getStartstation() {
        return startstation;
    }

    public void setStartstation(StartStation startstation) {
        this.startstation = startstation;
    }

    public EndStation getEndstation() {
        return endstation;
    }

    public void setEndstation(EndStation endstation) {
        this.endstation = endstation;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getArrtime() {
        return arrtime;
    }

    public void setArrtime(String arrtime) {
        this.arrtime = arrtime;
    }

    public Integer getDistance() {
        return distance;
    }

    public void setDistance(Integer distance) {
        this.distance = distance;
    }

    public Integer getStandticketnum() {
        return standticketnum;
    }

    public void setStandticketnum(Integer standticketnum) {
        this.standticketnum = standticketnum;
    }

    public Integer getSeatticketnum() {
        return seatticketnum;
    }

    public void setSeatticketnum(Integer seatticketnum) {
        this.seatticketnum = seatticketnum;
    }

    public Integer getSleepticketnum() {
        return sleepticketnum;
    }

    public void setSleepticketnum(Integer sleepticketnum) {
        this.sleepticketnum = sleepticketnum;
    }
}
