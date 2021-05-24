import * as rqs from '../services/requestService';
import {message} from 'antd';
import { isArray, isResp200 } from '../utils/respCheck';
import { updateKeyToObjArray } from '../utils/myUtils';

export default {
  namespace: 'playingModel',
  state: {
    modalVisible: false,
    drawerVisible: false,
    drawerProps: null,
    nowPlayingInfo: null,

    myFavorite: null,
  },
  reducers: {

    modalVisible(state, {payload}) {
      return { ...state, modalVisible: payload}
    },

    drawerVisible(state, {payload}) {
      return { ...state, drawerVisible: payload}
    },

    drawerProps(state, {payload}) {
      return { ...state, drawerProps: payload}
    },

    nowPlayingInfo(state, {payload}) {
      return { ...state, nowPlayingInfo: payload}
    },

    myFavorite(state, {payload}) {
      return { ...state, myFavorite: payload}
    },

  },
  effects: {

    *setModalVisible({payload}, {call, put}) {
      yield put({ type: 'modalVisible', payload: payload });
    },

    *setDrawerVisible({payload}, {call, put}) {
      yield put({ type: 'drawerVisible', payload: payload });
    },

    *setDrawerProps({payload}, {call, put}) {
      yield put({ type: 'drawerProps', payload: payload });
    },

    *setNowPlayingInfo({payload}, {call, put}) {
      yield put({ type: 'nowPlayingInfo', payload: payload });
      message.success(`正在播放${payload.title}`, 1)
    },

    // 上一曲
    *playPrevious({payload}, {call, put, select}) {
      const drawerProps = yield select(state => state.playingModel?.drawerProps);
      const allMusic = yield select(state => state.globalModel?.allMusic ?? []);
      const indexOf = allMusic.indexOf(drawerProps);
      console.log(allMusic.length, indexOf + 1, allMusic.length - 1 <= indexOf + 1);
      if (indexOf - 1 >= 0) {
        yield put({ type: 'setDrawerProps', payload: allMusic[indexOf - 1] })
      }
    },

    // 下一曲
    *playNext({payload}, {call, put, select}) {
      const drawerProps = yield select(state => state.playingModel?.drawerProps);
      const allMusic = yield select(state => state.globalModel?.allMusic ?? []);
      const indexOf = allMusic.indexOf(drawerProps);
      if (allMusic.length - 1 >= indexOf + 1) {
        yield put({ type: 'setDrawerProps', payload: allMusic[indexOf + 1] })
      }
    },

    // 更新标题
    *updateMediaTitle({payload}, {call, put}) {
      try {
        const res = yield call(rqs.updateMediaTitle, payload);
        if (isResp200(res)) {
          message.success('修改成功', 1);
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 更新艺术家
    *updateMediaArtist({payload}, {call, put}) {
      try {
        const res = yield call(rqs.updateMediaArtist, payload);
        if (isResp200(res)) {
          message.success('修改成功', 1);
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 更新风格
    *updateMediaStyle({payload}, {call, put}) {
      try {
        const res = yield call(rqs.updateMediaStyle, payload);
        if (isResp200(res)) {
          message.success('修改成功', 1);
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 修改媒体信息
    *updateMediaAllInfo({payload}, {call, put}) {
      try {
        const res = yield call(rqs.updateMediaAllInfo, payload);
        if (isResp200(res)) {
          message.success('修改媒体信息成功', 1);
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 刷新当前媒体信息
    *getMediaInfoByFileMD5({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMediaInfoByFileMD5, payload);
        if (isResp200(res) && res.data.data.file_md5 === payload.file_md5) {
          yield put({ type: 'drawerProps', payload: res.data.data });
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 获取我喜欢列表
    *getMyFavorite({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getMyFavorite, payload);
        if (isResp200(res) && isArray(res.data.data)) {
          yield put({ type: 'myFavorite', payload: res.data.data });
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 添加到我喜欢列表
    *addMyFavorite({payload}, {call, put}) {
      try {
        const res = yield call(rqs.addMyFavorite, payload);
        if (isResp200(res)) {
          if  (res.data.data === 1) {
            message.success("添加喜欢成功", 1);
          } else if (res.data.data === -1) {
            message.warning("该歌曲已经在我喜欢的列表中了", 1)
          }
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 从我喜欢的列表移除
    *deleteMyFavorite({payload}, {call, put}) {
      try {
        const res = yield call(rqs.deleteMyFavorite, payload);
        if (isResp200(res)) {
          if  (res.data.data === 1) {
            message.success("已移出我喜欢", 1);
          }
        }
      } catch (e) {
        console.log(e)
      }
    }

  },
  subscriptions: {}
}
