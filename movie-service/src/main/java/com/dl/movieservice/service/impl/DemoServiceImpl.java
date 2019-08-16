package com.dl.movieservice.service.impl;

import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.api.common.utils.PageModel;
import com.dl.movieservice.mapper.mappers.TestMapper;
import com.dl.movieservice.model.Test;
import com.dl.movieservice.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created on 2019-08-16 17:20.
 *
 * @author zgq7
 */
@Service(value = DemoServiceImpl.BEAN_NAME)
public class DemoServiceImpl implements DemoService {
    public static final String BEAN_NAME = "demoService";

    @Resource
    private TestMapper testMapper;


    @Override
    public PageInfo<DemoDTO> getList(DemoRequest request) {
        PageModel pageModel = new PageModel.Instance(request.getPageNo(), request.getPageSize()).newPageModel();
        List<Test> testList;
        try {
            PageModel.parsePageModel(pageModel);
            Example e = new Example(Test.class);
            e.createCriteria().andEqualTo("name", "A");
            testList = testMapper.selectByExample(e);
        } finally {
            PageHelper.clearPage();
        }

        List<DemoDTO> demoDTOList = Lists.newArrayList();
        testList.forEach(test -> {
            DemoDTO demoDTO = new DemoDTO();
            BeanUtils.copyProperties(test, demoDTO);
            demoDTOList.add(demoDTO);
        });

        return new PageInfo<>(demoDTOList);
    }
}
