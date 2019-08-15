package com.dl.movieservice.dao;

import com.dl.movieservice.model.NewsActor;
import com.dl.movieservice.model.NewsActorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsActorMapper {
    long countByExample(NewsActorExample example);

    int deleteByExample(NewsActorExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewsActor record);

    int insertSelective(NewsActor record);

    List<NewsActor> selectByExample(NewsActorExample example);

    NewsActor selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewsActor record, @Param("example") NewsActorExample example);

    int updateByExample(@Param("record") NewsActor record, @Param("example") NewsActorExample example);

    int updateByPrimaryKeySelective(NewsActor record);

    int updateByPrimaryKey(NewsActor record);
}