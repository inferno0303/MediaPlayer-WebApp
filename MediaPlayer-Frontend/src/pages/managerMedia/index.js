import React from 'react';
import { connect } from 'umi';
import { Button, Collapse, Divider, PageHeader, Select, Statistic, Upload, message } from 'antd';
import { CloudUploadOutlined, FileAddOutlined } from '@ant-design/icons';
import { delay } from '../../utils/respCheck';
import style from './index.less';
import moment from 'moment';
import UserTable from './userTable';
import MediaTable from './mediaTable';
import RegisteredModal from '../login/registeredModal';

const { Panel } = Collapse;
const { Option } = Select;

class ManagerMedia extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      modalVisible: false,
      loading: false,

      // 文件上传Upload
      file: null,
      fileList: [],
      uploadBtnLoading: false,

      // 本地媒体扫描
      scanMediaBtnLoading: false
    }
  }

  // handle
  uploadOnChange = async (data) => {
    await this.setState({
      file: data.file,
      fileList: data.fileList
    });
  };

  uploadFile = async () => {
    await this.setState({uploadBtnLoading: true});
    let formData = new FormData();
    formData.append('file', this.state.file);
    await this.props.dispatch({ type: 'managerModel/uploadFile', payload: formData });
    await this.setState({uploadBtnLoading: false});
    await this.setState({
      file: null,
      fileList: []
    })
  };

  scanMedia = async () => {
    await this.setState({ scanMediaBtnLoading: true });
    message.info("正在扫描本地媒体文件，请稍后......", 15);
    await this.props.dispatch({ type: 'managerModel/scanMedia' });
    await this.setState({ scanMediaBtnLoading: false });
  };
  // 注册对话框
  modalVisible = async () => {
    await this.setState({ modalVisible: true })
  };
  modalHide = async () => {
    await this.setState({ modalVisible: false });
  };

  // life cycle
  initData = async () => {
    await this.setState({ loading: true });
    await this.props.dispatch({type: 'loginModel/getLoginStatus'});
    await this.props.dispatch({ type: 'managerModel/getMusicCount' });
    await this.props.dispatch({ type: 'managerModel/getVideoCount' });
    await this.props.dispatch({ type: 'managerModel/getLastScanMediaTime' });
    await this.setState({ loading: false });
  };

  componentWillMount() {
    this.initData().then()
  }

  render() {

    const renderUpload = () => {
      return <div>
        <div className={style.upload_btn}>
          <Upload name="file"
                  accept=".mp3,.mp4"
                  multiple={false}
                  beforeUpload={() => false}
                  fileList={this.state.fileList}
                  onChange={this.uploadOnChange}
          >
            {
              this.state.fileList.length === 0 ?
                <Button type={'primary'} icon={<FileAddOutlined />} style={{width: '360px'}}>选择文件</Button> :
                <div onClick={() => null}>
                  <span>{`您已选择${this.state.fileList.length}个文件：${this.state.file?.name}`}</span>
                </div>
            }
          </Upload>
          {
            this.state.fileList.length > 0 ?
              <Button type={'primary'} icon={<CloudUploadOutlined />} loading={this.state.uploadBtnLoading} style={{width: '80%', marginTop: '30px'}} onClick={this.uploadFile}>确定上传</Button> :
              null
          }
        </div>
      </div>
    };

    return <div>
      <PageHeader title={'媒体管理'}
                  subTitle={'支持管理员上传，刷新，扫描媒体文件'}
      />
      <Divider orientation='left' style={{ fontWeight: 'bold' }}>媒体概览</Divider>
      <div className={style.row_flex}>
        <Statistic className={style.statistic_board} title="当前媒体库总数：" value={Number(this.props.musicCount + this.props.videoCount)} suffix={'首'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="歌曲数：" value={Number(this.props.musicCount)} suffix={'首'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="视频数：" value={Number(this.props.videoCount)} suffix={'个'}/>
        <Divider type="vertical"/>
        <Statistic className={style.statistic_board} title="最近上传：" value={moment(this.props.lastScanMediaTime ?? '0').format('YYYY-MM-DD HH:mm:ss')}/>
      </div>

      <Divider orientation='left' style={{ fontWeight: 'bold' }}>扫描本地媒体，当前媒体库：D:/media_src</Divider>
      <div className={style.row_flex}>
        <Button onClick={this.scanMedia} type={'primary'} style={{width: '350px', marginTop: '30px'}} loading={this.state.scanMediaBtnLoading}>刷新媒体列表（需要较长时间）</Button>
      </div>

      <Divider orientation='left' style={{ fontWeight: 'bold' }}>上传本地文件（管理员权限）</Divider>
      <div className={style.row_flex}>
        {
          this.props.user_role === 'admin' ? renderUpload() : '您当前不是管理员，无法上传本地媒体到媒体库。'
        }
      </div>

      <Divider orientation='left' style={{ fontWeight: 'bold' }}>系统用户管理（管理员权限）<Button onClick={this.modalVisible} type={'primary'} style={{marginLeft: '20px'}}>+ 新增用户</Button></Divider>
      <div className={style.row_flex}>
        {
          this.props.user_role === 'admin' ? <div className={style.table_wrapper}><UserTable /></div> : '您当前不是管理员，无法管理本地媒体。'
        }
      </div>

      <Divider orientation='left' style={{ fontWeight: 'bold' }}>管理本地文件（管理员权限）</Divider>
      <div className={style.row_flex}>
        {
          this.props.user_role === 'admin' ? <div className={style.table_wrapper}><MediaTable /></div> : '您当前不是管理员，无法管理系统用户。'
        }
      </div>

      <Divider orientation='left' style={{margin: '20px 0'}} />
      <RegisteredModal visible={this.state.modalVisible}
                       hide={this.modalHide}
                       dispatch={this.props.dispatch}
      />
    </div>
  }
}


function mapStateToProps(state) {
  const { username, user_role, last_login } = state.loginModel;
  const { musicCount, videoCount, lastScanMediaTime } = state.managerModel;
  return { username, user_role, last_login, musicCount, videoCount, lastScanMediaTime };
}

export default connect(mapStateToProps)(ManagerMedia);
