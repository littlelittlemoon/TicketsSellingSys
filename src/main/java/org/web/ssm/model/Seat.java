package org.web.ssm.model;

public class Seat {
    private String seatid;
    private String seatname;

    @Override
    public String toString() {
        return "Seat{" +
                "seatid='" + seatid + '\'' +
                ", seatname='" + seatname + '\'' +
                '}';
    }

    public String getSeatid() {
        return seatid;
    }

    public void setSeatid(String seatid) {
        this.seatid = seatid;
    }

    public String getSeatname() {
        return seatname;
    }

    public void setSeatname(String seatname) {
        this.seatname = seatname;
    }
}
