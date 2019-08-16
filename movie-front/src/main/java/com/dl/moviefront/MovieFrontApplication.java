package com.dl.moviefront;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class MovieFrontApplication {

	public static void main(String[] args) {
		SpringApplication.run(MovieFrontApplication.class, args);
	}

}
