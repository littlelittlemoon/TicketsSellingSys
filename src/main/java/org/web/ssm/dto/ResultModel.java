package org.web.ssm.dto;

import java.util.List;

public class ResultModel<T> {
    private List<T> items;              //集合类型model
    private T model;                    //单个实体类型model
    private String msg;                 //消息
    private String url;                 //链接
    private boolean isSuccess;          //是否登陆成功

    public ResultModel(String msg, boolean isSuccess) {
        this.msg = msg;
        this.isSuccess = isSuccess;
    }

    public ResultModel(List<T> items, boolean isSuccess) {
        this.items = items;
        this.isSuccess = isSuccess;
    }

    public ResultModel(T model, boolean isSuccess) {
        this.model = model;
        this.isSuccess = isSuccess;
    }

    public ResultModel(T model, String url, boolean isSuccess) {
        this.model = model;
        this.url = url;
        this.isSuccess = isSuccess;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public T getModel() {
        return model;
    }

    public void setModel(T model) {
        this.model = model;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean success) {
        isSuccess = success;
    }

    @Override
    public String toString() {
        return "ResultModel{" +
                "items=" + items +
                ", model=" + model +
                ", msg='" + msg + '\'' +
                ", url='" + url + '\'' +
                ", isSuccess=" + isSuccess +
                '}';
    }
}
