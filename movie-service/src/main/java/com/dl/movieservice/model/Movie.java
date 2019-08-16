package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 电影名
     */
    private String name;

    /**
     * 地区
     */
    @Column(name = "region_id")
    private Integer regionId;

    /**
     * 剧情
     */
    private String plot;

    /**
     * 片长
     */
    @Column(name = "running_time")
    private String runningTime;

    /**
     * 封面
     */
    private String cover;

    /**
     * 发行日期
     */
    @Column(name = "release_time")
    private Date releaseTime;

    /**
     * 累计票房收入
     */
    @Column(name = "box_office")
    private String boxOffice;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 创建人
     */
    @Column(name = "create_user")
    private String createUser;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 更新人
     */
    @Column(name = "update_user")
    private String updateUser;

    /**
     * 删除标志（0-否；1-是）
     */
    @Column(name = "delete_flag")
    private Boolean deleteFlag;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取电影名
     *
     * @return name - 电影名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置电影名
     *
     * @param name 电影名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取地区
     *
     * @return region_id - 地区
     */
    public Integer getRegionId() {
        return regionId;
    }

    /**
     * 设置地区
     *
     * @param regionId 地区
     */
    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    /**
     * 获取剧情
     *
     * @return plot - 剧情
     */
    public String getPlot() {
        return plot;
    }

    /**
     * 设置剧情
     *
     * @param plot 剧情
     */
    public void setPlot(String plot) {
        this.plot = plot;
    }

    /**
     * 获取片长
     *
     * @return running_time - 片长
     */
    public String getRunningTime() {
        return runningTime;
    }

    /**
     * 设置片长
     *
     * @param runningTime 片长
     */
    public void setRunningTime(String runningTime) {
        this.runningTime = runningTime;
    }

    /**
     * 获取封面
     *
     * @return cover - 封面
     */
    public String getCover() {
        return cover;
    }

    /**
     * 设置封面
     *
     * @param cover 封面
     */
    public void setCover(String cover) {
        this.cover = cover;
    }

    /**
     * 获取发行日期
     *
     * @return release_time - 发行日期
     */
    public Date getReleaseTime() {
        return releaseTime;
    }

    /**
     * 设置发行日期
     *
     * @param releaseTime 发行日期
     */
    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    /**
     * 获取累计票房收入
     *
     * @return box_office - 累计票房收入
     */
    public String getBoxOffice() {
        return boxOffice;
    }

    /**
     * 设置累计票房收入
     *
     * @param boxOffice 累计票房收入
     */
    public void setBoxOffice(String boxOffice) {
        this.boxOffice = boxOffice;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取创建人
     *
     * @return create_user - 创建人
     */
    public String getCreateUser() {
        return createUser;
    }

    /**
     * 设置创建人
     *
     * @param createUser 创建人
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取更新人
     *
     * @return update_user - 更新人
     */
    public String getUpdateUser() {
        return updateUser;
    }

    /**
     * 设置更新人
     *
     * @param updateUser 更新人
     */
    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    /**
     * 获取删除标志（0-否；1-是）
     *
     * @return delete_flag - 删除标志（0-否；1-是）
     */
    public Boolean getDeleteFlag() {
        return deleteFlag;
    }

    /**
     * 设置删除标志（0-否；1-是）
     *
     * @param deleteFlag 删除标志（0-否；1-是）
     */
    public void setDeleteFlag(Boolean deleteFlag) {
        this.deleteFlag = deleteFlag;
    }
}