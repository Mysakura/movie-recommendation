package com.dl.movieservice.dao;

import com.dl.movieservice.model.Letter;
import com.dl.movieservice.model.LetterExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LetterMapper {
    long countByExample(LetterExample example);

    int deleteByExample(LetterExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Letter record);

    int insertSelective(Letter record);

    List<Letter> selectByExample(LetterExample example);

    Letter selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Letter record, @Param("example") LetterExample example);

    int updateByExample(@Param("record") Letter record, @Param("example") LetterExample example);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKey(Letter record);
}