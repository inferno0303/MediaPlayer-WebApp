import React from 'react';
import { connect } from 'umi';
import { Typography, Button, Drawer, List, PageHeader, Tag, Popover, Menu, Divider, Input, Select } from 'antd';
import { ReloadOutlined } from '@ant-design/icons';
import { delay } from '../../utils/respCheck';
import { API } from '../../config/requestConfig';
import style from './index.less';
import {
  SearchOutlined,
  PlayCircleOutlined,
  HeartOutlined,
  CustomerServiceOutlined,
} from '@ant-design/icons';

const { Paragraph } = Typography;
const { Option } = Select;

class MusicLibrary extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: false,
      searchArtist: null,
      searchStyle: null,
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
    await this.props.dispatch({ type: 'globalModel/searchMusic', payload: {artist: this.state.searchArtist, style: this.state.searchStyle, title: this.state.searchTitle, media_type: '音频mp3'} });
    await this.setState({loading: false});
  };
  // 重置搜索
  resetSearch = () => {
    this.setState({searchArtist: null, searchStyle: null, searchTitle: null});
    this.initData().then()
  };

  initData = async () => {
    await this.setState({loading: true});
    await this.props.dispatch({ type: 'globalModel/getAllMusic' });
    this.props.dispatch({ type: 'globalModel/getDistinctMusicArtist' });
    this.props.dispatch({ type: 'globalModel/getDistinctMusicStyle' });
    await this.setState({loading: false});
  };

  componentWillMount() {
    this.initData().then()
  }

  render() {

    const renderSearch = () => {
      return <div className={style.search_middle}>
        <span>艺术家：</span>
        <Select value={this.state.searchArtist} onChange={value => {this.setState({searchArtist: value})}} style={{ width: 120 }} bordered={false}>
          {
            this.props.distinctMusicArtist?.map((item, index) => (
              <Option value={item} key={index}>{item}</Option>
            ))
          }
        </Select>
        <span>风格：</span>
        <Select value={this.state.searchStyle} onChange={value => {this.setState({searchStyle: value})}} style={{ width: 120 }} bordered={false}>
          {
            this.props.distinctMusicStyle?.map((item, index) => (
              <Option value={item} key={index}>{item}</Option>
            ))
          }
        </Select>
        <div>
          <Input value={this.state.searchTitle} onChange={e => this.setState({searchTitle: e.target.value})} placeholder="搜索歌曲" style={{ width: 200 }} />
          <Button type='primary' onClick={this.onSearch} shape="round" icon={<SearchOutlined />} style={{marginLeft: '5px'}}>搜索</Button>
          <Button type='link' style={{color: 'red'}} onClick={this.resetSearch}>清空</Button>
        </div>
      </div>
    };

    const renderMediaList = () => {
      return <List header={this.props.allMusic ? `共找到${this.props.allMusic?.length}首歌曲` : `加载中...`}
                   footer={'End'}
                   bordered={false}
                   loading={this.state.loading}
                   dataSource={this.props.allMusic ?? []}
                   renderItem={(item, index) => (
                     <List.Item className={style.list_item_wrapper} onClick={this.showDrawer.bind(this, item)}>
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
      <PageHeader title={'音乐库'}
                  subTitle={'让生活充满音乐'}
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
  const { allMusic, distinctMusicArtist, distinctMusicStyle } = state.globalModel;
  const { drawerProps } = state.playingModel;
  return { allMusic, distinctMusicArtist, distinctMusicStyle, drawerProps };
}

export default connect(mapStateToProps)(MusicLibrary);
