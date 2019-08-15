package com.dl.movieservice.dao;

import com.dl.movieservice.model.UserFans;
import com.dl.movieservice.model.UserFansExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserFansMapper {
    long countByExample(UserFansExample example);

    int deleteByExample(UserFansExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserFans record);

    int insertSelective(UserFans record);

    List<UserFans> selectByExample(UserFansExample example);

    UserFans selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserFans record, @Param("example") UserFansExample example);

    int updateByExample(@Param("record") UserFans record, @Param("example") UserFansExample example);

    int updateByPrimaryKeySelective(UserFans record);

    int updateByPrimaryKey(UserFans record);
}