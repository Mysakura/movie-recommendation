package com.dl.movieservice.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "cinema_order")
public class CinemaOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 订单编号
     */
    @Column(name = "order_number")
    private Long orderNumber;

    /**
     * 影院id
     */
    @Column(name = "cinema_id")
    private Integer cinemaId;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 联系手机号
     */
    private String phone;

    /**
     * 票价（单位：分）
     */
    @Column(name = "ticket_price")
    private Integer ticketPrice;

    /**
     * 折扣（计算除100）
     */
    private Integer discount;

    /**
     * 实付款（单位：分）
     */
    @Column(name = "actual_payment")
    private Integer actualPayment;

    /**
     * 座位id
     */
    @Column(name = "seat_id")
    private Integer seatId;

    /**
     * 场次
     */
    @Column(name = "shows_no")
    private Date showsNo;

    /**
     * 状态（1-已付款；2-未付款；3-已取消；4-订单超时）
     */
    private Byte status;

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
     * 获取订单编号
     *
     * @return order_number - 订单编号
     */
    public Long getOrderNumber() {
        return orderNumber;
    }

    /**
     * 设置订单编号
     *
     * @param orderNumber 订单编号
     */
    public void setOrderNumber(Long orderNumber) {
        this.orderNumber = orderNumber;
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
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取联系手机号
     *
     * @return phone - 联系手机号
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置联系手机号
     *
     * @param phone 联系手机号
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取票价（单位：分）
     *
     * @return ticket_price - 票价（单位：分）
     */
    public Integer getTicketPrice() {
        return ticketPrice;
    }

    /**
     * 设置票价（单位：分）
     *
     * @param ticketPrice 票价（单位：分）
     */
    public void setTicketPrice(Integer ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    /**
     * 获取折扣（计算除100）
     *
     * @return discount - 折扣（计算除100）
     */
    public Integer getDiscount() {
        return discount;
    }

    /**
     * 设置折扣（计算除100）
     *
     * @param discount 折扣（计算除100）
     */
    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    /**
     * 获取实付款（单位：分）
     *
     * @return actual_payment - 实付款（单位：分）
     */
    public Integer getActualPayment() {
        return actualPayment;
    }

    /**
     * 设置实付款（单位：分）
     *
     * @param actualPayment 实付款（单位：分）
     */
    public void setActualPayment(Integer actualPayment) {
        this.actualPayment = actualPayment;
    }

    /**
     * 获取座位id
     *
     * @return seat_id - 座位id
     */
    public Integer getSeatId() {
        return seatId;
    }

    /**
     * 设置座位id
     *
     * @param seatId 座位id
     */
    public void setSeatId(Integer seatId) {
        this.seatId = seatId;
    }

    /**
     * 获取场次
     *
     * @return shows_no - 场次
     */
    public Date getShowsNo() {
        return showsNo;
    }

    /**
     * 设置场次
     *
     * @param showsNo 场次
     */
    public void setShowsNo(Date showsNo) {
        this.showsNo = showsNo;
    }

    /**
     * 获取状态（1-已付款；2-未付款；3-已取消；4-订单超时）
     *
     * @return status - 状态（1-已付款；2-未付款；3-已取消；4-订单超时）
     */
    public Byte getStatus() {
        return status;
    }

    /**
     * 设置状态（1-已付款；2-未付款；3-已取消；4-订单超时）
     *
     * @param status 状态（1-已付款；2-未付款；3-已取消；4-订单超时）
     */
    public void setStatus(Byte status) {
        this.status = status;
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