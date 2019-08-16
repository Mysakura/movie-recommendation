package com.dl.movieservice.service.impl;

import com.dl.api.common.BaseResponse;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.api.common.utils.PageModel;
import com.dl.movieservice.mapper.repositry.DemoRepositry;
import com.dl.movieservice.model.Test;
import com.dl.movieservice.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created on 2019-08-16 17:20.
 *
 * @author zgq7
 */
@Service(value = "1")
public class DemoServiceImpl implements DemoService {
    public static final String BEAN_NAME = "demoService";

    @Autowired
    private DemoRepositry demoRepositry;


    @Override
    public BaseResponse<PageInfo<DemoDTO>> getList(DemoRequest request) {
        PageModel pageModel = new PageModel.Instance(request.getPageNo(), request.getPageSize()).newPageModel();
        List<Test> testList;
        try {
            PageModel.parsePageModel(pageModel);
            testList = demoRepositry.selectAll();
        } finally {
            PageHelper.clearPage();
        }

        List<DemoDTO> demoDTOList = Lists.newArrayList();
        testList.forEach(test -> {
            DemoDTO demoDTO = new DemoDTO();
            BeanUtils.copyProperties(test, demoDTO);
            demoDTOList.add(demoDTO);
        });

        PageInfo<DemoDTO> listPageInfo = new PageInfo<>(demoDTOList);

        BaseResponse<PageInfo<DemoDTO>> baseResponse = new BaseResponse<>();
        baseResponse.setMessage(HttpStatus.OK.getReasonPhrase());
        baseResponse.setCode(HttpStatus.OK.value());
        baseResponse.setData(listPageInfo);

        return baseResponse;
    }
}
