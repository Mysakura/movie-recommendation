package com.dl.movieadmin.config;

import com.github.tobato.fastdfs.FdfsClientConfig;
import com.github.tobato.fastdfs.domain.fdfs.MetaData;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.upload.FastFile;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;

import java.io.InputStream;
import java.util.Set;

/**
 * Created by 001977 on 2019-07-25 16:35.
 * 未测试
 */
@Configuration
@Import(FdfsClientConfig.class)
// 解决jmx重复注册bean的问题
@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
@Slf4j
public class UploadToFastDFS {

    @Autowired
    protected FastFileStorageClient storageClient;

    private UploadToFastDFS(){}

    private static class Inner{
        private static final UploadToFastDFS INSTANCE = new UploadToFastDFS();
    }

    public static UploadToFastDFS getInstance(){
        return Inner.INSTANCE;
    }

    public void upload(InputStream inputStream, Long fileSize, String fileExtName){
        FastFile fastFile = new FastFile.Builder()
                .withFile(inputStream, fileSize, fileExtName)
                .build();
        processUploadFileAndMetaData(fastFile);
    }

    private void processUploadFileAndMetaData(FastFile fastFile) {
        log.info("##上传文件..##");
        // 上传文件和Metadata
        StorePath path = storageClient.uploadFile(fastFile);
        log.info("上传文件路径{}", path);

        if (!fastFile.getMetaDataSet().isEmpty()) {
            // 验证获取MetaData
            log.info("##获取Metadata##");
            Set<MetaData> fetchMetaData = storageClient.getMetadata(path.getGroup(), path.getPath());
        }

//        log.info("##删除文件..##");
//        storageClient.deleteFile(path.getGroup(), path.getPath());
    }
}
