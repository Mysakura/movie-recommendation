package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "exp_log")
public class ExpLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 经验值
     */
    private Integer exp;

    /**
     * 经验值来源
     */
    @Column(name = "exp_source")
    private String expSource;

    /**
     * 用户
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

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
     * 获取经验值
     *
     * @return exp - 经验值
     */
    public Integer getExp() {
        return exp;
    }

    /**
     * 设置经验值
     *
     * @param exp 经验值
     */
    public void setExp(Integer exp) {
        this.exp = exp;
    }

    /**
     * 获取经验值来源
     *
     * @return exp_source - 经验值来源
     */
    public String getExpSource() {
        return expSource;
    }

    /**
     * 设置经验值来源
     *
     * @param expSource 经验值来源
     */
    public void setExpSource(String expSource) {
        this.expSource = expSource;
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
}