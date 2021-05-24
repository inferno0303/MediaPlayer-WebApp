package com.teemo.mediaplayer.controller;

import com.teemo.mediaplayer.components.NonStaticResourceHttpRequestHandler;
import com.teemo.mediaplayer.entity.MediaLibrary;
import com.teemo.mediaplayer.entity.MyFavorite;
import com.teemo.mediaplayer.mapper.MediaLibraryMapper;
import com.teemo.mediaplayer.mapper.MyFavoriteMapper;
import com.teemo.mediaplayer.utils.Resp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

@RestController
public class MediaController {

    Resp resp = new Resp();

    @Autowired
    MediaLibraryMapper mediaLibraryMapper;

    @Autowired
    MyFavoriteMapper myFavoriteMapper;

    private final NonStaticResourceHttpRequestHandler nonStaticResourceHttpRequestHandler;

    public MediaController(NonStaticResourceHttpRequestHandler nonStaticResourceHttpRequestHandler) {
        this.nonStaticResourceHttpRequestHandler = nonStaticResourceHttpRequestHandler;
    }

    // 获取所有媒体列表
    @GetMapping("/getMediaLibrary")
    public String getMediaLibrary() {
        List<MediaLibrary> mediaLibraries = mediaLibraryMapper.queryAllMediaLibrary();
        return resp.resp200(Resp.default200Msg, mediaLibraries);
    }

    // 获取所有音乐列表
    @GetMapping("/getAllMusic")
    public String getAllMusic() {
        List<MediaLibrary> allMusic = mediaLibraryMapper.getAllMusic();
        return resp.resp200(Resp.default200Msg, allMusic);
    }

    // 获取所有视频列表
    @GetMapping("/getAllVideo")
    public String getAllVideo() {
        List<MediaLibrary> allVideo = mediaLibraryMapper.getAllVideo();
        return resp.resp200(Resp.default200Msg, allVideo);
    }

    // 获取音乐艺术家列表（筛选用）
    @GetMapping("/getDistinctMusicArtist")
    public String getDistinctMusicArtist() {
        List<String> distinctMusicArtist = mediaLibraryMapper.getDistinctMusicArtist();
        return resp.resp200(Resp.default200Msg, distinctMusicArtist);
    }

    // 获取音乐风格列表（筛选用）
    @GetMapping("/getDistinctMusicStyle")
    public String getDistinctMusicStyle() {
        List<String> distinctMusicStyle = mediaLibraryMapper.getDistinctMusicStyle();
        return resp.resp200(Resp.default200Msg, distinctMusicStyle);
    }

    // 获取视频分类列表（筛选用）
    @GetMapping("/getDistinctVideoStyle")
    public String getDistinctVideoStyle() {
        List<String> distinctVideoStyle = mediaLibraryMapper.getDistinctVideoStyle();
        return resp.resp200(Resp.default200Msg, distinctVideoStyle);
    }

    // 播放流媒体接口
    @GetMapping("/play")
    public void videoPreview(@RequestParam("file_md5") String file_md5,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {
        List<String> filePathByFileMD5 = mediaLibraryMapper.getFilePathByFileMD5(file_md5);
        if (filePathByFileMD5.size() <= 0) return;
        String path = filePathByFileMD5.get(0);
        Path filePath = Paths.get(path);
        if (Files.exists(filePath)) {
            String mimeType = Files.probeContentType(filePath);
            if (!StringUtils.isEmpty(mimeType)) {
                response.setContentType(mimeType);
            }
            request.setAttribute(NonStaticResourceHttpRequestHandler.ATTR_FILE, filePath);
            nonStaticResourceHttpRequestHandler.handleRequest(request, response);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.setCharacterEncoding(StandardCharsets.UTF_8.toString());
        }
    }

    // 更新标题
    @PostMapping("/updateMediaTitle")
    public String updateMediaTitle(@RequestParam("file_md5") String file_md5,
                                   @RequestParam("title") String title) {
        Integer commitCount = mediaLibraryMapper.updateTitleByFileMD5(file_md5, title);
        return resp.resp200(Resp.default200Msg, commitCount);
    }

    // 更新艺术家
    @PostMapping("/updateMediaArtist")
    public String updateMediaArtist(@RequestParam("file_md5") String file_md5,
                                    @RequestParam("artist") String artist) {
        Integer commitCount = mediaLibraryMapper.updateArtistByFileMD5(file_md5, artist);
        return resp.resp200(Resp.default200Msg, commitCount);
    }

    // 更新风格
    @PostMapping("/updateMediaStyle")
    public String updateMediaStyle(@RequestParam("file_md5") String file_md5,
                                   @RequestParam("style") String style) {
        Integer commitCount = mediaLibraryMapper.updateStyleByFileMD5(file_md5, style);
        return resp.resp200(Resp.default200Msg, commitCount);
    }

    // 更新标题，艺术家，风格
    @PostMapping("/updateMediaAllInfo")
    public String updateMediaAllInfo(@RequestParam("file_md5") String file_md5,
                                                    @RequestParam("title") String title,
                                                    @RequestParam("artist") String artist,
                                                    @RequestParam("style") String style,
                                                    HttpSession httpSession) {
        Object user_role = httpSession.getAttribute("user_role");
        if (!user_role.toString().equals("admin")) return resp.resp403(Resp.default403Msg, "无访问权限");
        Integer integer = mediaLibraryMapper.updateTitleByFileMD5(file_md5, title);
        Integer integer1 = mediaLibraryMapper.updateArtistByFileMD5(file_md5, artist);
        Integer integer2 = mediaLibraryMapper.updateStyleByFileMD5(file_md5, style);
        return resp.resp200(Resp.default200Msg, "更改信息成功");
    }

    // 根据md5获取单个媒体信息
    @GetMapping("/getMediaInfoByFileMD5")
    public String getMediaInfoByFileMD5(@RequestParam("file_md5") String file_md5) {
        List<MediaLibrary> mediaInfoByFileMD5 = mediaLibraryMapper.getMediaInfoByFileMD5(file_md5);
        if (mediaInfoByFileMD5.size() <= 0) return resp.resp500(Resp.default500Msg, "file_md5 error");
        return resp.resp200(Resp.default200Msg, mediaInfoByFileMD5.get(0));
    }

    // 搜索媒体库（根据title）
    @PostMapping("/searchMedia")
    public String searchMedia(@RequestParam("artist") String artist,
                              @RequestParam("style") String style,
                              @RequestParam("title") String title,
                              @RequestParam("media_type") String media_type) {
        System.out.println(artist + style + title + media_type);
        List<MediaLibrary> mediaLibraries = mediaLibraryMapper.searchMediaLibrary(artist, style, title, media_type);
        return resp.resp200(Resp.default200Msg, mediaLibraries);
    }

    // 获取我喜欢列表
    @GetMapping("/getMyFavorite")
    public String getMyFavorite(@RequestParam("media_type") String media_type,
                                HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        List<MyFavorite> myFavoriteByUsernameAndMediaType = myFavoriteMapper.getMyFavoriteByUsernameAndMediaType(username.toString(), media_type);
        return resp.resp200(Resp.default200Msg, myFavoriteByUsernameAndMediaType);
    }

    // 添加到我最喜欢的列表
    @PostMapping("/addMyFavorite")
    public String addMyFavorite(@RequestParam("file_md5") String file_md5,
                                HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        List<MyFavorite> myFavoriteByUsernameAndFileMD5 = myFavoriteMapper.getMyFavoriteByUsernameAndFileMD5(username.toString(), file_md5);
        if (myFavoriteByUsernameAndFileMD5.size() > 0) return resp.resp200(Resp.default200Msg, -1);
        List<MediaLibrary> mediaInfoByFileMD5 = mediaLibraryMapper.getMediaInfoByFileMD5(file_md5);
        if (mediaInfoByFileMD5.size() <= 0) return resp.resp500(Resp.default500Msg, "file_md5 not found");
        MyFavorite myFavorite = new MyFavorite();
        myFavorite.setFile_md5(mediaInfoByFileMD5.get(0).getFile_md5());
        myFavorite.setTitle(mediaInfoByFileMD5.get(0).getTitle());
        myFavorite.setFile_name(mediaInfoByFileMD5.get(0).getFile_name());
        myFavorite.setMedia_type(mediaInfoByFileMD5.get(0).getMedia_type());
        myFavorite.setUpdate_time(new Date());
        myFavorite.setUsername(username.toString());
        Integer integer = myFavoriteMapper.addMyFavorite(myFavorite);
        return resp.resp200(Resp.default200Msg, integer);
    }

    // 删除我喜欢列表
    @PostMapping("/deleteMyFavorite")
    public String deleteMyFavorite(@RequestParam("file_md5") String file_md5,
                                   HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        Integer integer = myFavoriteMapper.deleteMyFavorite(file_md5, username.toString());
        return resp.resp200(Resp.default200Msg, integer);
    }
}
