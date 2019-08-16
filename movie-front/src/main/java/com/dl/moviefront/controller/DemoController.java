package com.dl.moviefront.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.dl.api.common.BasePageResponse;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.api.common.utils.BasePackUtil;
import com.dl.api.facade.DemoFacade;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by 001977 on 2019-07-10 15:42.
 */
@RestController
@RequestMapping("/demo")
public class DemoController {

    @Reference(version = DubboConstants.VERSION)
    private DemoFacade demoFacade;

    @PostMapping("/hello")
    public BaseResponse<BasePageResponse<DemoDTO>> hello(@RequestBody DemoRequest request){
        BaseResponse<BasePageResponse<DemoDTO>> response = new BaseResponse<>();
        return BasePackUtil.getInstance().execInvokeService(request, response, () -> {
            response.setData(demoFacade.getList(request).getData());
        });
    }
}
