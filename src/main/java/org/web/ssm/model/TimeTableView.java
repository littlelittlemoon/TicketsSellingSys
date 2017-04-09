package org.web.ssm.model;

import java.util.Date;

/**
 * Created by TANKAIYUE on 2016/6/2.
 * 列车时刻表视图实体类
 */
public class TimeTableView {
    private String tid;
    private Date statime;
    private Date arrtime;
    private String startstation;
    private String endstation;

    public TimeTableView() {
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    @Override
    public String toString() {
        return "TimeTableView{" +
                "tid='" + tid + '\'' +
                ", statime=" + statime +
                ", arrtime=" + arrtime +
                ", startstation='" + startstation + '\'' +
                ", endstation='" + endstation + '\'' +
                '}';
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

    public String getStartstation() {
        return startstation;
    }

    public void setStartstation(String startstation) {
        this.startstation = startstation;
    }

    public String getEndstation() {
        return endstation;
    }

    public void setEndstation(String endstation) {
        this.endstation = endstation;
    }

    public TimeTableView(String tid, Date statime, Date arrtime, String startstation, String endstation) {
        this.tid = tid;
        this.statime = statime;
        this.arrtime = arrtime;

        this.startstation = startstation;
        this.endstation = endstation;
    }
}
