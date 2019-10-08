package com.dl.api.facade;

import com.dl.api.common.BasePageResponse;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;

/**
 * Created by 001977 on 2019-07-10 14:36.
 */
public interface UserFacade {

    /**
     * 用户列表
     * @param request
     * @return
     */
    BaseResponse<BasePageResponse<UserDTO>> getUserPageList(UserRequest request);

    /**
     * 用户详细
     * @param request
     * @return
     */
    BaseResponse<UserDTO> getUser(UserRequest request);

    /**
     * 添加用户
     * @param request
     * @return
     */
    BaseResponse<Integer> addUser(UserRequest request);

    /**
     * 更新用户
     * @param request
     * @return
     */
    BaseResponse<Integer> updateUser(UserRequest request);
}
