package com.dl.api.common.request;

import com.dl.api.common.BaseRequest;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * Created by 001977 on 2019-07-10 14:40.
 */
@Getter
@Setter
public class UserRequest extends BaseRequest {

    private Integer id;

    /**
     * 用户名（创建后不能修改）
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 头像
     */
    private String photo;

    /**
     * 签名（在评论回复中显示）
     */
    private String signature;

    /**
     * 角色（1-管理员；2-用户）
     */
    private Byte role;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createUser;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateUser;

    /**
     * 删除标志（0-否；1-是）
     */
    private Boolean deleteFlag;
}
