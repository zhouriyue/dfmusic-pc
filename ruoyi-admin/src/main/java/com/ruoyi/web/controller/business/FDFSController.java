package com.ruoyi.web.controller.business;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.file.FDFSUtils;
import org.csource.common.MyException;
import org.csource.fastdfs.FileInfo;
import org.csource.fastdfs.TrackerClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;

@RestController
@RequestMapping("/fdfs")
public class FDFSController extends BaseController {

    @Value("common.fdfs-save-server")
    public String FDFS_SAVE_PATH;

    @Value("common.groups")
    public String[] GROUPS;

    @Autowired
    TrackerClient trackerClient;

    @PostMapping("/upload")
    public String upload(MultipartFile file){
        try {
            String path = FDFSUtils.uploadFile(file,trackerClient);
            return path;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("/getFileInfo")
    public void getFileInfo(){
        try {
            FileInfo fileInfo = FDFSUtils.getFileInfo(GROUPS[0],"M00/00/00/rB8Lg1-qnQuANalQAAAACgpiIuY144_big.txt",trackerClient);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MyException e) {
            e.printStackTrace();
        }
    }

}
