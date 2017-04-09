package org.web.ssm.model;

import java.io.Serializable;

/**
 * Created by LUOLIANG on 2016/5/24.
 */
public class Role implements Serializable {
    private String roleid;
    private String rolename;

    public Role() {
    }

    public Role(String roleid, String rolename) {
        this.roleid = roleid;
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleid='" + roleid + '\'' +
                ", rolename='" + rolename + '\'' +
                '}';
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
