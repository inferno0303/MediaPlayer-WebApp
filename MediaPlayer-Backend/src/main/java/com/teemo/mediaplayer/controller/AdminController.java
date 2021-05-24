package com.teemo.mediaplayer.controller;

import com.teemo.mediaplayer.entity.MediaLibrary;
import com.teemo.mediaplayer.mapper.MediaLibraryMapper;
import com.teemo.mediaplayer.mapper.MyFavoriteMapper;
import com.teemo.mediaplayer.service.ScanMedia;
import com.teemo.mediaplayer.utils.Resp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
public class AdminController {
    ScanMedia scanMedia = new ScanMedia();

    Resp resp = new Resp();

    @Autowired
    MediaLibraryMapper mediaLibraryMapper;

    @Autowired
    MyFavoriteMapper myFavoriteMapper;

    @GetMapping("/hello")
    public String HelloWorld() {
        List<MediaLibrary> mediaLibraries = mediaLibraryMapper.queryAllMediaLibrary();
        return "Spring Boot 已正确运行" + mediaLibraries.size();
    }

    @GetMapping("/scanMedia")
    public String scanMedia() {
        // 扫描文件
        List<MediaLibrary> mediaLibraries = scanMedia.scanMedia("D:\\\\media_src");
        // 如果歌曲库是空，则截断表
        List<MediaLibrary> allMedia = mediaLibraryMapper.queryAllMediaLibrary();
        if (allMedia.size() == 0) {
            mediaLibraryMapper.truncateMediaLibrary();
        }
        // 遍历，逐一查询是否在媒体库中
        int newCount = 0;
        int progress = 0;
        int total =  allMedia.size();
        for (MediaLibrary eachMedia : mediaLibraries) {
            progress ++;
            List<MediaLibrary> mediaInfoByFileMD5 = mediaLibraryMapper.getMediaInfoByFileMD5(eachMedia.getFile_md5());
            System.out.println((mediaInfoByFileMD5.size() > 0 ? "文件已经在数据库中" : "发现新文件") + "，进度：" + progress + "/" + total);
            // 发现新的媒体文件，插入数据库
            if (mediaInfoByFileMD5.size() <= 0) {
                Integer commitCount = mediaLibraryMapper.addToMediaLibrary(eachMedia);
                newCount += commitCount;
            }
        }
        return resp.resp200(Resp.default200Msg, newCount);
    }

    // 上传文件
    @PostMapping("/uploadFile")
    public String uploadFile(@RequestParam("file") MultipartFile file){
        if(file.isEmpty()) {
            return resp.resp500(Resp.default500Msg, "文件列表为空");
        }
        String fileName = file.getOriginalFilename();
        int size = (int) file.getSize();
        System.out.println(file);
        System.out.println(fileName + "-->" + size);

        String basePath = "D:\\\\media_src" ;
        File dest = new File(basePath + "\\" + fileName);
        if(!dest.getParentFile().exists()) { //判断文件父目录是否存在
            boolean mkdir = dest.getParentFile().mkdir();
        }
        try {
            //保存文件
            file.transferTo(dest);
            // 计算MD5
            String md5 = ScanMedia.getFileMD5(dest, "MD5");
            // 文件查重
            List<MediaLibrary> mediaInfoByFileMD5 = mediaLibraryMapper.getMediaInfoByFileMD5(md5);
            if (mediaInfoByFileMD5.size() > 0) {
                return resp.resp500(Resp.default500Msg, "文件已经存在");
            }
            MediaLibrary mediaLibrary = new MediaLibrary();
            mediaLibrary.setFile_name(dest.getName());
            mediaLibrary.setFile_md5(md5);
            mediaLibrary.setFile_path(dest.getPath());
            mediaLibrary.setTitle(dest.getName());

            String fileFormat = dest.getName().substring(dest.getName().length() - 4);
            System.out.println(fileFormat);
            if (fileFormat.equals(".mp3")) {
                mediaLibrary.setMedia_type("音频mp3");
            } else if (fileFormat.equals(".mp4")) {
                mediaLibrary.setMedia_type("视频mp4");
            }
            mediaLibrary.setArtist("未知艺术家");
            mediaLibrary.setStyle("未知风格");
            mediaLibrary.setUpdate_time(new Date());
            // 保存到数据库
            Integer commitCount = mediaLibraryMapper.addToMediaLibrary(mediaLibrary);
            return resp.resp200(Resp.default200Msg, "保存文件成功：" + commitCount);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            return resp.resp500(Resp.default500Msg, "上传失败");
        }
    }

    // 删除文件
    @PostMapping("/deleteMedia")
    public String deleteMedia(@RequestParam("file_md5") String file_md5,
                              HttpSession httpSession) {
        Object user_role = httpSession.getAttribute("user_role");
        if (!user_role.toString().equals("admin")) return resp.resp403(Resp.default403Msg, "无访问权限");
        List<MediaLibrary> mediaInfoByFileMD5 = mediaLibraryMapper.getMediaInfoByFileMD5(file_md5);
        if (mediaInfoByFileMD5.size() <= 0) return resp.resp500(Resp.default500Msg, "file_md5 error");
        String filePath = mediaInfoByFileMD5.get(0).getFile_path();
        File file = new File(filePath);
        if (file.exists()) {
            boolean delete = file.delete();
        }
        Integer integer = mediaLibraryMapper.deleteMediaLibraryByFileMD5(file_md5);
        return resp.resp200(Resp.default200Msg, "删除文件成功：" + integer + "个");
    }

    // 统计信息
    // 获取媒体数量
    @GetMapping("/getMediaLibraryCount")
    public String getMediaLibraryCount() {
        Integer musicCount = mediaLibraryMapper.getMusicCount();
        Integer videoCount = mediaLibraryMapper.getVideoCount();
        return resp.resp200(Resp.default200Msg, musicCount + videoCount);
    }

    @GetMapping("/getMusicCount")
    public String getMusicCount() {
        Integer musicCount = mediaLibraryMapper.getMusicCount();
        return resp.resp200(Resp.default200Msg, musicCount);
    }

    @GetMapping("/getVideoCount")
    public String getVideoCount() {
        Integer videoCount = mediaLibraryMapper.getVideoCount();
        return resp.resp200(Resp.default200Msg, videoCount);
    }

    @GetMapping("/getMyFavoriteMusicCount")
    public String getMyFavoriteMusicCount(HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        Integer favoriteMusicCount = myFavoriteMapper.getCountByUsernameAndMediaType(username.toString(), "音频mp3");
        return resp.resp200(Resp.default200Msg, favoriteMusicCount);
    }

    @GetMapping("/getMyFavoriteVideoCount")
    public String getMyFavoriteVideoCount(HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        Integer favoriteVideoCount = myFavoriteMapper.getCountByUsernameAndMediaType(username.toString(), "视频mp4");
        return resp.resp200(Resp.default200Msg, favoriteVideoCount);
    }

    @GetMapping("/getLastScanMediaTime")
    public String getLastScanMediaTime() {
        Date maxUpdateTime = mediaLibraryMapper.getMaxUpdateTime();
        return resp.resp200(Resp.default200Msg, maxUpdateTime);
    }

}
