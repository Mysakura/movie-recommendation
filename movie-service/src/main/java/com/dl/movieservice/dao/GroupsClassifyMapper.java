package com.dl.movieservice.dao;

import com.dl.movieservice.model.GroupsClassify;
import com.dl.movieservice.model.GroupsClassifyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GroupsClassifyMapper {
    long countByExample(GroupsClassifyExample example);

    int deleteByExample(GroupsClassifyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(GroupsClassify record);

    int insertSelective(GroupsClassify record);

    List<GroupsClassify> selectByExample(GroupsClassifyExample example);

    GroupsClassify selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") GroupsClassify record, @Param("example") GroupsClassifyExample example);

    int updateByExample(@Param("record") GroupsClassify record, @Param("example") GroupsClassifyExample example);

    int updateByPrimaryKeySelective(GroupsClassify record);

    int updateByPrimaryKey(GroupsClassify record);
}