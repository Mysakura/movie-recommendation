package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "movie_critics")
public class MovieCritics {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 电影id
     */
    @Column(name = "movie_id")
    private Integer movieId;

    /**
     * 标题
     */
    private String title;

    /**
     * 短影评内容
     */
    @Column(name = "short_content")
    private String shortContent;

    /**
     * 类型（1-长影评；2-短影评）
     */
    private Byte type;

    /**
     * 赞
     */
    private Integer support;

    /**
     * 摘要
     */
    private String digest;

    /**
     * 状态（1-发布；2-草稿）
     */
    private Byte status;

    /**
     * 允许评论（0-否；1-是）
     */
    @Column(name = "allow_comment")
    private Boolean allowComment;

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
     * 长影评内容
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
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取短影评内容
     *
     * @return short_content - 短影评内容
     */
    public String getShortContent() {
        return shortContent;
    }

    /**
     * 设置短影评内容
     *
     * @param shortContent 短影评内容
     */
    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    /**
     * 获取类型（1-长影评；2-短影评）
     *
     * @return type - 类型（1-长影评；2-短影评）
     */
    public Byte getType() {
        return type;
    }

    /**
     * 设置类型（1-长影评；2-短影评）
     *
     * @param type 类型（1-长影评；2-短影评）
     */
    public void setType(Byte type) {
        this.type = type;
    }

    /**
     * 获取赞
     *
     * @return support - 赞
     */
    public Integer getSupport() {
        return support;
    }

    /**
     * 设置赞
     *
     * @param support 赞
     */
    public void setSupport(Integer support) {
        this.support = support;
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
     * 获取长影评内容
     *
     * @return front_content - 长影评内容
     */
    public String getFrontContent() {
        return frontContent;
    }

    /**
     * 设置长影评内容
     *
     * @param frontContent 长影评内容
     */
    public void setFrontContent(String frontContent) {
        this.frontContent = frontContent;
    }
}