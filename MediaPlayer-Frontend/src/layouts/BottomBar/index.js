import React from 'react';
import { connect } from 'umi';
import { Row, Col, Tag, Typography } from 'antd';
import {
  CustomerServiceOutlined,
} from '@ant-design/icons';
import style from './index.less';

const { Paragraph } = Typography;

class BottomBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {

    }
  }

  // handler
  showDrawer = async () => {
    await this.props.dispatch({ type: 'playingModel/setDrawerVisible', payload: true });
  };

  render() {
    return <div className={style.bottom_wrapper} onClick={this.showDrawer}>
      <div className={style.flex_v}>
        <span style={{margin: 'auto 20px auto 10px'}}>
          <CustomerServiceOutlined style={{fontSize: 'xx-large'}} />
        </span>
        <Paragraph ellipsis={{ rows: 1 }} style={{color: '#ffffff'}}>正在播放： {this.props.nowPlayingInfo?.title}</Paragraph>
      </div>
    </div>
  }
}

function mapStateToProps(state) {
  const { nowPlayingInfo } = state.playingModel;
  return { nowPlayingInfo };
}

export default connect(mapStateToProps)(BottomBar);
