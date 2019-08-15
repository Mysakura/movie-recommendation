package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieCompany;
import com.dl.movieservice.model.MovieCompanyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieCompanyMapper {
    long countByExample(MovieCompanyExample example);

    int deleteByExample(MovieCompanyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieCompany record);

    int insertSelective(MovieCompany record);

    List<MovieCompany> selectByExample(MovieCompanyExample example);

    MovieCompany selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieCompany record, @Param("example") MovieCompanyExample example);

    int updateByExample(@Param("record") MovieCompany record, @Param("example") MovieCompanyExample example);

    int updateByPrimaryKeySelective(MovieCompany record);

    int updateByPrimaryKey(MovieCompany record);
}