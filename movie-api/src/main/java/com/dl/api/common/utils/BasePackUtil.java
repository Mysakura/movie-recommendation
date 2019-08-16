
package com.dl.api.common.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dl.api.common.BaseRequest;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.MovieException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;

import javax.servlet.http.HttpServletRequest;
import java.text.MessageFormat;

/**
 * 请求调用模板类
 */
@Slf4j
public class BasePackUtil {
    //最大长度
    private final static int RESP_MAX_LEN = 1024;

    private BasePackUtil() {}

    private static class SingletonHolder {
        private static final BasePackUtil instance = new BasePackUtil();
    }

    public static BasePackUtil getInstance() {
        return SingletonHolder.instance;
    }

    private final static String ERROR_MSG = "调用服务失败; 原因:{0}";

    public <Resp extends BaseResponse, Req extends BaseRequest> Resp execInvokeService(Req baseReq, Resp response, HttpServletRequest httReq, ServiceWrapper wrapper) {
        return execInvokeService(baseReq, response, httReq, wrapper, RESP_MAX_LEN);
    }

    public <Resp extends BaseResponse, Req extends BaseRequest> Resp execInvokeService(Req baseReq, Resp response, ServiceWrapper wrapper) {
        return execInvokeService(baseReq, response, null, wrapper, RESP_MAX_LEN);
    }

    private <Resp extends BaseResponse, Req extends BaseRequest> Resp execInvokeService(Req baseReq, Resp response, HttpServletRequest httReq, ServiceWrapper wrapper, int respMaxLen) {
        long startTime = System.currentTimeMillis();

        StringBuilder strBuff = new StringBuilder();
        try {
            StackTraceElement stackTraceElement = getStackTraceElement();
            String preClassName = stackTraceElement.getClassName();
            String preMethodName = stackTraceElement.getMethodName();
            strBuff.append(preClassName).append("#").append(preMethodName).append(":").append(stackTraceElement.getLineNumber());

            invoke(wrapper, response);

            strBuff.append("|").append(System.currentTimeMillis() - startTime).append("ms")
                .append("|").append(recordReqLog(baseReq))
                .append("|").append(StringUtils.left(JSON.toJSONString(response, SerializerFeature.SortField),respMaxLen));
            String extReqInfo = recordExtReqInfo(httReq);
            if (StringUtils.isNotBlank(extReqInfo)) {
                strBuff.append("|").append(extReqInfo);
            }
        } finally {
            log.info(strBuff.toString());
        }
        return response;
    }

    private <Resp extends BaseResponse> void invoke(ServiceWrapper wrapper, Resp response) {
        try {
            wrapper.invokeService();
            response.setCode(HttpStatus.OK.value());
            response.setMessage(HttpStatus.OK.getReasonPhrase());
        } catch (Exception ex) {
            handleEx(ex, response);
        } catch (Throwable throwable) {
            log.error("BasePackUtil invoke throwable error:{}", throwable);
        }
    }

    private <Req extends BaseRequest> String recordReqLog(Req req) {
        if (req == null) {
            return "";
        }
        return JSON.toJSONString(req);
    }

    /**
     * 额外的参数
     * @param httpReq
     * @return
     */
    private String recordExtReqInfo(HttpServletRequest httpReq) {
        if(httpReq != null){
            return JSON.toJSONString(httpReq.getParameterMap());
        }
        return null;
    }

    private <Resp extends BaseResponse> void handleEx(Exception ex, Resp response) {
        if (ex instanceof MovieException) {
            MovieException exception = (MovieException) ex;
            response.setCode(exception.getCode());
            response.setMessage(exception.getMessage());
        } else {
            response.setCode(0);
            response.setMessage(ex.getMessage());
            log.error(MessageFormat.format(ERROR_MSG, ex.getMessage()), ex);
        }
    }

    /**
     * 获取execInvokeService方法上层调用者
     */
    private StackTraceElement getStackTraceElement() {
        StackTraceElement[] stackTrace = new Exception().getStackTrace();
        StackTraceElement stackTraceElement = null;
        for (StackTraceElement aStackTrace : stackTrace) {
            stackTraceElement = aStackTrace;
            if (!stackTraceElement.getClassName().equals(BasePackUtil.class.getName())) {
                break;
            }
        }
        return stackTraceElement;
    }

    public interface ServiceWrapper {
        void invokeService() throws Exception;
    }

}
