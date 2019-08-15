package com.dl.movieservice.dao;

import com.dl.movieservice.model.CinemaSeat;
import com.dl.movieservice.model.CinemaSeatExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CinemaSeatMapper {
    long countByExample(CinemaSeatExample example);

    int deleteByExample(CinemaSeatExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CinemaSeat record);

    int insertSelective(CinemaSeat record);

    List<CinemaSeat> selectByExample(CinemaSeatExample example);

    CinemaSeat selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CinemaSeat record, @Param("example") CinemaSeatExample example);

    int updateByExample(@Param("record") CinemaSeat record, @Param("example") CinemaSeatExample example);

    int updateByPrimaryKeySelective(CinemaSeat record);

    int updateByPrimaryKey(CinemaSeat record);
}