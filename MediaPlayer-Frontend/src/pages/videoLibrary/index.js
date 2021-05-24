import React from 'react';
import { connect } from 'umi';
import { Typography, Button, Radio, List, PageHeader, Tag, Popover, Menu, Divider, Input, Select } from 'antd';
import { ReloadOutlined, SearchOutlined } from '@ant-design/icons';
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

const { Paragraph } = Typography;
const { Option } = Select;

class VideoLibrary extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      searchArtist: null,
      searchStyle: "所有",
      searchTitle: null,
    }
  }

  // handler
  // 打开底部播放页
  showDrawer = async (item) => {
    await this.props.dispatch({ type: 'playingModel/setDrawerProps', payload: item });
    await this.props.dispatch({ type: 'playingModel/setNowPlayingInfo', payload: item });
    await this.props.dispatch({ type: 'playingModel/setDrawerVisible', payload: true });
  };

  // 搜索
  onSearch = async () => {
    await this.setState({loading: true});
    let videoStyle = this.state.searchStyle;
    if (videoStyle === '所有') {
      videoStyle = null
    }
    await this.props.dispatch({ type: 'globalModel/searchVideo', payload: {artist: this.state.searchArtist, style: videoStyle, title: this.state.searchTitle, media_type: '视频mp4'} });
    await this.setState({loading: false});
  };
  // 重置搜索
  resetSearch = () => {
    this.setState({searchArtist: null, searchStyle: null, searchTitle: null});
    this.initData().then()
  };

  initData = async () => {
    await this.setState({loading: true});
    await this.props.dispatch({ type: 'globalModel/getAllVideo' });
    this.props.dispatch({ type: 'globalModel/getDistinctMusicArtist' });
    this.props.dispatch({ type: 'globalModel/getDistinctVideoStyle' });
    await this.setState({loading: false});
  };

  componentWillMount() {
    this.initData().then()
  }

  render() {

    const renderSearch = () => {
      return <div className={style.search_middle}>
        <span>筛选视频类型：</span>
        <Radio.Group value={this.state.searchStyle} onChange={e => { this.setState({searchStyle: e.target.value}, () => this.onSearch())} } buttonStyle="solid">
          <Radio.Button value="所有">所有</Radio.Button>
          {
            this.props.distinctVideoStyle?.map((item, index) => (
              <Radio.Button value={item} key={index}>{item}</Radio.Button>
            ))
          }
        </Radio.Group>
      </div>
    };

    const renderMediaList = () => {
      return <List header={`共找到${this.props.allVideo?.length}个视频`}
                   footer={'End'}
                   bordered={false}
                   loading={this.state.loading}
                   dataSource={this.props.allVideo ?? []}
                   renderItem={(item, index) => (
                     <List.Item style={{width: '100%'}} onClick={this.showDrawer.bind(this, item)} className={style.list_item_wrapper}>
                       <Paragraph ellipsis={{rows: 1}}>
                         {this.props.drawerProps?.id === item.id ? <PlayCircleOutlined style={{fontSize: 'large', marginRight: '20px'}} /> : <Tag>{index + 1}</Tag>}
                         <span style={{color: '#0099ff'}}>{item.title}</span>
                       </Paragraph>
                       <Paragraph ellipsis={{rows: 1}}>
                         <span style={{fontSize: 'x-small', color: '#666666'}}>{item.artist}</span>
                       </Paragraph>
                     </List.Item>
                   )}
      />
    };

    return <div>
      <PageHeader title={'视频库'}
                  subTitle={'家庭视频中心'}
                  extra={[
                    <Button loading={this.state.loading} onClick={this.initData} icon={<ReloadOutlined />} type="primary" key={1}>刷新</Button>
                  ]}
      />
      <div>
        {
          renderSearch()
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
  const { allVideo, distinctMusicArtist, distinctVideoStyle } = state.globalModel;
  console.log(distinctVideoStyle);
  const { drawerProps } = state.playingModel;
  return { allVideo, distinctMusicArtist, distinctVideoStyle, drawerProps };
}

export default connect(mapStateToProps)(VideoLibrary);
