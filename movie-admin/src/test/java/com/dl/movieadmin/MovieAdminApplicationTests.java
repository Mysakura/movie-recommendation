package com.dl.movieadmin;

import com.dl.movieadmin.config.UploadToFastDFS;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.FileInputStream;
import java.io.IOException;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MovieAdminApplicationTests {

	@Autowired
	private UploadToFastDFS uploadToFastDFS;

	@Test
	public void contextLoads() throws IOException {
		FileInputStream in = new FileInputStream("3d4cdbb229559df79d93a30e27f8d521.png");
		uploadToFastDFS.uploadFile(in, in.getChannel().size(), "png");
	}

}
