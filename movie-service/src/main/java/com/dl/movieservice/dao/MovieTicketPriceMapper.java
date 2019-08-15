package com.dl.movieservice.dao;

import com.dl.movieservice.model.MovieTicketPrice;
import com.dl.movieservice.model.MovieTicketPriceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MovieTicketPriceMapper {
    long countByExample(MovieTicketPriceExample example);

    int deleteByExample(MovieTicketPriceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(MovieTicketPrice record);

    int insertSelective(MovieTicketPrice record);

    List<MovieTicketPrice> selectByExample(MovieTicketPriceExample example);

    MovieTicketPrice selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MovieTicketPrice record, @Param("example") MovieTicketPriceExample example);

    int updateByExample(@Param("record") MovieTicketPrice record, @Param("example") MovieTicketPriceExample example);

    int updateByPrimaryKeySelective(MovieTicketPrice record);

    int updateByPrimaryKey(MovieTicketPrice record);
}