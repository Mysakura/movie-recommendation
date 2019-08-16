package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "user_fans")
public class UserFans {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 粉丝
     */
    @Column(name = "fans_id")
    private Integer fansId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

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
     * 获取用户
     *
     * @return user_id - 用户
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户
     *
     * @param userId 用户
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取粉丝
     *
     * @return fans_id - 粉丝
     */
    public Integer getFansId() {
        return fansId;
    }

    /**
     * 设置粉丝
     *
     * @param fansId 粉丝
     */
    public void setFansId(Integer fansId) {
        this.fansId = fansId;
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