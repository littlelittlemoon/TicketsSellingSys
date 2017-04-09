package org.web.ssm.model;

import java.io.Serializable;

/**
 * Created by LUOLIANG on 2016/5/26.
 * 站点实体类
 */

public class StartStation implements Serializable {
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
        return "StartStation{" +
                "stationid='" + stationid + '\'' +
                ", stationname='" + stationname + '\'' +
                '}';
    }
}
