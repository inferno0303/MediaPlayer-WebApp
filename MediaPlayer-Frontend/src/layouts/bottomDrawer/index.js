import React from 'react';
import { connect } from 'umi';
import {
  HeartOutlined,
  RightCircleOutlined,
  PlayCircleOutlined,
  PauseOutlined,
  LeftCircleOutlined,
  InfoCircleOutlined
} from '@ant-design/icons';
import style from './index.less';
import { Divider, Drawer, message } from 'antd';
import { API } from '../../config/requestConfig';

class bottomDrawer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      playerPaused: true
    }
  }

  // handler
  hideDrawer = async () => {
    await this.props.dispatch({ type: 'playingModel/drawerVisible', payload: false });
  };

  addMyFavorite = async () => {
    await this.props.dispatch({ type: 'playingModel/addMyFavorite', payload: {file_md5: this.props.drawerProps?.file_md5 }})
  };

  playPrevious = async () => {
    await this.props.dispatch({ type: 'playingModel/playPrevious' });
    const player = document.getElementById('player');
    await player.play();
    await this.setState({playerPaused: false})
  };

  playNext = async () => {
    await this.props.dispatch({ type: 'playingModel/playNext' });
    const player = document.getElementById('player');
    await player.play();
    await this.setState({playerPaused: false})
  };

  playerPause = () => {
    const player = document.getElementById('player');
    if (!player) {
      message.warning("您还没有选择媒体", 1);
      return -1
    }
    if (player.paused) {
      player.play();
      this.setState({playerPaused: false})
    } else {
      player.pause();
      this.setState({playerPaused: true})
    }
  };

  showDetailModal = async () => {
    await this.props.dispatch({ type: 'playingModel/setModalVisible', payload: true })
  };

  render() {

    const renderPlayer = () => {
      if (this.props.drawerProps?.media_type === '音频mp3') {
        return <audio src={`${API}/play?file_md5=${this.props.drawerProps?.file_md5}`}
                      type="audio/mp3"
                      controls
                      autoPlay
                      style={{width: '90%'}}
                      id='player'
        />
      } else if (this.props.drawerProps?.media_type === '视频mp4') {
        return <video src={`${API}/play?file_md5=${this.props.drawerProps?.file_md5}`}
                      type="video/mp4"
                      controls
                      autoPlay
                      id='player'
                      style={{width: '400px', maxWidth: '98%'}}
        />
      }
    };

    return <Drawer
      title={this.props.drawerProps?.title}
      placement={"bottom"}
      height={"80vh"}
      closable={false}
      onClose={this.hideDrawer}
      visible={this.props.drawerVisible}
    >
      <div className={style.row_flex_middle}>
        <div className={style.column_flex_middle} onClick={this.addMyFavorite}>
          <HeartOutlined style={{fontSize: 'large'}} />
          <div>我喜欢</div>
        </div>
        <Divider type="vertical" />
        {
          this.props.drawerProps?.media_type === '音频mp3' ?
            <div className={style.column_flex_middle} onClick={this.playPrevious}>
              <LeftCircleOutlined style={{fontSize: 'large'}} />
              <div>上一曲</div>
            </div> :
            null
        }
        <Divider type="vertical" />
        <div className={style.column_flex_middle} onClick={this.playerPause}>
          {this.state.playerPaused ? <PlayCircleOutlined style={{fontSize: 'large'}} /> : <PauseOutlined style={{fontSize: 'large'}} />}
          <div>{this.state.playerPaused ? '播 放' : '暂 停'}</div>
        </div>
        <Divider type="vertical" />
        {
          this.props.drawerProps?.media_type === '音频mp3' ?
            <div className={style.column_flex_middle} onClick={this.playNext}>
              <RightCircleOutlined style={{fontSize: 'large'}} />
              <div>下一曲</div>
            </div> :
            null
        }
        <Divider type="vertical" />
        <div className={style.column_flex_middle} onClick={this.showDetailModal}>
          <InfoCircleOutlined style={{fontSize: 'large'}} />
          <div>详细信息</div>
        </div>
      </div>
      <div className={style.player}>
        {
          renderPlayer()
        }
      </div>
    </Drawer>
  }
}

function mapStateToProps(state) {
  const { drawerVisible, drawerProps, nowPlayingInfo } = state.playingModel;
  return { drawerVisible, drawerProps, nowPlayingInfo };
}

export default connect(mapStateToProps)(bottomDrawer);
