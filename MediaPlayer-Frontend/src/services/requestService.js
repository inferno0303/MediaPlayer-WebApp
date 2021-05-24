import req from 'axios';
import { API } from '../config/requestConfig';
import { parseParams } from '../utils/myUtils';

// 登陆页面的接口

// getLoginStatus
export function getLoginStatus() {
  const url = `${API}/getLoginStatus`;
  return req.get(url, {
    withCredentials: true
  })
}

// login
export function login(payload) {
  const url = `${API}/login`;
  return req({
    url,
    method: 'post',
    data: payload,
    withCredentials: true
  })
}

// logout
export function logout() {
  const url = `${API}/logout`;
  return req({
    url,
    method: 'post',
    withCredentials: true
  })
}

// 注册用户
export function registered(payload) {
  const url = `${API}/registered`;
  return req({
    url,
    data: payload,
    method: 'post',
    withCredentials: true
  })
}

// 获取所有媒体列表
export function getMediaLibrary() {
  const url = `${API}/getMediaLibrary`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取所有音乐列表
export function getAllMusic() {
  const url = `${API}/getAllMusic`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取所有视频列表
export function getAllVideo() {
  const url = `${API}/getAllVideo`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取所有音乐艺术家列表
export function getDistinctMusicArtist() {
  const url = `${API}/getDistinctMusicArtist`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取所有音乐风格列表
export function getDistinctMusicStyle() {
  const url = `${API}/getDistinctMusicStyle`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取视频类型
export function getDistinctVideoStyle() {
  const url = `${API}/getDistinctVideoStyle`;
  return req.get(url, {
    withCredentials: true
  })
}

// 更新标题
export function updateMediaTitle(payload) {
  const url = `${API}/updateMediaTitle`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 更新艺术家
export function updateMediaArtist(payload) {
  const url = `${API}/updateMediaArtist`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 更新风格
export function updateMediaStyle(payload) {
  const url = `${API}/updateMediaStyle`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 更改媒体信息
export function updateMediaAllInfo(payload) {
  const url = `${API}/updateMediaAllInfo`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 根据md5获取单个媒体信息
export function getMediaInfoByFileMD5(payload) {
  const url = `${API}/getMediaInfoByFileMD5`;
  return req.get(url, {
    params: payload,
    withCredentials: true
  })
}

// 搜索媒体
export function searchMedia(payload) {
  const url = `${API}/searchMedia`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 我喜欢页面

// 获取我喜欢的媒体
export function getMyFavorite(payload) {
  const url = `${API}/getMyFavorite`;
  return req.get(url, {
    params: payload,
    withCredentials: true
  })
}

// 添加媒体到我喜欢
export function addMyFavorite(payload) {
  const url = `${API}/addMyFavorite`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 从我喜欢的媒体列表删除
export function deleteMyFavorite(payload) {
  const url = `${API}/deleteMyFavorite`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 首页 以及 管理
export function getMusicCount() {
  const url = `${API}/getMusicCount`;
  return req.get(url, {
    withCredentials: true
  })
}

export function getVideoCount() {
  const url = `${API}/getVideoCount`;
  return req.get(url, {
    withCredentials: true
  })
}

export function getMyFavoriteMusicCount() {
  const url = `${API}/getMyFavoriteMusicCount`;
  return req.get(url, {
    withCredentials: true
  })
}

export function getMyFavoriteVideoCount() {
  const url = `${API}/getMyFavoriteVideoCount`;
  return req.get(url, {
    withCredentials: true
  })
}

export function getLastScanMediaTime() {
  const url = `${API}/getLastScanMediaTime`;
  return req.get(url, {
    withCredentials: true
  })
}

// 上传文件
export function uploadFile(payload) {
  const url = `${API}/uploadFile`;
  return req({
    url,
    method: 'post',
    data: payload,
    withCredentials: true
  })
}

// 扫描本地媒体
export function scanMedia() {
  const url = `${API}/scanMedia`;
  return req.get(url, {
    withCredentials: true
  })
}

// 获取所有用户列表
export function getAllUser() {
  const url = `${API}/getAllUser`;
  return req.get(url, {
    withCredentials: true
  })
}

// 删除某个用户
export function deleteUser(payload) {
  const url = `${API}/deleteUser`;
  return req.get(url, {
    params: payload,
    withCredentials: true
  })
}

// 更改用户密码
export function updateUser(payload) {
  const url = `${API}/updateUser`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}

// 删除媒体库文件
export function deleteMedia(payload) {
  const url = `${API}/deleteMedia`;
  return req({
    url,
    method: 'post',
    data: parseParams(payload),
    withCredentials: true
  })
}
