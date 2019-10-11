package com.dl.movieservice.service;

import com.dl.api.common.BasePageResponse;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;

/**
 * 用户接口
 */
public interface UserService {

    /**
     * 用户分页
     * @param request
     * @return
     */
    BasePageResponse<UserDTO> getUserPageList(UserRequest request);

    /**
     * 获取单个用户
     * @param request
     * @return
     */
    UserDTO getUserById(UserRequest request);

    /**
     * 登录（根据用户名/邮箱）
     * @param request
     * @return
     */
    UserDTO getUserForLogin(UserRequest request);

    /**
     * 添加用户
     * @param request
     */
    int addUser(UserRequest request);

    /**
     * 更新用户
     * @param request
     */
    int updateUser(UserRequest request);
}
