package com.dl.movieservice.dao;

import com.dl.movieservice.model.ExpLog;
import com.dl.movieservice.model.ExpLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExpLogMapper {
    long countByExample(ExpLogExample example);

    int deleteByExample(ExpLogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ExpLog record);

    int insertSelective(ExpLog record);

    List<ExpLog> selectByExample(ExpLogExample example);

    ExpLog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ExpLog record, @Param("example") ExpLogExample example);

    int updateByExample(@Param("record") ExpLog record, @Param("example") ExpLogExample example);

    int updateByPrimaryKeySelective(ExpLog record);

    int updateByPrimaryKey(ExpLog record);
}