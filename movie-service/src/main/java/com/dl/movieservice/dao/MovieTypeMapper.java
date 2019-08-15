package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieType;
import com.dl.movieservice.model.MovieTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieTypeMapper {
    long countByExample(MovieTypeExample example);

    int deleteByExample(MovieTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieType record);

    int insertSelective(MovieType record);

    List<MovieType> selectByExample(MovieTypeExample example);

    MovieType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieType record, @Param("example") MovieTypeExample example);

    int updateByExample(@Param("record") MovieType record, @Param("example") MovieTypeExample example);

    int updateByPrimaryKeySelective(MovieType record);

    int updateByPrimaryKey(MovieType record);
}