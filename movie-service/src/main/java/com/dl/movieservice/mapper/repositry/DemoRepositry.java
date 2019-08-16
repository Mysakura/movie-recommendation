package com.dl.movieservice.mapper.repositry;

import com.dl.movieservice.mapper.bases.BaseRepositry;
import com.dl.movieservice.model.Test;
import org.springframework.stereotype.Repository;

/**
 * Created on 2019-08-16 15:30.
 *
 * @author zgq7
 */
@Repository(value = DemoRepositry.BEAN_NAME)
public class DemoRepositry extends BaseRepositry<Test> {
    public static final String BEAN_NAME = "demoRepositry";
}
