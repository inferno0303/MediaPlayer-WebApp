import React from 'react';
import { connect } from 'umi';
import { Button, Input, Popconfirm, Table, message } from 'antd';
import Highlighter from 'react-highlight-words';
import { SearchOutlined } from '@ant-design/icons';
import moment from 'moment';
import style from './index.less';

class MediaTable extends React.Component {
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
        title: '文件名',
        dataIndex: 'file_name',
        key: 'file_name',
        ...this.getColumnSearchProps('file_name'),
        width: 300,
      },
      {
        title: '文件路径',
        dataIndex: 'file_path',
        key: 'file_path',
        width: 300,
      },
      {
        title: '文件MD5',
        dataIndex: 'file_md5',
        key: 'file_md5',
        width: 180
      },
      {
        title: '标题',
        dataIndex: 'title',
        key: 'title',
        width: 300,
        ...this.getColumnSearchProps('title'),
        render: (text, record) => (
          this.state.editMode && this.state.editTarget.key === record.key ? <Input.TextArea rows={3} value={this.state.newTitle} onChange={e => this.setState({newTitle: e.target.value})} /> : text
        )
      },
      {
        title: '媒体类型',
        dataIndex: 'media_type',
        key: 'media_type',
        width: 120,
        filters: [
          {
            text: '音乐文件',
            value: '音频mp3',
          },
          {
            text: '视频文件',
            value: '视频mp4',
          },
        ],
        filterMultiple: false,
        onFilter: (value, record) => record?.media_type?.indexOf(value) === 0,
      },
      {
        title: '艺术家/作者',
        dataIndex: 'artist',
        key: 'artist',
        width: 180,
        render: (text, record) => (
          this.state.editMode && this.state.editTarget.id === record.id ? <Input.TextArea rows={3} value={this.state.newArtist} onChange={e => this.setState({newArtist: e.target.value})} /> : text
        )
      },
      {
        title: '风格',
        dataIndex: 'style',
        key: 'style',
        width: 180,
        render: (text, record) => (
          this.state.editMode && this.state.editTarget.id === record.id ? <Input.TextArea rows={3} value={this.state.newStyle} onChange={e => this.setState({newStyle: e.target.value})} /> : text
        )
      },
      {
        title: '添加时间',
        dataIndex: 'update_time',
        key: 'update_time',
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
            this.state.editMode && this.state.editTarget.id === record.id ? <Button type='link' onClick={this.postEdit}>确认修改</Button> : <Button type='link' onClick={this.onEdit.bind(this, record)}>修改信息</Button>
          }
          <Popconfirm title={`确定要从磁盘上删除该媒体吗？该操作不可逆。`}
                      onConfirm={this.onDelete.bind(this, record)}
                      okText="确定"
                      okButtonProps={{ danger: true }}
                      cancelText="取消"
                      placement="rightBottom"
          >
            <Button type='link' style={{color: 'red'}}>删除文件</Button>
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
      newTitle: '',
      newArtist: '',
      newStyle: '',
    };
  }

  // handle
  onDelete = async record => {
    await this.props.dispatch({ type: 'managerModel/deleteMedia', payload: {file_md5: record.file_md5} });
    await this.initData()
  };

  onEdit = (record) => {
    this.setState({editMode: true, editTarget: record, newTitle: record.title, newArtist: record.artist, newStyle: record.style});
  };
  postEdit = async () => {
    const payload = { file_md5: this.state.editTarget.file_md5, title: this.state.newTitle, artist: this.state.newArtist, style: this.state.newStyle };
    await this.props.dispatch({ type: 'playingModel/updateMediaAllInfo', payload: payload });
    this.setState({editMode: false, editTarget: null, newTitle: '', newArtist: '', newStyle: ''});
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
    await this.props.dispatch({ type: 'globalModel/getMediaLibrary' });
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
                 dataSource={this.props.mediaLibrary}
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
  const { mediaLibrary } = state.globalModel;
  return { mediaLibrary };
}

export default connect(mapStateToProps)(MediaTable);
