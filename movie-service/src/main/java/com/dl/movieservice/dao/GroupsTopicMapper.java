package com.dl.movieservice.dao;

import com.dl.movieservice.model.GroupsTopic;
import com.dl.movieservice.model.GroupsTopicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GroupsTopicMapper {
    long countByExample(GroupsTopicExample example);

    int deleteByExample(GroupsTopicExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(GroupsTopic record);

    int insertSelective(GroupsTopic record);

    List<GroupsTopic> selectByExampleWithBLOBs(GroupsTopicExample example);

    List<GroupsTopic> selectByExample(GroupsTopicExample example);

    GroupsTopic selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") GroupsTopic record, @Param("example") GroupsTopicExample example);

    int updateByExampleWithBLOBs(@Param("record") GroupsTopic record, @Param("example") GroupsTopicExample example);

    int updateByExample(@Param("record") GroupsTopic record, @Param("example") GroupsTopicExample example);

    int updateByPrimaryKeySelective(GroupsTopic record);

    int updateByPrimaryKeyWithBLOBs(GroupsTopic record);

    int updateByPrimaryKey(GroupsTopic record);
}