package com.teemo.mediaplayer.service;

import com.teemo.mediaplayer.entity.MediaLibrary;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

@Service
public class ScanMedia {

    // 非递归实现扫描文件
    public static ArrayList<String> scanFilesWithNoRecursion(String folderPath) {

        // 已扫描的文件
        ArrayList<String> scanFiles = new ArrayList<>();
        // 文件夹队列
        LinkedList<File> queueFiles = new LinkedList<>();

        File directory = new File(folderPath);
        if(!directory.isDirectory()){
            return scanFiles;
        }
        else{
            // 首先将第一层目录扫描一遍
            File [] files = directory.listFiles();
            // 遍历扫出的文件数组，如果是文件夹，将其放入到linkedList中稍后处理
            assert files != null;
            for (File file : files) {
                if (file.isDirectory()) {
                    queueFiles.add(file);
                } else {
                    // 暂时将文件名放入scanFiles中
                    scanFiles.add(file.getAbsolutePath());
                }
            }

            // 如果linkedList非空遍历linkedList
            while(!queueFiles.isEmpty()){
                // 移出linkedList中的第一个
                File headDirectory = queueFiles.removeFirst();
                File [] currentFiles = headDirectory.listFiles();
                assert currentFiles != null;
                for (File currentFile : currentFiles) {
                    if (currentFile.isDirectory()) {
                        //如果仍然是文件夹，将其放入linkedList中
                        queueFiles.add(currentFile);
                    } else {
                        scanFiles.add(currentFile.getAbsolutePath());
                    }
                }
            }
        }
        return scanFiles;
    }

    // 计算文件MD5
    public static String getFileMD5(File file,String algorithm) {

        if (!file.isFile()) {
            return null;
        }

        MessageDigest digest;
        FileInputStream in;
        byte[] buffer = new byte[1024];
        int len;

        try {
            digest = MessageDigest.getInstance(algorithm);
            in = new FileInputStream(file);
            while ((len = in.read(buffer, 0, 1024)) != -1) {
                digest.update(buffer, 0, len);
            }
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

        BigInteger bigInt = new BigInteger(1, digest.digest());
        return bigInt.toString(16);
    }

    public List<MediaLibrary> scanMedia(String basePath) {

        ArrayList<String> fileList = scanFilesWithNoRecursion(basePath);
        ArrayList<MediaLibrary> retList = new ArrayList<>();

        for (String filePath : fileList) {
            if (Pattern.matches(".*\\.mp4", filePath)) {
                File file = new File(filePath);
                String fileMD5 = getFileMD5(file, "MD5");
                MediaLibrary mediaLibrary = new MediaLibrary();
                mediaLibrary.setFile_name(file.getName());
                mediaLibrary.setFile_md5(fileMD5);
                mediaLibrary.setFile_path(filePath);
                mediaLibrary.setTitle(file.getName());
                mediaLibrary.setMedia_type("视频mp4");
                mediaLibrary.setUpdate_time(new Date());
                System.out.println("扫描到媒体文件：");
                System.out.println("文件路径" + filePath);
                System.out.println("MD5" + fileMD5);
                retList.add(mediaLibrary);
            } else if (Pattern.matches(".*\\.mp3", filePath)) {
                File file = new File(filePath);
                String fileMD5 = getFileMD5(file, "MD5");
                MediaLibrary mediaLibrary = new MediaLibrary();
                mediaLibrary.setFile_name(file.getName());
                mediaLibrary.setFile_md5(fileMD5);
                mediaLibrary.setFile_path(filePath);
                mediaLibrary.setTitle(file.getName());
                mediaLibrary.setMedia_type("音频mp3");
                mediaLibrary.setUpdate_time(new Date());
                mediaLibrary.setArtist("未知艺术家");
                mediaLibrary.setStyle("未知风格");
                System.out.println(filePath);
                System.out.println(fileMD5);
                retList.add(mediaLibrary);
            }
        }
        return retList;
    }

}
