import * as rqs from '../services/requestService';
import {message} from 'antd';
import { isArray, isResp200 } from '../utils/respCheck';
import { updateKeyToObjArray } from '../utils/myUtils';

export default {
  namespace: 'globalModel',
  state: {
    mediaLibrary: null,
    allMusic: null,
    allVideo: null,

    distinctMusicArtist: null,
    distinctMusicStyle: null,
    distinctVideoStyle: null,
    allMusicBackup: null,
    allVideoBackup: null,

    nowPlaying: null,
  },
  reducers: {

    mediaLibrary(state, {payload}) {
      return { ...state, mediaLibrary: payload}
    },

    allMusic(state, {payload}) {
      return { ...state, allMusic: payload}
    },

    allVideo(state, {payload}) {
      return { ...state, allVideo: payload}
    },

    distinctMusicArtist(state, {payload}) {
      return { ...state, distinctMusicArtist: payload}
    },

    distinctMusicStyle(state, {payload}) {
      return { ...state, distinctMusicStyle: payload}
    },

    distinctVideoStyle(state, {payload}) {
      return { ...state, distinctVideoStyle: payload}
    },

    allMusicBackup(state, {payload}) {
      return { ...state, allMusicBackup: payload}
    },

    allVideoBackup(state, {payload}) {
      return { ...state, allVideoBackup: payload}
    },

    nowPlaying(state, {payload}) {
      return { ...state, nowPlaying: payload}
    },

  },
  effects: {

    // 获取所有媒体列表
    *getMediaLibrary({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMediaLibrary);
        if (isResp200(res) && isArray(res.data.data)) {
          const ret = updateKeyToObjArray(res);
          yield put({ type: 'mediaLibrary', payload: ret });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 获取所有音乐列表
    *getAllMusic({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getAllMusic);
        if (isResp200(res) && isArray(res.data.data)) {
          const ret = updateKeyToObjArray(res);
          yield put({ type: 'allMusic', payload: ret });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 获取所有视频列表
    *getAllVideo({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getAllVideo);
        if (isResp200(res) && isArray(res.data.data)) {
          const ret = updateKeyToObjArray(res);
          yield put({ type: 'allVideo', payload: ret });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 获取所有音乐艺术家列表
    *getDistinctMusicArtist({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getDistinctMusicArtist);
        if (isResp200(res) && isArray(res.data.data)) {
          yield put({ type: 'distinctMusicArtist', payload: res.data.data });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 获取所有音乐风格列表
    *getDistinctMusicStyle({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getDistinctMusicStyle);
        if (isResp200(res) && isArray(res.data.data)) {
          yield put({ type: 'distinctMusicStyle', payload: res.data.data });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 获取视频类型
    *getDistinctVideoStyle({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getDistinctVideoStyle);
        if (isResp200(res) && isArray(res.data.data)) {
          yield put({ type: 'distinctVideoStyle', payload: res.data.data });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 设置底部栏
    *setNowPlaying({payload}, {call, put}) {
      yield put({ type: 'nowPlaying', payload: payload });
      console.log("setPlaying", payload);
      message.success(`正在播放${payload.title}`, 1)
    },

    // 搜索音乐
    *searchMusic({payload}, {call, put, select}) {
      try {
        const res = yield call(rqs.searchMedia, payload);
        if (isResp200(res) && isArray(res.data.data)) {
          const ret = updateKeyToObjArray(res);
          yield put({ type: 'allMusic', payload: ret });
        }
      } catch (e) {
        console.log(e);
      }
    },

    // 搜索视频
    *searchVideo({payload}, {call, put, select}) {
      try {
        const res = yield call(rqs.searchMedia, payload);
        if (isResp200(res) && isArray(res.data.data)) {
          const ret = updateKeyToObjArray(res);
          yield put({ type: 'allVideo', payload: ret });
        }
      } catch (e) {
        console.log(e);
      }
    },


  },
  subscriptions: {}
}
