package com.dl.movieservice;

import com.dl.api.common.request.DemoRequest;
import com.dl.movieservice.service.DemoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MovieServiceApplicationTests {

	@Autowired
	private DemoService demoService;

	@Test
	public void contextLoads() {
		DemoRequest demoRequest = new DemoRequest();
		demoRequest.setName("1");
		demoRequest.setPageNo(1);
		demoRequest.setPageSize(10);
		System.out.println(demoService.getList(demoRequest).getData());
	}

}
