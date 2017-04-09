package org.web.ssm.model;

import java.io.Serializable;


public class EndStation implements Serializable {
    private String stationid;
    private String stationname;

    public String getStationid() {
        return stationid;
    }

    public void setStationid(String stationid) {
        this.stationid = stationid;
    }

    public String getStationname() {
        return stationname;
    }

    public void setStationname(String stationname) {
        this.stationname = stationname;
    }

    @Override
    public String toString() {
        return "EndStation{" +
                "stationid='" + stationid + '\'' +
                ", stationname='" + stationname + '\'' +
                '}';
    }
}
