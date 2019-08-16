package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "groups_classify")
public class GroupsClassify {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 分类名
     */
    private String name;

    /**
     * 如果当前为子级分类，这个字段为父级分类的id
     */
    @Column(name = "parent_id")
    private Integer parentId;

    /**
     * 类型（1-父级分类；2-子级分类）
     */
    private Byte type;

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
     * 获取分类名
     *
     * @return name - 分类名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置分类名
     *
     * @param name 分类名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取如果当前为子级分类，这个字段为父级分类的id
     *
     * @return parent_id - 如果当前为子级分类，这个字段为父级分类的id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置如果当前为子级分类，这个字段为父级分类的id
     *
     * @param parentId 如果当前为子级分类，这个字段为父级分类的id
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取类型（1-父级分类；2-子级分类）
     *
     * @return type - 类型（1-父级分类；2-子级分类）
     */
    public Byte getType() {
        return type;
    }

    /**
     * 设置类型（1-父级分类；2-子级分类）
     *
     * @param type 类型（1-父级分类；2-子级分类）
     */
    public void setType(Byte type) {
        this.type = type;
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