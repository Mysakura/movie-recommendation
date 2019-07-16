package com.dl.movieservice.service.impl;

import com.dl.api.common.BasePageResponse;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.movieservice.dao.TestMapper;
import com.dl.movieservice.model.Test;
import com.dl.movieservice.model.TestExample;
import com.dl.movieservice.service.DemoService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 001977 on 2019-07-10 15:31.
 */
@Service
public class DemoServiceImpl implements DemoService {

    @Resource
    private TestMapper testMapper;


    @Override
    public BasePageResponse<DemoDTO> getList(DemoRequest request) {
        BasePageResponse<DemoDTO> response = new BasePageResponse<>();
        TestExample example = new TestExample();
        long count = testMapper.countByExample(example);
        example.setLimitStart(request.getLimitStart());
        example.setLimitEnd(request.getLimitEnd());
        List<Test> list = testMapper.selectByExample(example);
        List<DemoDTO> result = new ArrayList<>();
        list.forEach(e -> {
            DemoDTO dto = new DemoDTO();
            BeanUtils.copyProperties(e, dto);
            result.add(dto);
        });
        response.setDataList(result);
        response.getPageInfo()
                .setCount((int) count)
                .setPageNo(request.getPageNo())
                .setPageSize(request.getPageSize());
        return response;
    }


}
