package com.ruoyi.common.utils.file;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.UUID;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import static com.ruoyi.common.utils.file.FileUploadUtils.PATH;

public class FDFSUtils {

    /**
     * 上传文件
     * @param file
     * @param trackerClient
     * @return
     * @throws Exception
     */
    public static String uploadFile(MultipartFile file, TrackerClient trackerClient) throws Exception{
        Long begin = System.currentTimeMillis();
        if(file == null) {
            throw new Exception("文件不存在");
        }
        String fileName = file.getOriginalFilename();
        if(StringUtils.isEmpty(fileName)) {
            throw new Exception("文件名为空");
        }
        String extName = fileName.substring(fileName.lastIndexOf(".")+1);
        System.out.println("文件的全名："+extName+"，文件的扩展名："+extName);
        NameValuePair[] metaList = new NameValuePair[1];
        metaList[0] = new NameValuePair("fileName",fileName);
        TrackerServer trackerServer = trackerClient.getConnection();
        StorageServer storageServer = null;
        StorageClient storageClient = new StorageClient(trackerServer,storageServer);
        String[] strArr = storageClient.upload_file(file.getBytes(),extName,metaList);
        System.out.println(System.currentTimeMillis()-begin);
        return "/"+strArr[0]+"/"+strArr[1];
    }

    /**
     * 下载文件
     * @param groupName group1/M00/00/00/
     * @param remoteFileName
     * @param trackerClient
     * @return
     * @throws Exception
     */
    public static boolean downFile(String groupName, String remoteFileName, TrackerClient trackerClient) throws Exception{
        boolean result = false;
        TrackerServer trackerServer = trackerClient.getConnection();
        StorageServer storageServer = null;
        StorageClient storageClient = new StorageClient(trackerServer,storageServer);
        byte[] fileByte = storageClient.download_file(groupName,remoteFileName);
        String aimPath = "D:\\dfs\\"+ UUID.randomUUID().toString()+".jpg";
        OutputStream fos = new FileOutputStream(aimPath);
        if(fileByte != null) {
            fos.write(fileByte);
            result = true;
        }
        fos.flush();
        fos.close();
        return result;
    }

    /**
     * 删除文件
     * @param groupName
     * @param remoteFileName
     * @param trackerClient
     * @return
     * @throws IOException
     * @throws MyException
     */
    public static boolean deleteFile(String groupName,String remoteFileName,TrackerClient trackerClient) throws IOException, MyException {
        boolean result = false;
        TrackerServer trackerServer = trackerClient.getConnection();
        StorageServer storageServer = null;
        StorageClient storageClient = new StorageClient(trackerServer,storageServer);
        int num = storageClient.delete_file(groupName,remoteFileName);
        if(num == 0) {
            result = true;
        }
        return result;
    }

    /**
     * 获取文件信息
     * @param groupName
     * @param remoteFileName
     * @param trackerClient
     * @return
     * @throws IOException
     * @throws MyException
     */
    public static FileInfo getFileInfo(String groupName,String remoteFileName,TrackerClient trackerClient) throws IOException, MyException {
        TrackerServer trackerServer = trackerClient.getConnection();
        StorageServer storageServer = null;
        StorageClient storageClient = new StorageClient(trackerServer,storageServer);
        return storageClient.get_file_info(groupName,remoteFileName);
    }

    /**
     * 上传网络图片到服务器
     * @param avator
     * @param trackerClient
     * @return
     */
    public static String uploadPerPic(String avator, TrackerClient trackerClient) throws Exception {
        MultipartFile multipartFile = urlToMultipartFile(avator);
        return uploadFile(multipartFile,trackerClient);
    }

    /**
     * url转MultipartFile
     */
    public static MultipartFile urlToMultipartFile(String url) throws Exception {
        File file = null;
        MultipartFile multipartFile = null;
        try {
            HttpURLConnection httpUrl = (HttpURLConnection) new URL(url).openConnection();
            httpUrl.connect();
            file = inputStreamToFile(httpUrl.getInputStream(),"template"+url.substring(url.lastIndexOf(".")));
            multipartFile = fileToMultipartFile(file);
            httpUrl.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return multipartFile;
    }

    /**
     * inputStream 转 File
     */
    public static File inputStreamToFile(InputStream ins, String name) throws Exception{
        //System.getProperty("java.io.tmpdir")临时目录+File.separator目录中间的间隔符+文件名
        File file = new File(System.getProperty("java.io.tmpdir") + File.separator + name);
//        if (file.exists()) {
//            return file;
//        }
        OutputStream os = new FileOutputStream(file);
        int bytesRead;
        int len = 8192;
        byte[] buffer = new byte[len];
        while ((bytesRead = ins.read(buffer, 0, len)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        os.close();
        ins.close();
        return file;
    }


    /**
     * file转multipartFile
     */
    public static MultipartFile fileToMultipartFile(File file) {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        FileItem item=factory.createItem(file.getName(),"text/plain",true,file.getName());
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        try {
            FileInputStream fis = new FileInputStream(file);
            OutputStream os = item.getOutputStream();
            while ((bytesRead = fis.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new CommonsMultipartFile(item);
    }
}
