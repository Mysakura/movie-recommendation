package com.dl.movieadmin.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.api.common.utils.BasePackUtil;
import com.dl.api.facade.UserFacade;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * Created by 001977 on 2019-07-10 15:42.
 */
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    @Reference(version = DubboConstants.VERSION)
    private UserFacade userFacade;

    @PostMapping("/list")
    public BaseResponse<PageInfo<UserDTO>> list(@RequestBody UserRequest request) {
        BaseResponse<PageInfo<UserDTO>> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(userFacade.getUserPageList(request).getData());
        });
    }

    @PostMapping("/add")
    public BaseResponse<Integer> add(@RequestBody UserRequest request) {
        BaseResponse<Integer> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            Date date = new Date();
            request.setCreateTime(date);
            request.setUpdateTime(date);
            request.setCreateUser(getCurrentUserInfo().getUserName());
            request.setUpdateUser(getCurrentUserInfo().getUserName());
            response.setData(userFacade.addUser(request).getData());
        });
    }
}
