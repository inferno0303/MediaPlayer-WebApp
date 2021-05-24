import * as rqs from '../services/requestService';
import {message} from 'antd';
import { isResp200, isArray } from '../utils/respCheck';

export default {
  namespace: 'managerModel',
  state: {
    musicCount: 0,
    videoCount: 0,
    favoriteMusicCount: 0,
    favoriteVideoCount: 0,
    lastScanMediaTime: null
  },
  reducers: {
    musicCount(state, {payload}) {
      return { ...state, musicCount: payload}
    },

    videoCount(state, {payload}) {
      return { ...state, videoCount: payload}
    },

    favoriteMusicCount(state, {payload}) {
      return { ...state, favoriteMusicCount: payload}
    },

    favoriteVideoCount(state, {payload}) {
      return { ...state, favoriteVideoCount: payload}
    },

    lastScanMediaTime(state, {payload}) {
      return { ...state, lastScanMediaTime: payload}
    },

  },
  effects: {

    *getMusicCount({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMusicCount);
        if (isResp200(res)) {
          yield put({ type: 'musicCount', payload: res.data.data })
        }
      } catch (e) {
        console.log(e)
      }
    },

    *getVideoCount({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getVideoCount);
        if  (isResp200(res)) {
          yield put({ type: 'videoCount', payload: res.data.data })
        }
      } catch (e) {
        console.log(e)
      }
    },

    *getMyFavoriteMusicCount({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMyFavoriteMusicCount);
        if  (isResp200(res)) {
          yield put({ type: 'favoriteMusicCount', payload: res.data.data })
        }
      } catch (e) {
        console.log(e)
      }
    },

    *getMyFavoriteVideoCount({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMyFavoriteVideoCount);
        if  (isResp200(res)) {
          yield put({ type: 'favoriteVideoCount', payload: res.data.data })
        }
      } catch (e) {
        console.log(e)
      }
    },

    *getLastScanMediaTime({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getLastScanMediaTime);
        if  (isResp200(res)) {
          yield put({ type: 'lastScanMediaTime', payload: res.data.data })
        }
      } catch (e) {
        console.log(e)
      }
    },

    *uploadFile({payload}, {call, put}) {
      try {
        const res = yield call(rqs.uploadFile, payload);
        if  (isResp200(res)) {
          message.success("上传文件成功", 2)
        } else if (res.status === 200 && res.data.code === 500) {
          message.warning(res.data.data, 2);
        }
      } catch (e) {
        console.log(e)
      }
    },

    *scanMedia({payload}, {call, put}) {
      try {
        const res = yield call(rqs.scanMedia);
        if  (isResp200(res)) {
          message.success("扫描本地媒体已完成，新增媒体数量：" + res.data.data, 3)
        }
      } catch (e) {
        console.log(e)
      }
    },

    *deleteMedia({payload}, {call, put}) {
      try {
        const res = yield call(rqs.deleteMedia, payload);
        if  (isResp200(res)) {
          message.success(res.data.data, 3)
        }
      } catch (e) {
        console.log(e)
      }
    }

  },
  subscriptions: {}
}
