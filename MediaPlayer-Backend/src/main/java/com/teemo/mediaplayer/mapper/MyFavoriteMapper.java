package com.teemo.mediaplayer.mapper;

import com.teemo.mediaplayer.entity.MyFavorite;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MyFavoriteMapper {

    @Select("select * from my_favorite where username=#{username} and media_type=#{media_type}")
    public List<MyFavorite> getMyFavoriteByUsernameAndMediaType(String username, String media_type);

    @Select("select count(*) from my_favorite where username=#{username} and media_type=#{media_type}")
    public Integer getCountByUsernameAndMediaType(String username, String media_type);

    @Select("select * from my_favorite where username=#{username} and file_md5=#{file_md5}")
    public List<MyFavorite> getMyFavoriteByUsernameAndFileMD5(String username, String file_md5);

    @Insert("insert into my_favorite(file_md5, title, file_name, media_type, update_time, username)" +
            "values(#{file_md5}, #{title}, #{file_name}, #{media_type}, #{update_time}, #{username})")
    public Integer addMyFavorite(MyFavorite myFavorite);

    @Delete("delete from my_favorite where file_md5=#{file_md5} and username=#{username}")
    public Integer deleteMyFavorite(String file_md5, String username);
}
