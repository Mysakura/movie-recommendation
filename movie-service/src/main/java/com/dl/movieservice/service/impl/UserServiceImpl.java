package com.dl.movieservice.service.impl;

import com.dl.api.common.BasePageResponse;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.movieservice.dao.UserMapper;
import com.dl.movieservice.model.User;
import com.dl.movieservice.model.UserExample;
import com.dl.movieservice.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 001977 on 2019-08-28 17:30.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public BasePageResponse<UserDTO> getUserPageList(UserRequest request) {
        BasePageResponse<UserDTO> response = new BasePageResponse<>();
        UserExample example = new UserExample();
        long count = userMapper.countByExample(example);
        example.setLimitStart(request.getLimitStart());
        example.setLimitEnd(request.getLimitEnd());
        List<User> list = userMapper.selectByExample(example);
        List<UserDTO> result = new ArrayList<>();
        list.forEach(e -> {
            UserDTO dto = new UserDTO();
            BeanUtils.copyProperties(e, dto);
            result.add(dto);
        });
        response.setDataList(result);
        response.getPageInfo()
                .setCount((int) count)
                .setPageNo(request.getPageNo())
                .setPageSize(request.getPageSize());
        return response;
    }

    @Override
    public UserDTO getUserById(UserRequest request) {
        User user = userMapper.selectByPrimaryKey(request.getId());
        UserDTO dto = new UserDTO();
        BeanUtils.copyProperties(user, dto);
        return dto;
    }

    @Override
    public int addUser(UserRequest request) {
        User user = new User();
        BeanUtils.copyProperties(request, user);
        return userMapper.insertSelective(user);
    }

    @Override
    public int updateUser(UserRequest request) {
        User user = new User();
        BeanUtils.copyProperties(request, user);
        return userMapper.updateByPrimaryKeySelective(user);
    }
}
