package com.dl.movieadmin.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.dl.api.common.BasePageResponse;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.constants.SystemConstants;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.api.common.utils.BasePackUtil;
import com.dl.api.common.utils.JwtUtils;
import com.dl.api.facade.UserFacade;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 001977 on 2019-07-10 15:42.
 */
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    @Reference(version = DubboConstants.VERSION)
    private UserFacade userFacade;

    @PostMapping("/login")
    public BaseResponse<UserDTO> login(@RequestBody UserRequest request, HttpServletResponse httpResponse) {
        BaseResponse<UserDTO> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(request.getUserName(), request.getPassword());
            subject.login(token);

            UserDTO user = (UserDTO) subject.getPrincipal();
            setCurrentUserInfo(user);
            // 载荷
            Map<String, Object> map = new HashMap<>();
            map.put("userId", user.getId());
            map.put("expireTime", new Date().getTime() + SystemConstants.sessionTimeout);

            String newToken = JwtUtils.createToken(map);
            httpResponse.setHeader("x-auth-token", newToken);
            httpResponse.setHeader("Access-Control-Expose-Headers", "x-auth-token");
            response.setData(user);
        });
    }

    @PostMapping("/list")
    public BaseResponse<BasePageResponse<UserDTO>> list(@RequestBody UserRequest request) {
        BaseResponse<BasePageResponse<UserDTO>> response = new BaseResponse<>();
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
