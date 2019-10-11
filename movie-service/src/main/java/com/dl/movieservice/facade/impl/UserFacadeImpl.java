package com.dl.movieservice.facade.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.dl.api.common.BasePageResponse;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.api.common.utils.BasePackUtil;
import com.dl.api.facade.UserFacade;
import com.dl.movieservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 用户Dubbo服务
 */
@Service(registry = "movieRegistry", timeout = 5000, version = DubboConstants.VERSION, retries = 3, loadbalance = "random", actives = 5)
public class UserFacadeImpl implements UserFacade {

    @Autowired
    private UserService userService;

    @Override
    public BaseResponse<UserDTO> login(UserRequest request) {
        BaseResponse<UserDTO> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userService.getUserForLogin(request));
        });
    }

    @Override
    public BaseResponse<BasePageResponse<UserDTO>> getUserPageList(UserRequest request) {
        BaseResponse<BasePageResponse<UserDTO>> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userService.getUserPageList(request));
        });
    }

    @Override
    public BaseResponse<UserDTO> getUser(UserRequest request) {
        BaseResponse<UserDTO> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userService.getUserById(request));
        });
    }

    @Override
    public BaseResponse<Integer> addUser(UserRequest request) {
        BaseResponse<Integer> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userService.addUser(request));
        });
    }

    @Override
    public BaseResponse<Integer> updateUser(UserRequest request) {
        BaseResponse<Integer> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userService.updateUser(request));
        });
    }
}
