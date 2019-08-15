package com.dl.movieservice.dao;

import com.dl.movieservice.model.CinemaOrder;
import com.dl.movieservice.model.CinemaOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CinemaOrderMapper {
    long countByExample(CinemaOrderExample example);

    int deleteByExample(CinemaOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(CinemaOrder record);

    int insertSelective(CinemaOrder record);

    List<CinemaOrder> selectByExample(CinemaOrderExample example);

    CinemaOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CinemaOrder record, @Param("example") CinemaOrderExample example);

    int updateByExample(@Param("record") CinemaOrder record, @Param("example") CinemaOrderExample example);

    int updateByPrimaryKeySelective(CinemaOrder record);

    int updateByPrimaryKey(CinemaOrder record);
}