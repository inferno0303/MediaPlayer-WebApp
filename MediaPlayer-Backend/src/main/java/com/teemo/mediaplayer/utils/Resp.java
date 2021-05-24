package com.teemo.mediaplayer.utils;

import com.alibaba.fastjson.JSONObject;

import java.util.Date;

public class Resp {

    public static String default200Msg = "请求成功";
    public static String default403Msg = "权限错误";
    public static String default500Msg = "参数错误";
    public static String loginSuccessMsg = "登录成功";
    public static String loginFailMsg = "登录失败";
    public static String logoutMsg = "注销登录";

    public String resp(Integer code, String msg, Object data) {
        JSONObject retJson = new JSONObject();
        retJson.put("code", code);
        retJson.put("msg", msg);
        retJson.put("data", data);
        return retJson.toJSONString();
    }

    public String resp200(String msg, Object data) {
        JSONObject retJson = new JSONObject();
        retJson.put("code", 200);
        retJson.put("msg", msg);
        retJson.put("data", data);
        return retJson.toJSONString();
    }

    public String resp403(String msg, Object data) {
        JSONObject retJson = new JSONObject();
        retJson.put("code", 403);
        retJson.put("msg", msg);
        retJson.put("data", data);
        return retJson.toJSONString();
    }

    public String resp500(String msg, Object data) {
        JSONObject retJson = new JSONObject();
        retJson.put("code", 500);
        retJson.put("msg", msg);
        retJson.put("data", data);
        retJson.put("error", 1);
        retJson.put("req_time", new Date().getTime());
        return retJson.toJSONString();
    }
}
