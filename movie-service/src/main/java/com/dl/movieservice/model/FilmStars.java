package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "film_stars")
public class FilmStars {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 影人名字
     */
    private String name;

    /**
     * 影人英文名字
     */
    @Column(name = "en_name")
    private String enName;

    /**
     * 影人照片
     */
    private String photo;

    /**
     * 影人介绍
     */
    private String introduce;

    /**
     * 职业（多个用 | 分隔）
     */
    private String profession;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 出生地
     */
    @Column(name = "region_id")
    private Integer regionId;

    /**
     * 身高（厘米）
     */
    private Integer height;

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
     * 获取影人名字
     *
     * @return name - 影人名字
     */
    public String getName() {
        return name;
    }

    /**
     * 设置影人名字
     *
     * @param name 影人名字
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取影人英文名字
     *
     * @return en_name - 影人英文名字
     */
    public String getEnName() {
        return enName;
    }

    /**
     * 设置影人英文名字
     *
     * @param enName 影人英文名字
     */
    public void setEnName(String enName) {
        this.enName = enName;
    }

    /**
     * 获取影人照片
     *
     * @return photo - 影人照片
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * 设置影人照片
     *
     * @param photo 影人照片
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * 获取影人介绍
     *
     * @return introduce - 影人介绍
     */
    public String getIntroduce() {
        return introduce;
    }

    /**
     * 设置影人介绍
     *
     * @param introduce 影人介绍
     */
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    /**
     * 获取职业（多个用 | 分隔）
     *
     * @return profession - 职业（多个用 | 分隔）
     */
    public String getProfession() {
        return profession;
    }

    /**
     * 设置职业（多个用 | 分隔）
     *
     * @param profession 职业（多个用 | 分隔）
     */
    public void setProfession(String profession) {
        this.profession = profession;
    }

    /**
     * 获取生日
     *
     * @return birthday - 生日
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置生日
     *
     * @param birthday 生日
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取出生地
     *
     * @return region_id - 出生地
     */
    public Integer getRegionId() {
        return regionId;
    }

    /**
     * 设置出生地
     *
     * @param regionId 出生地
     */
    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    /**
     * 获取身高（厘米）
     *
     * @return height - 身高（厘米）
     */
    public Integer getHeight() {
        return height;
    }

    /**
     * 设置身高（厘米）
     *
     * @param height 身高（厘米）
     */
    public void setHeight(Integer height) {
        this.height = height;
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