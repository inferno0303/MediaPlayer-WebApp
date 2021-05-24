import * as rqs from '../services/requestService';
import {message} from 'antd';
import { isResp200, isArray } from '../utils/respCheck';

export default {
  namespace: 'loginModel',
  state: {
    isLogin: false,
    username: null,
    user_role: null,
    last_login: null,
    allUser: [],
  },
  reducers: {
    isLogin(state, {payload}) {
      return { ...state, isLogin: payload}
    },
    username(state, {payload}) {
      return { ...state, username: payload}
    },
    user_role(state, {payload}) {
      return { ...state, user_role: payload}
    },
    last_login(state, {payload}) {
      return { ...state, last_login: payload}
    },
    allUser(state, {payload}) {
      return { ...state, allUser: payload}
    },
  },
  effects: {

    *resetLoginStatus({payload}, {call, put}) {
      console.log("===重置前端登陆状态===");
      yield put({ type: 'isLogin', payload: false });
      yield put({ type: 'username', payload: null });
      yield put({ type: 'user_role', payload: null });
      yield put({ type: 'last_login', payload: null });
    },

    *getLoginStatus({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getLoginStatus);
        if (res.data.code === 200) {
          yield put({ type: 'isLogin', payload: true });
          yield put({ type: 'username', payload: res.data.data.username });
          yield put({ type: 'user_role', payload: res.data.data.user_role });
          yield put({ type: 'last_login', payload: res.data.data.last_login });
        } else {
          yield put({ type: 'resetLoginStatus' });
        }
      } catch (e) {
        console.log(e)
      }
    },

    *login({payload}, {call, put}) {
      try {
        yield put({ type: 'resetLoginStatus' });
        const res = yield call(rqs.login, payload);
        if (isResp200(res)) {
          yield put({ type: 'isLogin', payload: true });
          yield put({ type: 'username', payload: res.data.data.username });
          yield put({ type: 'user_role', payload: res.data.data.user_role });
          yield put({ type: 'last_login', payload: res.data.data.last_login });
        } else if (res.code === 403) {
          message.error("用户名或密码错误", 1);
        }
      } catch (e) {
        console.log(e)
      }
    },

    *logout({payload}, {call, put}) {
      try {
        const resp = yield call(rqs.logout);
        if(isResp200(resp)) {
          message.success('您已退出登陆', 1);
          yield put({type: 'getLoginStatus'})
        }
      } catch (e) {
        console.log(e)
      }
    },

    *registered({payload}, {call, put}) {
      try {
        const res = yield call(rqs.registered, payload);
        if (res.status === 200 && res.data.code === 200) {
          message.success(res.data.data, 2)
        } else if (res.data.code === 500) {
          message.error(res.data.data, 2);
        }
      } catch (e) {
        console.log(e)
      }
    },

    // getAllUser
    *getAllUser({payload}, {call, put}) {
      try {
        const res = yield call(rqs.getAllUser);
        if (isResp200(res) && isArray(res.data.data)) {
          let tmpList = [];
          res.data.data.forEach((each, index) => {
            each.key = index;
            tmpList.push(each)
          });
          yield put({ type: 'allUser', payload: tmpList })
        }
      } catch (e) {
        console.log(e)
      }
    },

    // deleteUser
    *deleteUser({payload}, {call, put}) {
      try {
        const res = yield call(rqs.deleteUser, payload);
        if (isResp200(res)) {
          message.success("删除账户成功", 1);
          yield put({ type: 'getAllUser' })
        }
      } catch (e) {
        console.log(e)
      }
    },

    // 更新用户密码（管理员端）
    *updateUser({payload}, {call, put}) {
      try {
        const res = yield call(rqs.updateUser, payload);
        if (isResp200(res)) {
          message.success("更改用户密码成功", 1);
          yield put({ type: 'getAllUser' })
        }
      } catch (e) {
        console.log(e)
      }
    }

  },
  subscriptions: {}
}
