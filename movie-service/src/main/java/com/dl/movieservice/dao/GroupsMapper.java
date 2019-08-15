package com.dl.movieservice.dao;

import com.dl.movieservice.model.Groups;
import com.dl.movieservice.model.GroupsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GroupsMapper {
    long countByExample(GroupsExample example);

    int deleteByExample(GroupsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Groups record);

    int insertSelective(Groups record);

    List<Groups> selectByExample(GroupsExample example);

    Groups selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Groups record, @Param("example") GroupsExample example);

    int updateByExample(@Param("record") Groups record, @Param("example") GroupsExample example);

    int updateByPrimaryKeySelective(Groups record);

    int updateByPrimaryKey(Groups record);
}