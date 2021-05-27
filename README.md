# 在线媒体播放器

## 介绍

名称：在线媒体播放器 - MediaPlayer

简介：在线媒体播放器，支持播放音乐，视频，支持管理员管理账户，添加本地音乐。界面风格类似于网易云音乐在线版。

技术栈：后端 Java SpringBoot + 前端 React Umi.js，后端实现媒体流，前端基于H5实现播放媒体，可打包为HyperApp应用到安卓。

类型：前后端分离应用，WebApp，外包项目

## 安装

### 目录结构

MediaPlayer-Backend：后端

MediaPlayer-Frontend：前端

数据库表结构：数据库

assets：示例文件

文档：一些文档

### 如何运行

后端：标准Java Maven SpringBoot工程，在pom.xml目录下执行mvn install拉取依赖后，mvn package打包jar包，推荐在idea环境下配置maven项目。

```
mvn install
mvn package
java -jar ./target/xxx.jar
```

前端：标准webpack工程，在package.json目录下执行npm install拉取依赖，npm start运行工程，npm build构建工程。

```
npm install
npm start
npm build
```

数据库：记得导入数据库表结构，默认utf8mb4。

```
mysql -u root -h host -p < media_player_xxx.sql
```

## 功能

1. 登录功能，支持注册账号，登录，基于拦截器实现权限认证；

2. 音乐库管理，支持mp3格式的音乐库管理，点击即可在线播放，基于H5 audio；

3. 视频库管理，支持mp4格式的视频库管理，点击即可在线播放，基于H5 video；

4. 媒体详情，支持对音频的媒体名，艺术家，风格进行修改；

5. 本地媒体扫描，支持扫描本地媒体文件，播放本地媒体文件，基于MD5 + 服务端mysql；

6. 上传媒体到服务端，支持上传mp3、mp4文件到服务端保存，基于文件管理；

7. 我喜欢，添加媒体文件到我喜欢列表。

## 效果

### 音乐库

![01-音乐库](https://cdn.jsdelivr.net/gh/yangxu770409504/assets@main/20210527/01-音乐库.2ynwy3xv14u0.png)



### 媒体详情

![02-媒体详情](https://cdn.jsdelivr.net/gh/yangxu770409504/assets@main/20210527/02-媒体详情.gep96qkchy0.png)





### 媒体管理

![02-媒体详情](https://cdn.jsdelivr.net/gh/yangxu770409504/assets@main/20210527/02-媒体详情.gep96qkchy0.png)



