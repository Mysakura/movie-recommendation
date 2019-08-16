package com.dl.api.facade;

import com.dl.api.common.BaseResponse;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.github.pagehelper.PageInfo;

/**
 * Created by 001977 on 2019-07-10 15:33.
 */
public interface DemoFacade {

    BaseResponse<PageInfo<DemoDTO>> getList(DemoRequest request);
}
