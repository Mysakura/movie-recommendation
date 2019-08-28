package com.dl.movieservice.service.impl;

import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.api.common.utils.PageModel;
import com.dl.movieservice.mapper.mappers.UserMapper;
import com.dl.movieservice.model.User;
import com.dl.movieservice.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 001977 on 2019-08-28 17:30.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public PageInfo<UserDTO> getUserPageList(UserRequest request) {
        PageModel pageModel = new PageModel.Instance(request.getPageNo(), request.getPageSize()).newPageModel();
        List<User> userList;
        try {
            PageModel.parsePageModel(pageModel);
            Example e = new Example(User.class);
            Example.Criteria criteria = e.createCriteria();
            if(request.getRole() != null){
                criteria.andEqualTo("role", request.getRole());
            }
            userList = userMapper.selectByExample(e);
        } finally {
            PageHelper.clearPage();
        }

        List<UserDTO> result = Lists.newArrayList();
        userList.forEach(user -> {
            UserDTO dto = new UserDTO();
            BeanUtils.copyProperties(user, dto);
            result.add(dto);
        });

        return new PageInfo<>(result);
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
