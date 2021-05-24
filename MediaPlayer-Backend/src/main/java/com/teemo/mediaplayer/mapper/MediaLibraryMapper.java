package com.teemo.mediaplayer.mapper;

import com.teemo.mediaplayer.entity.MediaLibrary;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface MediaLibraryMapper {

    @Select("select * from media_library")
    public List<MediaLibrary> queryAllMediaLibrary();

    @Select("select * from media_library where media_type='音频mp3'")
    public List<MediaLibrary> getAllMusic();

    @Select("select * from media_library where media_type='视频mp4'")
    public List<MediaLibrary> getAllVideo();

    @Insert("insert into media_library(file_name, file_path, file_md5, title, media_type, artist, style, update_time)" +
            "values(#{file_name}, #{file_path}, #{file_md5}, #{title}, #{media_type}, #{artist}, #{style}, #{update_time})")
    public Integer addToMediaLibrary(MediaLibrary mediaLibrary);

    @Update("truncate media_library")
    public void truncateMediaLibrary();

    @Select("select file_path from media_library where file_md5=#{file_md5}")
    public List<String> getFilePathByFileMD5(String file_md5);

    @Update("update media_library set title=#{title} where file_md5=#{file_md5}")
    public Integer updateTitleByFileMD5(String file_md5, String title);

    @Update("update media_library set artist=#{artist} where file_md5=#{file_md5}")
    public Integer updateArtistByFileMD5(String file_md5, String artist);

    @Update("update media_library set style=#{style} where file_md5=#{file_md5}")
    public Integer updateStyleByFileMD5(String file_md5, String style);

    @Select("select * from media_library where file_md5=#{file_md5}")
    public List<MediaLibrary> getMediaInfoByFileMD5(String file_md5);

    @Select("select distinct artist from media_library where media_type='音频mp3'")
    public List<String> getDistinctMusicArtist();

    @Select("select distinct style from media_library where media_type='音频mp3'")
    public List<String> getDistinctMusicStyle();

    @Select("select distinct style from media_library where media_type='视频mp4'")
    public List<String> getDistinctVideoStyle();

    public List<MediaLibrary> searchMediaLibrary(String artist, String style, String title, String media_type);

    // 删除
    @Delete("delete from media_library where file_md5=#{file_md5}")
    public Integer deleteMediaLibraryByFileMD5(String file_md5);

    // 统计
    @Select("select count(*) from media_library where media_type='音频mp3'")
    public Integer getMusicCount();

    @Select("select count(*) from media_library where media_type='视频mp4'")
    public Integer getVideoCount();

    @Select("select max(update_time) from media_library")
    public Date getMaxUpdateTime();
}
