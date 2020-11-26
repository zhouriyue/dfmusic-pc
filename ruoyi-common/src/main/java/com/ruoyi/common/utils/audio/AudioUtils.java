package com.ruoyi.common.utils.audio;

import java.io.*;

public class AudioUtils {

    public final static int code = 0xdf;

    public static void main(String[] args) {
        String path="D:\\test\\a\\test.uc";
        jxMusic(path);
    }

    //循环解析网易云音乐
    private static void jxMusic(String file){
        DataInputStream dis = null;
        DataOutputStream dos = null;
        try {
            File inFile = new File(file);
            String mp3="D:/test/a/test.mp3";
            File outFile = new File(mp3);

            dis = new DataInputStream(new FileInputStream(inFile));
            dos = new DataOutputStream(new FileOutputStream(outFile));
            byte[] b = new byte[1024];
            int len;
            while ((len = dis.read(b)) != -1) {
                for (int i = 0; i < len; i++) {
                    b[i] ^= code;
                }
                dos.write(b, 0, len);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (dos != null) {
                try {
                    dos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (dis != null) {
                try {
                    dis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
