package com.dl.api.common.utils;

import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.alibaba.nacos.spring.context.annotation.config.NacosPropertySource;
import com.dl.api.common.constants.SystemConstants;
import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 001977 on 2019-10-10 10:43.
 */
@Slf4j
public class JwtUtils {

    /**
     * 创建token
     * @param payload
     * @return
     * @throws JOSEException
     */
    public static String createToken(Map<String, Object> payload) throws JOSEException {
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);
        JWSObject jwsObject = new JWSObject(jwsHeader, new Payload(new JSONObject(payload)));
        jwsObject.sign(new MACSigner(SystemConstants.privateKey.getBytes()));
        return jwsObject.serialize();
    }

    /**
     * 重载方法，创建token
     * @param payload
     * @return
     * @throws JOSEException
     */
    public static String createToken(JSONObject payload) throws JOSEException {
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);
        JWSObject jwsObject = new JWSObject(jwsHeader, new Payload(payload));
        jwsObject.sign(new MACSigner(SystemConstants.privateKey.getBytes()));
        return jwsObject.serialize();
    }

    /**
     * 解析token
     * @param token
     * @return
     * @throws ParseException
     * @throws JOSEException
     */
    public static JSONObject parseToken(String token) throws ParseException, JOSEException {
        JWSObject jwsObject = JWSObject.parse(token);
        Payload payload = jwsObject.getPayload();
        JWSVerifier verifier = new MACVerifier(SystemConstants.privateKey.getBytes());
        if(jwsObject.verify(verifier)) {
            return payload.toJSONObject();
        } else {
            return null;
        }
    }

    /**
     * 是否过期
     * @param token
     * @return
     * @throws ParseException
     * @throws JOSEException
     */
    public static Boolean validateToken(String token) throws ParseException, JOSEException {
        JSONObject jsonObject = parseToken(token);
        Long expireTime = (Long) jsonObject.get("expireTime");
        if (System.currentTimeMillis() > expireTime){
            return true;
        }
        return false;
    }

    public static void main(String[] args) throws Exception {
        // 载荷
        Map<String, Object> map = new HashMap<>();
        map.put("userId", "1234");
        map.put("expireTime", new Date().getTime() + SystemConstants.sessionTimeout);

        String token = JwtUtils.createToken(map);
        System.out.println("Token:" + token);

        JSONObject jsonObject = JwtUtils.parseToken(token);
        System.out.println("数据：" + jsonObject.get("userId"));
        System.out.println("数据：" + jsonObject.get("expireTime"));

        jsonObject = JwtUtils.parseToken("eyJhbGciOiJIUzI1NiJ9.eyJleHBpcmVUaW1lIjoxNTcwNjk5ODIxMTc2LCJ1c2VySWQiOjZ9.i3Zn1W-yZKbXAfe_u-Ea_yqoKGLw7CQCzixEmCitZlU");
        System.out.println("数据：" + jsonObject.get("userId"));
        System.out.println("数据：" + jsonObject.get("expireTime"));
    }
}
