package com.dl.movieservice.facade.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.dl.api.common.BasePageResponse;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.request.DemoRequest;
import com.dl.api.common.response.DemoDTO;
import com.dl.api.common.utils.BasePackUtil;
import com.dl.api.facade.DemoFacade;
import com.dl.movieservice.service.DemoService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 建议由服务提供方设置超时,在 Provider 上尽量多配置 Consumer 端属性
 * timeout 方法调用超时
 * retries 失败重试次数，缺省是 2 [2]
 * loadbalance 负载均衡算法 [3]，缺省是随机 random。还可以有轮询 roundrobin、最不活跃优先 [4] leastactive 等
 * actives 消费者端，最大并发调用限制，即当 Consumer 对一个服务的并发调用到上限后，新调用会阻塞直到超时
 */
@Service(registry = "movieRegistry", timeout = 5000, version = DubboConstants.VERSION, retries = 3, loadbalance = "random", actives = 5)
public class DemoFacadeImpl implements DemoFacade {

    @Autowired
    private DemoService demoService;

    @Override
    public BaseResponse<PageInfo<DemoDTO>> getList(DemoRequest request) {
        return demoService.getList(request);
    }
}
