package com.dl.movieservice.config;

import com.alibaba.druid.pool.DruidDataSource;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * CREATE USER 'lua'@'%' IDENTIFIED BY '123456';
 * GRANT ALL ON movies.* TO 'lua'@'%';
 */
@Configuration
@Slf4j
public class MybatisConfiguration {

    private static final String url= "jdbc:mysql://localhost/movies?useSSL=false";
    private static final String username= "lua";
    private static final String password= "123456";
    private static final String driverClassName= "com.mysql.jdbc.Driver";

    private static final int MaxActive= 5;
    private static final int InitialSize= 5;
    private static final int MinIdle= 5;

    @Bean
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setMaxActive(MaxActive);
        dataSource.setInitialSize(InitialSize);
        dataSource.setMinIdle(MinIdle);

        dataSource.setMaxWait(30000);
        dataSource.setTimeBetweenEvictionRunsMillis(60000);
        dataSource.setMinEvictableIdleTimeMillis(300000);

        dataSource.setTestOnBorrow(false);
        dataSource.setTestOnReturn(false);
        dataSource.setTestWhileIdle(true);
        dataSource.setPoolPreparedStatements(true);
        dataSource.setMaxPoolPreparedStatementPerConnectionSize(10);
        try {
            dataSource.setFilters("stat");
        } catch (SQLException e) {
            log.error("druid configuration initialization filter", e);
        }
        dataSource.setRemoveAbandoned(true);
        dataSource.setRemoveAbandonedTimeout(600);
        dataSource.setLogAbandoned(true);
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource());
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

}
