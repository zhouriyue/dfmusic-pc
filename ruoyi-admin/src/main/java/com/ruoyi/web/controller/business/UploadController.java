package com.ruoyi.web.controller.business;

import com.ruoyi.common.utils.uuid.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/upload")
public class UploadController {

    public static final String BASEURL = "/static";
    public static final String PATH = "/upload/";

    @Autowired
    HttpServletRequest request;

    /**
     * 上传图片
     * @return
     */
    @PostMapping("/img")
    public String uploadPerPic(MultipartFile file) {
        String realPath = request.getSession().getServletContext().getRealPath(PATH);
        File forlder = new File(realPath);
        if(!forlder.isDirectory()) {
            forlder.mkdir();
        }
        String oldName = file.getOriginalFilename();
        String newName = UUID.randomUUID().toString() +
                oldName.substring(oldName.lastIndexOf("."),oldName.length());
        try {
            file.transferTo(new File(forlder,newName));
            String filePath = BASEURL+PATH+newName;
            return filePath;
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "上传失败！";
    }
}
