import React from 'react';
import { connect } from 'umi';
import { Typography, Button, Drawer, Radio, PageHeader, Tag, Popover, Menu, Divider, Input, Select, Collapse } from 'antd';
import { ReloadOutlined, CaretRightOutlined } from '@ant-design/icons';
import { delay } from '../../utils/respCheck';
import { API } from '../../config/requestConfig';
import style from './index.less';
import classnames from 'classnames';
import {
  InfoCircleOutlined,
  PlayCircleOutlined,
  HeartOutlined,
  CustomerServiceOutlined,
} from '@ant-design/icons';
import moment from 'moment';

const { Panel } = Collapse;
const { Option } = Select;

class MyFavorite extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      switchMusicVideo: '音乐'
    }
  }

  // handler
  // 打开底部播放页
  showDrawer = async (item) => {
    await this.props.dispatch({ type: 'playingModel/setDrawerProps', payload: item });
    await this.props.dispatch({ type: 'playingModel/setNowPlayingInfo', payload: item });
    await this.props.dispatch({ type: 'playingModel/setDrawerVisible', payload: true });
  };

  // 切换音乐/视频
  onSwitchMusicVideo = async (e) => {
    const value = e.target.value;
    this.setState({ switchMusicVideo: value });
    if (value === '音乐') {
      await this.props.dispatch({ type: 'playingModel/getMyFavorite', payload: {media_type: '音频mp3'} });
    } else if (value === '视频') {
      await this.props.dispatch({ type: 'playingModel/getMyFavorite', payload: {media_type: '视频mp4'} });
    }
  };

  // 播放按钮
  onPlayBtn = async (item) => {
    await this.props.dispatch({ type: 'playingModel/getMediaInfoByFileMD5', payload: {file_md5: item.file_md5} });
    await this.props.dispatch({ type: 'playingModel/setNowPlayingInfo', payload: this.props.drawerProps })
  };

  // 取消收藏按钮
  onCancelFavorite = async (item) => {
    await this.props.dispatch({ type: 'playingModel/deleteMyFavorite', payload: {file_md5: item.file_md5} });
    await this.props.dispatch({ type: 'playingModel/getMyFavorite', payload: {media_type: item.media_type}});
  };

  // life cycle
  initData = async () => {
    await this.setState({loading: true});
    await this.props.dispatch({ type: 'playingModel/getMyFavorite', payload: {media_type: '音频mp3'} });
    await this.setState({loading: false});
  };

  componentWillMount() {
    this.initData().then()
  }

  render() {

    const renderSwitch = () => {
      return <div className={style.search_middle}>
        <span>查看：</span>
        <Radio.Group onChange={this.onSwitchMusicVideo} value={this.state.switchMusicVideo}>
          <Radio.Button value={'音乐'}>音乐</Radio.Button>
          <Radio.Button value={'视频'}>视频</Radio.Button>
        </Radio.Group>
      </div>
    };

    const renderMediaList = () => {
      return <Collapse bordered={false}
                       accordion={true}
                       className={style.site_collapse_custom_collapse}
      >
        {
          this.props.myFavorite?.map((item, index) => (
            <Panel header={item.title} key={index} className={style.site_collapse_custom_panel}>
              <p>收藏时间：{moment(item.update_time).format("YYYY-MM-DD HH:mm:ss")}</p>
              <div className={style.play_btn}>
                <Button onClick={this.onCancelFavorite.bind(this, item)} icon={<HeartOutlined />} style={{margin: '0 15px'}}>取消收藏</Button>
                <Button onClick={this.onPlayBtn.bind(this, item)} icon={<PlayCircleOutlined />} style={{margin: '0 15px'}} type={'primary'}>播放</Button>
              </div>
            </Panel>
          ))
        }
      </Collapse>
    };

    return <div>
      <PageHeader title={'我喜欢'}
                  subTitle={'收藏每一份心爱'}
                  extra={[
                    <Button loading={this.state.loading} onClick={this.initData} icon={<ReloadOutlined />} type="primary" key={1}>刷新</Button>
                  ]}
      />
      <div>
        {
          renderSwitch()
        }
      </div>
      <div className={style.list_wrapper}>
        {
          renderMediaList()
        }
      </div>
    </div>
  }
}

function mapStateToProps(state) {
  const { } = state.globalModel;
  const { drawerProps, myFavorite } = state.playingModel;
  return { myFavorite, drawerProps };
}

export default connect(mapStateToProps)(MyFavorite);
