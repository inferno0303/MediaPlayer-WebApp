package com.teemo.mediaplayer.controller;

import com.alibaba.fastjson.JSONObject;
import com.teemo.mediaplayer.entity.User;
import com.teemo.mediaplayer.mapper.UserMapper;
import com.teemo.mediaplayer.utils.Resp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
public class loginController {

    Resp resp = new Resp();

    @Autowired
    UserMapper userMapper;

    @GetMapping(value = "/permission_denied", produces = "application/json") // 没有权限时，转发该请求
    public String permission_denied() {
        return resp.resp403("您还未登录", null);
    }

    @GetMapping(value = "/getLoginStatus", produces = "application/json")
    public String getLoginStatus(HttpSession httpSession) {
        Object username = httpSession.getAttribute("username");
        Object user_role = httpSession.getAttribute("user_role");
        Object last_login = httpSession.getAttribute("last_login");
        if (username != null && user_role != null && last_login != null) {
            JSONObject retData = new JSONObject();
            retData.put("username", username);
            retData.put("user_role", user_role);
            retData.put("last_login", last_login);
            return resp.resp200(Resp.default200Msg, retData);
        } else {
            return resp.resp403(Resp.default403Msg, null);
        }
    }

    @PostMapping("/login")
    public String login(@RequestBody User user,
                        HttpSession httpSession) {
        user.setLast_login(new Date());
        List<User> userList = userMapper.login(user);
        if (userList.size() > 0) {
            userMapper.updateLastLoginTime(user);
            httpSession.setAttribute("username", userList.get(0).getUsername());
            httpSession.setAttribute("user_role", userList.get(0).getUser_role());
            httpSession.setAttribute("last_login", userList.get(0).getLast_login());
            JSONObject retData = new JSONObject();
            retData.put("username", userList.get(0).getUsername());
            retData.put("user_role", userList.get(0).getUser_role());
            retData.put("last_login", userList.get(0).getLast_login());
            return resp.resp200(Resp.default200Msg, retData);
        } else {
            return resp.resp403(Resp.default403Msg, null);
        }
    }

    @PostMapping("/logout")
    public String logout(HttpSession httpSession) {
        // 删除 session
        httpSession.invalidate();
        return resp.resp200(Resp.default200Msg, null);
    }

    // 注册用户
    @PostMapping("/registered")
    public String registered(@RequestBody User user) {
        List<User> userByUsername = userMapper.getUserByUsername(user.getUsername());
        if (userByUsername.size() > 0) {
            return resp.resp500(Resp.default500Msg, "用户名重复");
        }
        user.setLast_login(new Date());
        Integer integer = userMapper.addNewUser(user);
        return resp.resp200(Resp.default200Msg, "注册成功：" + user.getUsername());
    }

    // 查询所有用户
    @GetMapping("/getAllUser")
    public String getAllUser(HttpSession httpSession) {
        Object user_role = httpSession.getAttribute("user_role");
        if (!user_role.toString().equals("admin")) return resp.resp403(Resp.default403Msg, "无访问权限");
        List<User> allUser = userMapper.getAllUser();
        return resp.resp200(Resp.default200Msg, allUser);
    }

    // 删除单个用户
    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam("username") String username,
                             HttpSession httpSession) {
        Object user_role = httpSession.getAttribute("user_role");
        if (!user_role.toString().equals("admin")) return resp.resp403(Resp.default403Msg, "无访问权限");
        Integer integer = userMapper.deleteUser(username);
        return resp.resp200(Resp.default200Msg, integer);
    }

    // 更改用户密码（管理员权限）
    @PostMapping("/updateUser")
    public String updateUser(@RequestParam("username") String username,
                             @RequestParam("password") String password,
                             HttpSession httpSession) {
        Object user_role = httpSession.getAttribute("user_role");
        if (!user_role.toString().equals("admin")) return resp.resp403(Resp.default403Msg, "无访问权限");
        Integer integer = userMapper.updateUser(username, password);
        return resp.resp200(Resp.default200Msg, integer);
    }

}
