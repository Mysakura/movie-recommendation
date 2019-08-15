package com.dl.movieservice.model;

import java.util.Date;

public class ExpLog {
    private Integer id;

    private Integer exp;

    private String expSource;

    private Integer userId;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public String getExpSource() {
        return expSource;
    }

    public void setExpSource(String expSource) {
        this.expSource = expSource;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}