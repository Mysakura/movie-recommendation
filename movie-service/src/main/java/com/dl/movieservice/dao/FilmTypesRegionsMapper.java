package com.dl.movieservice.dao;

import com.dl.movieservice.model.FilmTypesRegions;
import com.dl.movieservice.model.FilmTypesRegionsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FilmTypesRegionsMapper {
    long countByExample(FilmTypesRegionsExample example);

    int deleteByExample(FilmTypesRegionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FilmTypesRegions record);

    int insertSelective(FilmTypesRegions record);

    List<FilmTypesRegions> selectByExample(FilmTypesRegionsExample example);

    FilmTypesRegions selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") FilmTypesRegions record, @Param("example") FilmTypesRegionsExample example);

    int updateByExample(@Param("record") FilmTypesRegions record, @Param("example") FilmTypesRegionsExample example);

    int updateByPrimaryKeySelective(FilmTypesRegions record);

    int updateByPrimaryKey(FilmTypesRegions record);
}