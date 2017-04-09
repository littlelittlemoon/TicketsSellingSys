package org.web.ssm.model;

import java.io.Serializable;

public class Sellstyle implements Serializable {
    private String sid;
    private String sname;

    @Override
    public String toString() {
        return "Sellstyle{" +
                "sid='" + sid + '\'' +
                ", sname='" + sname + '\'' +
                '}';
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
}
