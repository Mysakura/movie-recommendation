package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieCritics;
import com.dl.movieservice.model.MovieCriticsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieCriticsMapper {
    long countByExample(MovieCriticsExample example);

    int deleteByExample(MovieCriticsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieCritics record);

    int insertSelective(MovieCritics record);

    List<MovieCritics> selectByExampleWithBLOBs(MovieCriticsExample example);

    List<MovieCritics> selectByExample(MovieCriticsExample example);

    MovieCritics selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieCritics record, @Param("example") MovieCriticsExample example);

    int updateByExampleWithBLOBs(@Param("record") MovieCritics record, @Param("example") MovieCriticsExample example);

    int updateByExample(@Param("record") MovieCritics record, @Param("example") MovieCriticsExample example);

    int updateByPrimaryKeySelective(MovieCritics record);

    int updateByPrimaryKeyWithBLOBs(MovieCritics record);

    int updateByPrimaryKey(MovieCritics record);
}