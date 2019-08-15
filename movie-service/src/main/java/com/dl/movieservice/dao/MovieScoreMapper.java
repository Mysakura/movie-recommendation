package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieScore;
import com.dl.movieservice.model.MovieScoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieScoreMapper {
    long countByExample(MovieScoreExample example);

    int deleteByExample(MovieScoreExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieScore record);

    int insertSelective(MovieScore record);

    List<MovieScore> selectByExample(MovieScoreExample example);

    MovieScore selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieScore record, @Param("example") MovieScoreExample example);

    int updateByExample(@Param("record") MovieScore record, @Param("example") MovieScoreExample example);

    int updateByPrimaryKeySelective(MovieScore record);

    int updateByPrimaryKey(MovieScore record);
}