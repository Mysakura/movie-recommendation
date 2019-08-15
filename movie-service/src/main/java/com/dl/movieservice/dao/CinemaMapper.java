package com.dl.movieservice.dao;

import com.dl.movieservice.model.Cinema;
import com.dl.movieservice.model.CinemaExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CinemaMapper {
    long countByExample(CinemaExample example);

    int deleteByExample(CinemaExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Cinema record);

    int insertSelective(Cinema record);

    List<Cinema> selectByExample(CinemaExample example);

    Cinema selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Cinema record, @Param("example") CinemaExample example);

    int updateByExample(@Param("record") Cinema record, @Param("example") CinemaExample example);

    int updateByPrimaryKeySelective(Cinema record);

    int updateByPrimaryKey(Cinema record);
}