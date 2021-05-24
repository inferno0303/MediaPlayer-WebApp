import React from 'react';
import { connect, history } from 'umi';
import { Alert, Button, Form, Input, Radio, Modal } from 'antd';
import { LockOutlined, LoginOutlined, UserOutlined } from '@ant-design/icons';
import styles from './index.less';
import RegisteredModal from './registeredModal';


class Login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      modalVisible: false,
      isLoading: false,
    }
  }

  // handle
  onSubmit = async value => {
    const payload = {
      username: value.username,
      password: value.password
    };
    await this.props.dispatch({type: 'loginModel/login', payload: payload});
    if (this.props.isLogin === true) {
      Modal.success({
        centered: true,
        title: `${this.props.username}，欢迎回来`,
        content: `您的账户类型是${this.props.user_role}，点击确定即可进入用户首页。`,
        onOk: () => {
          this.linkToPage()
        }
      });
    }
  };

  logoutBtn = async () => {
    await this.props.dispatch({type: 'loginModel/logout'});
  };

  linkToPage = () => {
    if (this.props.user_role === "user") history.push("/musicLibrary");
    else if (this.props.user_role === "admin") history.push("/managerMedia");
  };

  // 注册对话框
  modalVisible = async () => {
    await this.setState({ modalVisible: true })
  };
  modalHide = async () => {
    await this.setState({ modalVisible: false })
  };

  // life cycle
  initData = async () => {
    await this.props.dispatch({type: 'loginModel/getLoginStatus'})
  };

  componentWillMount() {
    this.initData().then(()=>null)
  }

  render() {

    const renderLoginTip = () => {
      console.log(this.props.isLogin, this.props.username, this.props.user_role);
      if (this.props.isLogin === true) {
        return (
          <div>
            <Alert message={
              <div>
                <div style={{margin: '0 0 5px 0'}}>{this.props.username + "已登陆，用户类型：" + this.props.user_role}</div>
                <div>
                  您可以：
                  <span className={styles.logout_btn} onClick={this.linkToPage}>进入首页</span>
                  ，或：
                  <span className={styles.logout_btn} onClick={this.logoutBtn}>注销登陆</span>
                </div>
              </div>
            }
                   type="success"
                   className={styles.login_status_tip}/>
          </div>
        )
      } else {
        return <div className={styles.login_status_tip}>-</div>
      }
    };

    const renderLoginForm = () => {
      return (
        <Form
          name="normal_login"
          className={styles.login_form}
          onFinish={this.onSubmit}
        >
          <Form.Item
            name="username"
            rules={[
              {
                required: true,
                message: '输入用户名',
              },
            ]}
          >
            <Input prefix={<UserOutlined className="site-form-item-icon"/>} placeholder="用户名"/>
          </Form.Item>
          <Form.Item
            name="password"
            rules={[
              {
                required: true,
                message: '输入密码',
              },
            ]}
          >
            <Input prefix={<LockOutlined className="site-form-item-icon"/>} type="password" placeholder="密码"/>
          </Form.Item>
          <Form.Item>
            <Button type="primary" htmlType="submit" className={styles.login_form_button} icon={<LoginOutlined/>} loading={this.state.isLoading}>登录</Button>
            <Button type="link" onClick={this.modalVisible}>注册账号</Button>
          </Form.Item>
        </Form>
      )
    };

    return (
      <div>
        <div className={styles.flex_column_wrapper}>
          <span className={styles.welcome_text}>登陆家庭媒体娱乐系统</span>
          {
            renderLoginTip()
          }
          {
            renderLoginForm()
          }
        </div>
        <RegisteredModal visible={this.state.modalVisible}
                         hide={this.modalHide}
                         dispatch={this.props.dispatch}
        />
      </div>
    )
  }
}

function mapStateToProps({ loginModel }) {
  const { isLogin, username, user_role } = loginModel;
  return { isLogin, username, user_role };
}

export default connect(mapStateToProps)(Login);
