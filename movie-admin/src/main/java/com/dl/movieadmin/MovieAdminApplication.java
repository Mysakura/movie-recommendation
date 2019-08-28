package com.dl.movieadmin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 董盺杰 小妹妹
 **/
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class MovieAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(MovieAdminApplication.class, args);
    }

}
