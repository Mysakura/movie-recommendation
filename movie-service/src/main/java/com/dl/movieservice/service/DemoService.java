package com.dl.movieservice.service;

import com.dl.api.common.BaseResponse;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.movieservice.mapper.repositry.DemoRepositry;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 001977 on 2019-07-10 15:28.
 */
@Service(value = DemoService.BEAN_NAME)
public class DemoService {
    public static final String BEAN_NAME = "DemoService";

    @Autowired
    private DemoRepositry demoRepositry;

    public BaseResponse<List<DemoDTO>> getList(DemoRequest request) {
        BaseResponse<List<DemoDTO>> response = new BaseResponse<>();

        List<DemoDTO> demoDTOList = Lists.newArrayList();
        demoRepositry.selectAll().forEach(test -> {
            DemoDTO demoDTO = new DemoDTO();
            BeanUtils.copyProperties(test, demoDTO);
            demoDTOList.add(demoDTO);
        });

        response.setCode(HttpStatus.OK.value());
        response.setData(demoDTOList);
        response.setMessage(HttpStatus.OK.getReasonPhrase());

        return response;
    }
}
