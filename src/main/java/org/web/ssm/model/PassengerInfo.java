package org.web.ssm.model;

import java.io.Serializable;

public class PassengerInfo implements Serializable {
    private String pid;
    private String pname;
    private TicketInfo ticketInfo;
    private Sellstyle sellstyle;

    public PassengerInfo(Sellstyle sellstyle, String pid, String pname, TicketInfo ticketInfo) {
        this.sellstyle = sellstyle;
        this.pid = pid;
        this.pname = pname;
        this.ticketInfo = ticketInfo;
    }

    public PassengerInfo() {

    }

    @Override
    public String toString() {
        return "PassengerInfo{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", ticketInfo=" + ticketInfo +
                ", sellstyle=" + sellstyle +
                '}';
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public TicketInfo getTicketInfo() {
        return ticketInfo;
    }

    public void setTicketInfo(TicketInfo ticketInfo) {
        this.ticketInfo = ticketInfo;
    }

    public Sellstyle getSellstyle() {
        return sellstyle;
    }

    public void setSellstyle(Sellstyle sellstyle) {
        this.sellstyle = sellstyle;
    }
}
