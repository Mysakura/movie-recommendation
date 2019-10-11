package com.dl.movieadmin.auth;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.dl.api.common.BaseResponse;
import com.dl.api.common.constants.DubboConstants;
import com.dl.api.common.request.UserRequest;
import com.dl.api.common.response.UserDTO;
import com.dl.api.facade.UserFacade;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.http.HttpStatus;

import java.util.HashSet;
import java.util.Set;

/**
 * @program: boot-shiro
 * @description:
 * @author: 001977
 * @create: 2018-07-12 13:03
 */
@Slf4j
public class PermissionRealm extends AuthorizingRealm {

    @Reference(version = DubboConstants.VERSION)
    private UserFacade userFacade;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Object principal = principalCollection.getPrimaryPrincipal();
        UserDTO user = (UserDTO) principal;
        Set<String> roles = new HashSet<>();
        roles.add("user");
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken uToken = (UsernamePasswordToken) authenticationToken;

        String username = uToken.getUsername();
        String password = String.valueOf(uToken.getPassword());
        UserRequest userRequest = new UserRequest();
        userRequest.setUserName(username);
        userRequest.setPassword(password);
        BaseResponse<UserDTO> response = userFacade.login(userRequest);

        if(response.getCode() != HttpStatus.OK.value()){
            log.error("登录失败：{}", JSON.toJSONString(response));
            throw new AuthenticationException("系统错误：" + response.getMessage());
        }
        if(response.getData() == null){
            log.error("用户名密码不存在：{},{}", username, password);
            throw new AuthenticationException("用户名密码不存在");
        }
        //认证的实体信息
        Object principal = response.getData();
        //从数据库获取的密码
        Object hashedCredentials = response.getData().getPassword();
        //盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(response.getData().getUserName());
        //当前Realm对象的name，调用父类的getName方法
        String realmName = getName();

        return new SimpleAuthenticationInfo(principal, hashedCredentials, credentialsSalt, realmName);
    }
}
