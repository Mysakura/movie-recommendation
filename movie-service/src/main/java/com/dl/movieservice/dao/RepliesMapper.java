package com.dl.movieservice.dao;

import com.dl.movieservice.model.Replies;
import com.dl.movieservice.model.RepliesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RepliesMapper {
    long countByExample(RepliesExample example);

    int deleteByExample(RepliesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Replies record);

    int insertSelective(Replies record);

    List<Replies> selectByExample(RepliesExample example);

    Replies selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Replies record, @Param("example") RepliesExample example);

    int updateByExample(@Param("record") Replies record, @Param("example") RepliesExample example);

    int updateByPrimaryKeySelective(Replies record);

    int updateByPrimaryKey(Replies record);
}