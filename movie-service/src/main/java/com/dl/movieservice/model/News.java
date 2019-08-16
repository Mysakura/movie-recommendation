package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 新闻标题
     */
    private String title;

    /**
     * 新闻关联的电影
     */
    @Column(name = "movie_id")
    private Integer movieId;

    /**
     * 新闻关联的明星
     */
    @Column(name = "star_id")
    private Integer starId;

    /**
     * 摘要
     */
    private String digest;

    /**
     * 允许评论（0-否；1-是）
     */
    @Column(name = "allow_comment")
    private Boolean allowComment;

    /**
     * 状态（1-发布；2-草稿）
     */
    private Byte status;

    /**
     * 浏览量
     */
    @Column(name = "page_view")
    private Integer pageView;

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
     * 新闻内容
     */
    @Column(name = "front_content")
    private String frontContent;

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
     * 获取新闻标题
     *
     * @return title - 新闻标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置新闻标题
     *
     * @param title 新闻标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取新闻关联的电影
     *
     * @return movie_id - 新闻关联的电影
     */
    public Integer getMovieId() {
        return movieId;
    }

    /**
     * 设置新闻关联的电影
     *
     * @param movieId 新闻关联的电影
     */
    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    /**
     * 获取新闻关联的明星
     *
     * @return star_id - 新闻关联的明星
     */
    public Integer getStarId() {
        return starId;
    }

    /**
     * 设置新闻关联的明星
     *
     * @param starId 新闻关联的明星
     */
    public void setStarId(Integer starId) {
        this.starId = starId;
    }

    /**
     * 获取摘要
     *
     * @return digest - 摘要
     */
    public String getDigest() {
        return digest;
    }

    /**
     * 设置摘要
     *
     * @param digest 摘要
     */
    public void setDigest(String digest) {
        this.digest = digest;
    }

    /**
     * 获取允许评论（0-否；1-是）
     *
     * @return allow_comment - 允许评论（0-否；1-是）
     */
    public Boolean getAllowComment() {
        return allowComment;
    }

    /**
     * 设置允许评论（0-否；1-是）
     *
     * @param allowComment 允许评论（0-否；1-是）
     */
    public void setAllowComment(Boolean allowComment) {
        this.allowComment = allowComment;
    }

    /**
     * 获取状态（1-发布；2-草稿）
     *
     * @return status - 状态（1-发布；2-草稿）
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * 设置状态（1-发布；2-草稿）
     *
     * @param status 状态（1-发布；2-草稿）
     */
    public void setStatus(Byte status) {
        this.status = status;
    }

    /**
     * 获取浏览量
     *
     * @return page_view - 浏览量
     */
    public Integer getPageView() {
        return pageView;
    }

    /**
     * 设置浏览量
     *
     * @param pageView 浏览量
     */
    public void setPageView(Integer pageView) {
        this.pageView = pageView;
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

    /**
     * 获取新闻内容
     *
     * @return front_content - 新闻内容
     */
    public String getFrontContent() {
        return frontContent;
    }

    /**
     * 设置新闻内容
     *
     * @param frontContent 新闻内容
     */
    public void setFrontContent(String frontContent) {
        this.frontContent = frontContent;
    }
}