package com.dl.movieadmin.config;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.nacos.api.config.annotation.NacosValue;
import com.alibaba.nacos.spring.context.annotation.config.NacosPropertySource;
import com.github.tobato.fastdfs.domain.fdfs.MetaData;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.fdfs.ThumbImageConfig;
import com.github.tobato.fastdfs.domain.upload.FastFile;
import com.github.tobato.fastdfs.domain.upload.FastImageFile;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by 001977 on 2019-07-25 16:35.
 * 不会出现网上说的jmx重复注册bean的问题，是FastDFS-Client 1.26.4版本以前引入方式
 */
@Component
@Slf4j
@NacosPropertySource(dataId = "movie-config",groupId = "MOVIE_GROUP",autoRefreshed = true)
public class UploadToFastDFS {

    @Autowired
    protected FastFileStorageClient storageClient;

    @Autowired
    private ThumbImageConfig thumbImageConfig;

    @NacosValue(value = "${img.host}", autoRefreshed = true)
    private String imgHost;

    /**
     * 上传文件并生成缩略图
     * @param inputStream
     * @param fileSize
     * @param fileExtName
     * @return
     */
    public Map<String, String> uploadImgWithThumb(InputStream inputStream, Long fileSize, String fileExtName){
        Map<String, String> map = new HashMap<>();
        log.info("##上传文件...");
        FastFile fastFile = new FastFile.Builder()
                .withFile(inputStream, fileSize, fileExtName)
                .build();

        // 上传文件
        StorePath storePath = storageClient.uploadImageAndCrtThumbImage(inputStream, fileSize, fileExtName, new HashSet<>());
        log.info("上传文件结果...{}", storePath);
        // 带分组的路径
        String fullPath = storePath.getFullPath();
        log.info("带分组的路径...{}", fullPath);
        String path = storePath.getPath();
        log.info("路径...{}", path);
        // 获取缩略图路径
        String thumbImagePath = thumbImageConfig.getThumbImagePath(storePath.getPath());
        log.info("缩略图路径...{}", thumbImagePath);

        map.put("name", storePath.getFullPath().substring(storePath.getFullPath().lastIndexOf("/")+1));
        map.put("url", imgHost + fullPath);
        map.put("thumbUrl", imgHost + storePath.getGroup() + "/" + thumbImagePath);
        log.info("返回结果：{}" + JSONObject.toJSONString(map));
        // 返回结果：{}{"name":"wKjAgF2b_22AJ8dXAARH3MtGzfw795.png","thumbUrl":"http://192.168.192.128:8888/group1/M00/00/00/wKjAgF2b_22AJ8dXAARH3MtGzfw795_96x128.png","url":"http://192.168.192.128:8888/group1/M00/00/00/wKjAgF2b_22AJ8dXAARH3MtGzfw795.png"}
        return map;
    }

    /**
     * 仅仅上传图片
     * @param inputStream
     * @param fileSize
     * @param fileExtName
     */
    public Map<String, String> uploadImg(InputStream inputStream, Long fileSize, String fileExtName){
        Map<String, String> map = new HashMap<>();
        FastImageFile fastFile = new FastImageFile.Builder()
                .withFile(inputStream, fileSize, fileExtName)
                .build();
        StorePath storePath = storageClient.uploadImage(fastFile);
        log.info("上传文件结果...{}", storePath);
        // 带分组的路径
        String fullPath = storePath.getFullPath();
        log.info("带分组的路径...{}", fullPath);
        String path = storePath.getPath();
        log.info("路径...{}", path);

        map.put("name", storePath.getFullPath().substring(storePath.getFullPath().lastIndexOf("/")+1));
        map.put("url", imgHost + fullPath);
        log.info("返回结果：{}" + JSONObject.toJSONString(map));
        return map;
    }

    /**
     * 上传和删除文件
     */
    private void processUploadFileAndMetaData(InputStream inputStream, Long fileSize, String fileExtName) {
        FastImageFile fastFile = new FastImageFile.Builder()
                .withFile(inputStream, fileSize, fileExtName)
                .build();
        log.info("##上传文件..##");
        // 上传文件和Metadata
        StorePath path = storageClient.uploadFile(fastFile);
        log.info("上传文件路径{}", path);

        if (!fastFile.getMetaDataSet().isEmpty()) {
            // 验证获取MetaData
            log.info("##获取Metadata##");
            Set<MetaData> fetchMetaData = storageClient.getMetadata(path.getGroup(), path.getPath());
        }

        log.info("##删除文件..##");
        storageClient.deleteFile(path.getGroup(), path.getPath());
    }
}
