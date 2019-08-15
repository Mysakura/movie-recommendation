package com.dl.movieservice.dao;

import com.dl.movieservice.model.CinemaShowsNo;
import com.dl.movieservice.model.CinemaShowsNoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CinemaShowsNoMapper {
    long countByExample(CinemaShowsNoExample example);

    int deleteByExample(CinemaShowsNoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CinemaShowsNo record);

    int insertSelective(CinemaShowsNo record);

    List<CinemaShowsNo> selectByExample(CinemaShowsNoExample example);

    CinemaShowsNo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CinemaShowsNo record, @Param("example") CinemaShowsNoExample example);

    int updateByExample(@Param("record") CinemaShowsNo record, @Param("example") CinemaShowsNoExample example);

    int updateByPrimaryKeySelective(CinemaShowsNo record);

    int updateByPrimaryKey(CinemaShowsNo record);
}