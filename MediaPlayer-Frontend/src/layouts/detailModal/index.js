import React from 'react';
import { connect } from 'umi';
import { Modal, Descriptions, Input, Button } from 'antd';
import moment from 'moment';

class DetailModal extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editMode: false,
      // newTitle: '',

      postTitleLoading: false,
      editTitle: false,
      newTitle: '',

      postArtistLoading: false,
      editArtist: false,
      newArtist: '',

      postStyleLoading: false,
      editStyle: false,
      newStyle: '',
    }
  }

  // handle
  postNewTitle = async () => {
    await this.setState({postTitleLoading: true});
    if (this.state.newTitle !== this.props.drawerProps?.title) {
      await this.props.dispatch({ type: 'playingModel/updateMediaTitle', payload: {file_md5: this.props.drawerProps?.file_md5, title: this.state.newTitle }});
      await this.props.dispatch({ type: 'playingModel/getMediaInfoByFileMD5', payload: {file_md5: this.props.drawerProps?.file_md5 }});
      await this.props.dispatch({ type: 'globalModel/getAllMusic' });
      await this.props.dispatch({ type: 'globalModel/getAllVideo' });
    }
    await this.setState({ editTitle: false, postTitleLoading: false });
  };

  postNewArtist = async () => {
    await this.setState({postArtistLoading: true});
    if (this.state.newArtist !== this.props.drawerProps?.artist) {
      await this.props.dispatch({ type: 'playingModel/updateMediaArtist', payload: {file_md5: this.props.drawerProps?.file_md5, artist: this.state.newArtist }});
      await this.props.dispatch({ type: 'playingModel/getMediaInfoByFileMD5', payload: {file_md5: this.props.drawerProps?.file_md5 }});
      await this.props.dispatch({ type: 'globalModel/getAllMusic' });
      await this.props.dispatch({ type: 'globalModel/getAllVideo' });
    }
    await this.setState({ editArtist: false, postArtistLoading: false });
  };

  postNewStyle = async () => {
    await this.setState({postStyleLoading: true});
    if (this.state.newStyle !== this.props.drawerProps?.style) {
      await this.props.dispatch({ type: 'playingModel/updateMediaStyle', payload: {file_md5: this.props.drawerProps?.file_md5, style: this.state.newStyle }});
      await this.props.dispatch({ type: 'playingModel/getMediaInfoByFileMD5', payload: {file_md5: this.props.drawerProps?.file_md5 }});
      await this.props.dispatch({ type: 'globalModel/getAllMusic' });
      await this.props.dispatch({ type: 'globalModel/getAllVideo' });
    }
    await this.setState({ editStyle: false, postStyleLoading: false });
  };

  onOk = () => {
    this.onCancel()
  };

  onCancel = () => {
    this.setState({editMode: false});
    this.props.dispatch({ type: 'playingModel/setModalVisible', payload: false })
  };

  render() {
    return <Modal
      title="????????????"
      visible={this.props.modalVisible}
      onOk={this.onOk}
      onCancel={this.onCancel}>
      <Descriptions title={this.props.drawerProps?.title} layout="vertical" bordered={false} column={1}>
        <Descriptions.Item label="?????????">
          <span>
            {
              !this.state.editTitle ?
                this.props.drawerProps?.title :
                <Input.TextArea value={this.state.newTitle} onChange={e => this.setState({newTitle: e.target.value})} rows={3} style={{width: '300px'}} />
            }
          </span>
          {
            !this.state.editTitle ?
              <Button type='link' onClick={() => this.setState({editTitle: true, newTitle: this.props.drawerProps?.title})}>??????</Button> :
              <Button type='link' onClick={this.postNewTitle} loading={this.state.postTitleLoading}>??????</Button>
          }
        </Descriptions.Item>
        <Descriptions.Item label="????????????">{this.props.drawerProps?.media_type}</Descriptions.Item>
        <Descriptions.Item label="?????????">{this.props.drawerProps?.file_name}</Descriptions.Item>
        <Descriptions.Item label="?????????">
          <span>
            {
              !this.state.editArtist ?
                this.props.drawerProps?.artist :
                <Input.TextArea value={this.state.newArtist} onChange={e => this.setState({newArtist: e.target.value})} rows={3} style={{width: '300px'}} />
            }
          </span>
          {
            !this.state.editArtist ?
              <Button type='link' onClick={() => this.setState({editArtist: true, newArtist: this.props.drawerProps?.artist})}>??????</Button> :
              <Button type='link' onClick={this.postNewArtist} loading={this.state.postArtistLoading}>??????</Button>
          }
        </Descriptions.Item>
        <Descriptions.Item label="??????">
          <span>
            {
              !this.state.editStyle ?
                this.props.drawerProps?.style :
                <Input.TextArea value={this.state.newStyle} onChange={e => this.setState({newStyle: e.target.value})} rows={3} style={{width: '300px'}} />
            }
          </span>
          {
            !this.state.editStyle ?
              <Button type='link' onClick={() => this.setState({editStyle: true, newStyle: this.props.drawerProps?.style})}>??????</Button> :
              <Button type='link' onClick={this.postNewStyle} loading={this.state.postStyleLoading}>??????</Button>
          }
        </Descriptions.Item>
        <Descriptions.Item label="????????????">{this.props.drawerProps?.file_path}</Descriptions.Item>
        <Descriptions.Item label="??????MD5">{this.props.drawerProps?.file_md5}</Descriptions.Item>
        <Descriptions.Item label="????????????">{moment(this.props.drawerProps?.update_time).format('YYYY-MM-DD HH:mm:ss')}</Descriptions.Item>
      </Descriptions>
    </Modal>
  }
}

function mapStateToProps(state) {
  const { modalVisible, drawerProps } = state.playingModel;
  return { modalVisible, drawerProps };
}

export default connect(mapStateToProps)(DetailModal);
