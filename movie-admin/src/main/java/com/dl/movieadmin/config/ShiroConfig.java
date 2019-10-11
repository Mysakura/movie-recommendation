package com.dl.movieadmin.config;

import com.dl.movieadmin.auth.JwtAuthFilter;
import com.dl.movieadmin.auth.PermissionRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.DefaultSessionStorageEvaluator;
import org.apache.shiro.mgt.DefaultSubjectDAO;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Shiro配置
 */
@Configuration
public class ShiroConfig {

    @Bean
    public JavaUuidSessionIdGenerator sessionIdGenerator(){
        return new JavaUuidSessionIdGenerator();
    }


    /**
     * 1. 配置SecurityManager
     * @return
     */
    @Bean
    public DefaultWebSecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(realm());  // 设置realm

        DefaultSubjectDAO subjectDAO = new DefaultSubjectDAO();
        DefaultSessionStorageEvaluator defaultSessionStorageEvaluator = new DefaultSessionStorageEvaluator();
        defaultSessionStorageEvaluator.setSessionStorageEnabled(false);
        subjectDAO.setSessionStorageEvaluator(defaultSessionStorageEvaluator);
        securityManager.setSubjectDAO(subjectDAO);

        securityManager.setCacheManager(cacheManager()); // 配置缓存
        return securityManager;
    }

    /**
     * 2. 配置缓存
     * @return
     */
    @Bean
    public CacheManager cacheManager(){
        EhCacheManager ehCacheManager = new EhCacheManager();
        ehCacheManager.setCacheManagerConfigFile("classpath:ehcache.xml");
        return ehCacheManager;
    }


    /**
     * 3. 配置Realm
     * @return
     */
    @Bean
    public AuthorizingRealm realm(){
        PermissionRealm realm = new PermissionRealm();
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        // 指定加密算法
        matcher.setHashAlgorithmName("MD5");
        // 指定加密次数
        matcher.setHashIterations(10);
        // 指定这个就不会报错
        matcher.setStoredCredentialsHexEncoded(true);
        realm.setCredentialsMatcher(matcher);
        return realm;
    }

    /**
     * 4. 配置LifecycleBeanPostProcessor，可以来自动的调用配置在Spring IOC容器中 Shiro Bean 的生命周期方法
     * @return
     */
    @Bean
    public LifecycleBeanPostProcessor lifecycleBeanPostProcessor(){
        return new LifecycleBeanPostProcessor();
    }

    /**
     * 5. 启用IOC容器中使用Shiro的注解，但是必须配置第四步才可以使用
     * @return
     */
    @Bean
    @DependsOn("lifecycleBeanPostProcessor")
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator(){
        return new DefaultAdvisorAutoProxyCreator();
    }

    /**
     * 6. 配置ShiroFilter
     * @return
     */
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(){
        // 添加jwt过滤器
        Map<String, Filter> filterMap = new LinkedHashMap<>();
        filterMap.put("jwtAuth", jwtAuthFilter());
//        filterMap.put("logout", new SystemLogoutFilter());


        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        // 静态资源
        filterChainDefinitionMap.put("/css/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");

        // 公共路径
        filterChainDefinitionMap.put("/user/login", "anon");
        filterChainDefinitionMap.put("/register", "anon");

        // 访问/logout，会自动执行过滤器org.apache.shiro.web.filter.authc.LogoutFilter
        filterChainDefinitionMap.put("/logout", "logout");

        // 授权
//        map.put("/user/**", "authc,roles[user]");
//        map.put("/admin/**", "authc,roles[admin]");

        // everything else requires authentication:
        filterChainDefinitionMap.put("/**", "jwtAuth");    // 加上默认的认证，会出问题   ,authc

        ShiroFilterFactoryBean factoryBean = new ShiroFilterFactoryBean();
        // 配置SecurityManager
        factoryBean.setSecurityManager(securityManager());
        // 配置权限路径
        factoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        // 配置登录url
        factoryBean.setLoginUrl("/user/login");
        // 配置无权限路径
        factoryBean.setUnauthorizedUrl("/unauthorized");
        // 配置过滤器
        factoryBean.setFilters(filterMap);
        return factoryBean;
    }

    @Bean
    public JwtAuthFilter jwtAuthFilter(){
        return new JwtAuthFilter();
    }

}
