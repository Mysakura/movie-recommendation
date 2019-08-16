package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "cinema_seat")
public class CinemaSeat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 影院id
     */
    @Column(name = "cinema_id")
    private Integer cinemaId;

    /**
     * 放映厅（比如1号厅）
     */
    @Column(name = "video_hall")
    private String videoHall;

    /**
     * 第几排
     */
    @Column(name = "row_no")
    private Integer rowNo;

    /**
     * 第几座（如果是过道，座位号是0）
     */
    @Column(name = "seat_no")
    private Integer seatNo;

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
     * 获取影院id
     *
     * @return cinema_id - 影院id
     */
    public Integer getCinemaId() {
        return cinemaId;
    }

    /**
     * 设置影院id
     *
     * @param cinemaId 影院id
     */
    public void setCinemaId(Integer cinemaId) {
        this.cinemaId = cinemaId;
    }

    /**
     * 获取放映厅（比如1号厅）
     *
     * @return video_hall - 放映厅（比如1号厅）
     */
    public String getVideoHall() {
        return videoHall;
    }

    /**
     * 设置放映厅（比如1号厅）
     *
     * @param videoHall 放映厅（比如1号厅）
     */
    public void setVideoHall(String videoHall) {
        this.videoHall = videoHall;
    }

    /**
     * 获取第几排
     *
     * @return row_no - 第几排
     */
    public Integer getRowNo() {
        return rowNo;
    }

    /**
     * 设置第几排
     *
     * @param rowNo 第几排
     */
    public void setRowNo(Integer rowNo) {
        this.rowNo = rowNo;
    }

    /**
     * 获取第几座（如果是过道，座位号是0）
     *
     * @return seat_no - 第几座（如果是过道，座位号是0）
     */
    public Integer getSeatNo() {
        return seatNo;
    }

    /**
     * 设置第几座（如果是过道，座位号是0）
     *
     * @param seatNo 第几座（如果是过道，座位号是0）
     */
    public void setSeatNo(Integer seatNo) {
        this.seatNo = seatNo;
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