package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieActor;
import com.dl.movieservice.model.MovieActorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieActorMapper {
    long countByExample(MovieActorExample example);

    int deleteByExample(MovieActorExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieActor record);

    int insertSelective(MovieActor record);

    List<MovieActor> selectByExample(MovieActorExample example);

    MovieActor selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieActor record, @Param("example") MovieActorExample example);

    int updateByExample(@Param("record") MovieActor record, @Param("example") MovieActorExample example);

    int updateByPrimaryKeySelective(MovieActor record);

    int updateByPrimaryKey(MovieActor record);
}