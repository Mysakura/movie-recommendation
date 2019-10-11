package com.dl.movieadmin.auth;

import com.alibaba.fastjson.JSON;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.SystemConstants;
import com.dl.api.common.utils.JwtUtils;
import com.nimbusds.jose.JOSEException;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpStatus;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;

/**
 *  认证过滤器
 */
@Slf4j
public class JwtAuthFilter extends AccessControlFilter {

    private String message;

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if(this.isLoginRequest(request, response)){
            return true;
        }
        HttpServletRequest httpRequest = WebUtils.toHttp(request);
        HttpServletResponse httpResponse = WebUtils.toHttp(response);
        String token = httpRequest.getHeader("x-auth-token");
        if(StringUtils.isEmpty(token)){
            message = "token is empty";
            log.info("token is empty");
            return false;
        }
        try {
            JSONObject jsonObject = JwtUtils.parseToken(token);
            Long expireTime = (Long) jsonObject.get("expireTime");
            if (System.currentTimeMillis() > expireTime){
                message = "session timeout";
                log.info("session timeout");
                // TODO
                return false;
            }
            // 刷新超时时间
            jsonObject.put("expireTime", new Date().getTime() + SystemConstants.sessionTimeout);
            String newToken = JwtUtils.createToken(jsonObject);
            httpResponse.setHeader("x-auth-token", newToken);
            httpResponse.setHeader("Access-Control-Expose-Headers", "x-auth-token");
            return true;
        } catch (ParseException | JOSEException e) {
            log.error("解析token失败：{}", e);
            return false;
        }
    }

    /**
     * 如果这个Filter在之前isAccessAllowed（）方法中返回false,则会进入这个方法。我们这里直接返回错误的response
     */
    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        HttpServletResponse httpResponse = WebUtils.toHttp(servletResponse);
        httpResponse.setCharacterEncoding("UTF-8");
        httpResponse.setContentType("application/json;charset=UTF-8");

        BaseResponse<Void> result = new BaseResponse<>();
        result.setCode(HttpStatus.SC_UNAUTHORIZED);
        result.setMessage(message);

        PrintWriter out = null;
        try {
            out = httpResponse.getWriter();
            out.print(JSON.toJSONString(result));
            out.flush();
        } catch (Exception e) {
            log.error("printWriter Exception!", e);
        } finally {
            IOUtils.closeQuietly(out);
        }
        return false;
    }

}
