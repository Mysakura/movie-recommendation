package com.dl.movieadmin.controller;

import com.dl.api.common.response.UserDTO;

/**
 * Created by 001977 on 2019-07-10 15:42.
 * 提供一些公共的方法，比如当前用户信息，其它Controller继承它
 */
public class BaseController {

    private UserDTO userDTO;

    /**
     * 获取当前用户信息
     * @return
     */
    public UserDTO getCurrentUserInfo(){
        if(userDTO == null){
            userDTO = new UserDTO();
            userDTO.setUserName("system");
        }
        return userDTO;
    }

    /**
     * 登陆成功之后存储当前用户信息
     * @param userInfo
     */
    public void setCurrentUserInfo(UserDTO userInfo){
        this.userDTO = userInfo;
    }
}
