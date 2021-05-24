import React from 'react';
import { connect } from 'umi';
import { Button, Input, Popconfirm, Table, message } from 'antd';
import Highlighter from 'react-highlight-words';
import { SearchOutlined } from '@ant-design/icons';
import moment from 'moment';
import style from './index.less';

class UserTable extends React.Component {
  constructor(props) {
    super(props);
    this.columns = [
      {
        title: '#',
        dataIndex: 'key',
        key: 'key',
        width: 55,
        render: text => <span>{text + 1}</span>,
      },
      {
        title: '用户名',
        dataIndex: 'username',
        key: 'username',
        ...this.getColumnSearchProps('username'),
        width: 220,
      },
      {
        title: '密码',
        dataIndex: 'password',
        key: 'password',
        width: 180,
        render: (text, record) => (
          this.state.editMode && this.state.editTarget.id === record.id ? <Input value={this.state.newPassword} onChange={e => {this.setState({newPassword: e.target.value})}} /> : text
        )
      },
      {
        title: '用户角色',
        dataIndex: 'user_role',
        key: 'user_role',
        width: 180
      },
      {
        title: '最后登陆时间',
        dataIndex: 'last_login',
        key: 'last_login',
        width: 300,
        render: text => moment(text).format('YYYY-MM-DD HH:mm:ss')
      },
      {
        title: '操作',
        key: 'action',
        width: 250,
        className: style.column_small_text,
        render: (record) => <div>
          {
            this.state.editMode && this.state.editTarget.id === record.id ? <Button type='link' onClick={this.postEdit}>确认修改</Button> : <Button type='link' onClick={this.onEdit.bind(this, record)}>修改账户</Button>
          }
          <Popconfirm title={`确定要删除该账户吗？该操作不可逆。`}
                      onConfirm={this.onDelete.bind(this, record)}
                      okText="确定"
                      okButtonProps={{ danger: true }}
                      cancelText="取消"
                      placement="rightBottom"
          >
            <Button type='link' style={{color: 'red'}}>删除账户</Button>
          </Popconfirm>
        </div>
      },
    ];
    this.state = {
      dataLoading: false,
      tableWidth: 'max-content',
      // 修改表格内信息
      editMode: false,
      editTarget: null,
      newPassword: '',
    };
  }

  // handle
  onDelete = record => {
    if (record.user_role === 'user') {
      this.props.dispatch({ type: 'loginModel/deleteUser', payload: {username: record.username} });
    } else {
      message.warning("无法删除管理员用户", 2);
    }
  };
  onEdit = (record) => {
    this.setState({editMode: true, editTarget: record, newPassword: record.password});
  };
  postEdit = async () => {
    const payload = { username: this.state.editTarget.username, password: this.state.newPassword };
    await this.props.dispatch({ type: 'loginModel/updateUser', payload: payload });
    this.setState({editMode: false, editTarget: null, newPassword: ''});
    await this.initData();
  };

  // table function
  getColumnSearchProps = dataIndex => ({
    filterDropdown: ({ setSelectedKeys, selectedKeys, confirm, clearFilters }) => (
      <div style={{ padding: 8 }}>
        <Input
          ref={node => {
            this.searchInput = node;
          }}
          placeholder={`搜索 ${dataIndex}`}
          value={selectedKeys[0]}
          onChange={e => setSelectedKeys(e.target.value ? [e.target.value] : [])}
          onPressEnter={() => this.handleSearch(selectedKeys, confirm, dataIndex)}
          style={{ width: 188, marginBottom: 8, display: 'block' }}
        />
        <Button
          type="primary"
          onClick={() => this.handleSearch(selectedKeys, confirm, dataIndex)}
          icon={<SearchOutlined/>}
          size="small"
          style={{ width: 90, marginRight: 8 }}
        >
          确定
        </Button>
        <Button onClick={() => this.handleReset(clearFilters)} size="small" style={{ width: 90 }}>
          清空键入
        </Button>
      </div>
    ),
    // 配置表格上filter按钮的样式
    filterIcon: filtered => <SearchOutlined style={{ color: filtered ? '#1890ff' : undefined }}/>,
    // 配置搜索规则，value传入
    onFilter: (value, record) =>
      record[dataIndex]
        ?.toString()
        .toLowerCase()
        .includes(value.toLowerCase()),
    onFilterDropdownVisibleChange: visible => {
      if (visible) {
        setTimeout(() => this.searchInput.select());
      }
    },
    render: text =>
      this.state.searchedColumn === dataIndex ? (
        <Highlighter
          highlightStyle={{ backgroundColor: '#ffc069', padding: 0 }}
          searchWords={[this.state.searchText]}
          autoEscape
          textToHighlight={text.toString()}
        />
      ) : (
        text
      ),
  });
  handleSearch = (selectedKeys, confirm, dataIndex) => {
    confirm();
    this.setState({
      searchText: selectedKeys[0],
      searchedColumn: dataIndex,
    });
  };
  handleReset = clearFilters => {
    clearFilters();
    this.setState({ searchText: '' });
  };

  initData = async () => {
    await this.setState({ dataLoading: true });
    await this.props.dispatch({ type: 'loginModel/getAllUser' });
    await this.setState({ dataLoading: false });
  };

  componentWillMount() {
    this.initData().then(() => null);
  }


  render() {

    const renderTable = () => {
      return (
        <div>
          <Table columns={this.columns}
                 dataSource={this.props.allUser}
                 scroll={{ x: this.state.tableWidth }}
                 loading={this.state.dataLoading}
                 bordered
          />
        </div>
      );
    };

    return (
      <div>
        {
          renderTable()
        }
      </div>
    );
  }
}

function mapStateToProps(state) {
  const { username, user_role, last_login, allUser } = state.loginModel;
  console.log(allUser);
  return { username, user_role, last_login, allUser };
}

export default connect(mapStateToProps)(UserTable);
