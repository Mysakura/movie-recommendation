package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

public class Cinema {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 影院名称
     */
    private String name;

    /**
     * 影院地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 影院照片（最多五张,json）
     */
    private String picture;

    /**
     * 营业时间
     */
    @Column(name = "open_begin_time")
    private Date openBeginTime;

    /**
     * 结束时间
     */
    @Column(name = "open_end_time")
    private Date openEndTime;

    /**
     * 影院介绍
     */
    private String introduce;

    /**
     * 经度
     */
    private Double longitude;

    /**
     * 维度
     */
    private Double latitude;

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
     * 获取影院名称
     *
     * @return name - 影院名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置影院名称
     *
     * @param name 影院名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取影院地址
     *
     * @return address - 影院地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置影院地址
     *
     * @param address 影院地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取联系电话
     *
     * @return phone - 联系电话
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系电话
     *
     * @param phone 联系电话
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取影院照片（最多五张,json）
     *
     * @return picture - 影院照片（最多五张,json）
     */
    public String getPicture() {
        return picture;
    }

    /**
     * 设置影院照片（最多五张,json）
     *
     * @param picture 影院照片（最多五张,json）
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * 获取营业时间
     *
     * @return open_begin_time - 营业时间
     */
    public Date getOpenBeginTime() {
        return openBeginTime;
    }

    /**
     * 设置营业时间
     *
     * @param openBeginTime 营业时间
     */
    public void setOpenBeginTime(Date openBeginTime) {
        this.openBeginTime = openBeginTime;
    }

    /**
     * 获取结束时间
     *
     * @return open_end_time - 结束时间
     */
    public Date getOpenEndTime() {
        return openEndTime;
    }

    /**
     * 设置结束时间
     *
     * @param openEndTime 结束时间
     */
    public void setOpenEndTime(Date openEndTime) {
        this.openEndTime = openEndTime;
    }

    /**
     * 获取影院介绍
     *
     * @return introduce - 影院介绍
     */
    public String getIntroduce() {
        return introduce;
    }

    /**
     * 设置影院介绍
     *
     * @param introduce 影院介绍
     */
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    /**
     * 获取经度
     *
     * @return longitude - 经度
     */
    public Double getLongitude() {
        return longitude;
    }

    /**
     * 设置经度
     *
     * @param longitude 经度
     */
    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    /**
     * 获取维度
     *
     * @return latitude - 维度
     */
    public Double getLatitude() {
        return latitude;
    }

    /**
     * 设置维度
     *
     * @param latitude 维度
     */
    public void setLatitude(Double latitude) {
        this.latitude = latitude;
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