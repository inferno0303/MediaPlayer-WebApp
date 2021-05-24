package com.teemo.mediaplayer.mapper;

import com.teemo.mediaplayer.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Select("select * from user where username=#{username} and password=#{password}")
    public List<User> login(User user);

    @Update("update user set last_login=#{last_login} where username=#{username} and password=#{password}")
    public void updateLastLoginTime(User user);

    @Select("select * from user where username=#{username}")
    public List<User> getUserByUsername(String username);

    @Insert("insert into user (username, password, user_role, last_login)" +
            "values(#{username}, #{password}, #{user_role}, #{last_login})")
    public Integer addNewUser(User user);

    // 管理员端
    @Select("select * from user")
    public List<User> getAllUser();

    @Delete("delete from user where username=#{username}")
    public Integer deleteUser(String username);

    @Update("update user set password=#{password} where username=#{username}")
    public Integer updateUser(String username, String password);
}
