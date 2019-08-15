package com.dl.movieservice.dao;

import com.dl.movieservice.model.FilmStars;
import com.dl.movieservice.model.FilmStarsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FilmStarsMapper {
    long countByExample(FilmStarsExample example);

    int deleteByExample(FilmStarsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FilmStars record);

    int insertSelective(FilmStars record);

    List<FilmStars> selectByExample(FilmStarsExample example);

    FilmStars selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FilmStars record, @Param("example") FilmStarsExample example);

    int updateByExample(@Param("record") FilmStars record, @Param("example") FilmStarsExample example);

    int updateByPrimaryKeySelective(FilmStars record);

    int updateByPrimaryKey(FilmStars record);
}