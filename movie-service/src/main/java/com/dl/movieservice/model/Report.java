package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 举报类型（1-购票问题；2-信息勘误；3-其它问题）
     */
    private Integer type;

    /**
     * 问题描述
     */
    private String describe;

    /**
     * 处理结果
     */
    @Column(name = "deal_result")
    private String dealResult;

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
     * 获取举报类型（1-购票问题；2-信息勘误；3-其它问题）
     *
     * @return type - 举报类型（1-购票问题；2-信息勘误；3-其它问题）
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置举报类型（1-购票问题；2-信息勘误；3-其它问题）
     *
     * @param type 举报类型（1-购票问题；2-信息勘误；3-其它问题）
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取问题描述
     *
     * @return describe - 问题描述
     */
    public String getDescribe() {
        return describe;
    }

    /**
     * 设置问题描述
     *
     * @param describe 问题描述
     */
    public void setDescribe(String describe) {
        this.describe = describe;
    }

    /**
     * 获取处理结果
     *
     * @return deal_result - 处理结果
     */
    public String getDealResult() {
        return dealResult;
    }

    /**
     * 设置处理结果
     *
     * @param dealResult 处理结果
     */
    public void setDealResult(String dealResult) {
        this.dealResult = dealResult;
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