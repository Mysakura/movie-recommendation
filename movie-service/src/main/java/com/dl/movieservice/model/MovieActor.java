package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "movie_actor")
public class MovieActor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 电影id
     */
    @Column(name = "movie_id")
    private Integer movieId;

    /**
     * 影人id
     */
    @Column(name = "star_id")
    private Integer starId;

    /**
     * 类型（1-导演；2-编剧；3-制片；4-主演）
     */
    private Byte type;

    /**
     * 饰演的角色
     */
    private String character;

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
     * 获取电影id
     *
     * @return movie_id - 电影id
     */
    public Integer getMovieId() {
        return movieId;
    }

    /**
     * 设置电影id
     *
     * @param movieId 电影id
     */
    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    /**
     * 获取影人id
     *
     * @return star_id - 影人id
     */
    public Integer getStarId() {
        return starId;
    }

    /**
     * 设置影人id
     *
     * @param starId 影人id
     */
    public void setStarId(Integer starId) {
        this.starId = starId;
    }

    /**
     * 获取类型（1-导演；2-编剧；3-制片；4-主演）
     *
     * @return type - 类型（1-导演；2-编剧；3-制片；4-主演）
     */
    public Byte getType() {
        return type;
    }

    /**
     * 设置类型（1-导演；2-编剧；3-制片；4-主演）
     *
     * @param type 类型（1-导演；2-编剧；3-制片；4-主演）
     */
    public void setType(Byte type) {
        this.type = type;
    }

    /**
     * 获取饰演的角色
     *
     * @return character - 饰演的角色
     */
    public String getCharacter() {
        return character;
    }

    /**
     * 设置饰演的角色
     *
     * @param character 饰演的角色
     */
    public void setCharacter(String character) {
        this.character = character;
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