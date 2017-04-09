package org.web.ssm.model;

import java.io.Serializable;

public class User implements Serializable {

    private String userid;

    private String username;

    private String userpass;

    private String usersex;

    private Role role;

    @Override
    public String toString() {
        return "User{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", userpass='" + userpass + '\'' +
                ", usersex='" + usersex + '\'' +
                ", role=" + role +
                '}';
    }

    public User() {
    }

    public User(String userid, String username, String userpass, String usersex, Role role) {
        this.userid = userid;
        this.username = username;
        this.userpass = userpass;
        this.usersex = usersex;
        this.role = role;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}