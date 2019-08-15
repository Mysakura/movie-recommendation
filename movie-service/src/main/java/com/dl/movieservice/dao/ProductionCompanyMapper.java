package com.dl.movieservice.dao;

import com.dl.movieservice.model.ProductionCompany;
import com.dl.movieservice.model.ProductionCompanyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductionCompanyMapper {
    long countByExample(ProductionCompanyExample example);

    int deleteByExample(ProductionCompanyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProductionCompany record);

    int insertSelective(ProductionCompany record);

    List<ProductionCompany> selectByExample(ProductionCompanyExample example);

    ProductionCompany selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProductionCompany record, @Param("example") ProductionCompanyExample example);

    int updateByExample(@Param("record") ProductionCompany record, @Param("example") ProductionCompanyExample example);

    int updateByPrimaryKeySelective(ProductionCompany record);

    int updateByPrimaryKey(ProductionCompany record);
}