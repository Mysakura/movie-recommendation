package com.dl.movieservice.mapper.bases;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created on 2019-08-16 11:19.
 *
 * @author zgq7
 */
public class BaseRepositry<T> {

    @Autowired
    private BaseMapper<T> baseMapper;

    public List<T> selectAll() {
        return baseMapper.selectAll();
    }
}
