package com.dl.movieadmin.controller;

import com.dl.api.common.BaseResponse;
import com.dl.movieadmin.config.UploadToFastDFS;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 *  上传文件
 */
@Slf4j
@RestController
@RequestMapping("/upload")
public class FileController extends BaseController {

    @Autowired
    private UploadToFastDFS uploadToFastDFS;

    /**
     * 上传图片
     * @param file
     * @return
     * @throws Exception
     */
    @PostMapping("img")
    public Map<String, String> uploadImg(@RequestParam("file") MultipartFile file) throws Exception {

        try {
            String fileExtName = FilenameUtils.getExtension(file.getOriginalFilename());
            InputStream inputStream = file.getInputStream();
            Map<String, String> uploadFileInfo = uploadToFastDFS.uploadFile(inputStream, file.getSize(), fileExtName);
            uploadFileInfo.put("status", "done");
            return uploadFileInfo;
        }catch (Exception e){
            log.error("上传图片出错：{}", e);
            HashMap<String, String> map = new HashMap<>();
            map.put("status", "fail");
            return map;
        }
    }
}
