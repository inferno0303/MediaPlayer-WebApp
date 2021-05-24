import React from 'react';
import { history } from 'umi';
import { Menu } from 'antd';
import {
  UserOutlined,
  CustomerServiceOutlined,
  HeartOutlined,
  FileSyncOutlined,
  PlaySquareOutlined,
  LoginOutlined
} from '@ant-design/icons';
import NowPlaying from './bottomDrawer';
import BottomBar from './BottomBar';
import DetailModal from './detailModal';


class TopMenu extends React.Component {
  constructor(props) {
    super(props);
    this.state = {}
  }

  // handler
  handleClick = e => {
    if (history.location.pathname !== e.key) history.push(e.key);
  };

  render() {

    const renderMenu = () => {
      if (history.location.pathname === '/login') return null;
      else return (
        <Menu mode="horizontal" theme='dark' onClick={this.handleClick} selectedKeys={history.location.pathname}>
          <Menu.Item key="/myHome">
            <UserOutlined />
            个人中心
          </Menu.Item>
          <Menu.Item key="/musicLibrary">
            <CustomerServiceOutlined />
            音乐库
          </Menu.Item>
          <Menu.Item key="/videoLibrary">
            <PlaySquareOutlined />
            视频库
          </Menu.Item>
          <Menu.Item key="/myFavorite">
            <HeartOutlined />
            我喜欢
          </Menu.Item>
          <Menu.Item key="/managerMedia">
            <FileSyncOutlined />
            媒体管理
          </Menu.Item>
          <Menu.Item key="/login" style={{float: 'right'}}>
            <LoginOutlined />
            回登录页
          </Menu.Item>
        </Menu>
      )
    };

    return <div>
      <div>
        { renderMenu() }
      </div>
      <div>
        { this.props.children }
      </div>
      <div>
        <NowPlaying />
        <BottomBar />
        <DetailModal />
      </div>
    </div>;
  }
}

export default TopMenu;
