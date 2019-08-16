package com.dl.movieservice.mapper.bases;

import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * Created on 2019-08-16 11:16.
 *
 * @author zgq7
 */
public interface BaseMapper<T> extends Mapper<T>,MySqlMapper<T>,IdsMapper<T>{
    //TODO
    //FIXME 该接口不可被扫描到，否则会启动报错
}
