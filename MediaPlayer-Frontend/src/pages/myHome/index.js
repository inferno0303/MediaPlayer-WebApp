import React from 'react';
import { connect } from 'umi';
import { Button, Collapse, Divider, PageHeader, Select, Statistic } from 'antd';
import { LoadingOutlined, ReloadOutlined } from '@ant-design/icons';
import { delay } from '../../utils/respCheck';
import style from './index.less';
import moment from 'moment';

class myHome extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      searchArtist: null,
      searchStyle: null,
      searchTitle: null,
    }
  }

  initData = async () => {
    await this.setState({ loading: true });
    await this.props.dispatch({type: 'loginModel/getLoginStatus'});
    await this.props.dispatch({ type: 'managerModel/getMusicCount' });
    await this.props.dispatch({ type: 'managerModel/getVideoCount' });
    await this.props.dispatch({ type: 'managerModel/getMyFavoriteMusicCount' });
    await this.props.dispatch({ type: 'managerModel/getMyFavoriteVideoCount' });
    await this.props.dispatch({ type: 'managerModel/getLastScanMediaTime' });
    await delay(1000);
    await this.setState({ loading: false });
  };

  componentWillMount() {
    this.initData().then()
  }

  render() {
    return <div>
      <PageHeader title={'个人中心'}
                  subTitle={'查看我的详情信息'}
                  extra={[
                    <Button loading={this.state.loading} onClick={this.initData} icon={<ReloadOutlined/>} type="primary"
                            key={1}>刷新</Button>
                  ]}
      />
      <Divider orientation='left' style={{ fontWeight: 'bold' }}>{this.state.loading ? <span>我的账号：<LoadingOutlined style={{marginLeft: '10px'}} /></span> : `我的账号：${this.props.username}，当前角色：${this.props.user_role}`}</Divider>
      <div className={style.row_flex}>
        <Statistic className={style.statistic_board} title="媒体库歌曲数：" value={Number(this.props.musicCount)} suffix={'首'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="媒体库视频数：" value={Number(this.props.videoCount )} suffix={'个'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="我喜欢的歌曲：" value={Number(this.props.favoriteMusicCount)} suffix={'首'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="我喜欢的视频：" value={Number(this.props.favoriteVideoCount)} suffix={'个'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="上次登陆时间：" value={moment(this.props.last_login ?? '0').format('YYYY-MM-DD HH:mm:ss')}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="最近媒体库更新：" value={moment(this.props.lastScanMediaTime ?? '0').format('YYYY-MM-DD HH:mm:ss')}/>
      </div>
    </div>
  }
}


function mapStateToProps(state) {
  const { username, user_role, last_login } = state.loginModel;
  const { musicCount, videoCount, favoriteMusicCount, favoriteVideoCount, lastScanMediaTime } = state.managerModel;
  return { username, user_role, last_login, musicCount, videoCount, favoriteMusicCount, favoriteVideoCount, lastScanMediaTime };
}

export default connect(mapStateToProps)(myHome);
