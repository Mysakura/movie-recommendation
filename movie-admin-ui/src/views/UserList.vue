<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="用户名">
                <a-input id="userName" v-decorator="['userName',{}]">
                    <a-icon
                            slot="prefix"
                            type="user"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item label="角色">
                <a-select v-decorator="['role',{initialValue: '9'}]">
                    <a-select-option value="9">
                        全部
                    </a-select-option>
                    <a-select-option value="1">
                        管理员
                    </a-select-option>
                    <a-select-option value="2">
                        用户
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item label="状态">
                <a-select v-decorator="['deleteFlag',{initialValue: '9'}]">
                    <a-select-option value="9">
                        全部
                    </a-select-option>
                    <a-select-option value="0">
                        正常
                    </a-select-option>
                    <a-select-option value="1">
                        删除
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item>
                <a-button
                        type="primary"
                        html-type="submit"
                        class="mr-15"
                >
                    查询
                </a-button>
                <a-button icon="plus" type="primary" @click="showDrawer" class="mb-15">添加</a-button>
            </a-form-item>
        </a-form>
        <a-drawer
                title="Create a new account"
                :width="720"
                @close="onClose"
                :visible="common.visible"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="用户名">
                            <a-input
                                    v-decorator="['userName', {
                                      rules: [{ required: true, message: 'Please enter user name' }]
                                    }]"
                                    placeholder="Please enter user name"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="密码">
                            <a-input
                                    v-decorator="['password', {
                                      rules: [{ required: true, message: 'please enter password' }]
                                    }]"
                                    type="password"
                                    placeholder="please enter password"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="邮箱">
                            <a-input
                                    v-decorator="['email', {
                                      rules: [{ required: true, message: 'Please select an email' }]
                                    }]"
                                    placeholder="Please a-s an email"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="角色">
                            <a-select
                                    v-decorator="['role', {
                                      rules: [{ required: true, message: 'Please choose the role' }],
                                      initialValue: '2'
                                    }]"
                                    placeholder="Please choose the role"
                            >
                                <a-select-option value="1">管理员</a-select-option>
                                <a-select-option value="2">用户</a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="头像">
                            <a-upload
                                    :action="uploadPath"
                                    listType="picture-card"
                                    :fileList="upload.fileList"
                                    @preview="handleUploadPreview"
                                    @change="handleUploadChange"
                            >
                                <div v-if="upload.fileList.length < 1">
                                    <a-icon type="plus" />
                                    <div class="ant-upload-text">Upload</div>
                                </div>
                            </a-upload>
                            <a-modal :visible="upload.previewVisible" :footer="null" @cancel="handleUploadCancel">
                                <img alt="example" style="width: 100%" :src="upload.previewImage" />
                            </a-modal>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="签名">
                            <a-textarea
                                    v-decorator="['signature', {
                                      rules: [{ required: true, message: 'Please enter signature' }]
                                    }]"
                                    :rows="4"
                                    placeholder="please enter signature"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <div class="drawer-btn-wrap">
                <a-button
                        :style="{marginRight: '8px'}"
                        @click="onClose"
                >
                    Cancel
                </a-button>
                <a-button @click="onAddUser" type="primary">Submit</a-button>
            </div>
        </a-drawer>
        <!--:scroll="{ y: 140 }"-->
        <a-table bordered size="middle"
                :columns="common.columns"
                :dataSource="tableData.data"
                 :pagination="tableData.pagination"
                :loading="tableData.loading"
                @change="handleTableChange"
        >
            <template v-slot:userName="text">
                <a href="javascript:;">{{text}}</a>
            </template>

            <template v-slot:role="text">
                <a-tag v-if="text == '2'" color="blue">用户</a-tag>
                <a-tag v-else color="red">管理员</a-tag>
            </template>
            <template v-slot:deleteFlag="deleteFlag">
                <a-tag v-if="deleteFlag == 0" color="blue" :key="deleteFlag">正常</a-tag>
                <a-tag v-else color="red" :key="deleteFlag">删除</a-tag>
            </template>

            <template v-slot:action="text, record">
                <a href="javascript:;" :data-set="JSON.stringify(record)">Edit</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Delete</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Look Exp</a>
            </template>
        </a-table>
        <!--<a-pagination showSizeChanger :pageSize.sync="common.pageSize" @showSizeChange="onShowSizeChange" :total="500"-->
                      <!--v-model="common.current"/>-->
    </div>
</template>

<script>
    export default {
        name: "user-list",
        data: () => ({
            common: {
                // pageSize: 10,
                // current: 1,
                visible: false,
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    },{
                        title: '用户名',  // 表头名称
                        dataIndex: 'userName',
                        key: 'userName',
                        scopedSlots: { customRender: 'userName' },
                        width: 150
                    }, {
                        title: '创建时间',
                        dataIndex: 'createTime',
                        key: 'createTime',
                        scopedSlots: { customRender: 'createTime' },
                        width: 200
                    }, {
                        title: '更新时间',
                        dataIndex: 'updateTime',
                        key: 'updateTime',
                        scopedSlots: { customRender: 'updateTime' },
                        width: 200
                    }, {
                        title: '角色',
                        key: 'role',
                        dataIndex: 'role',
                        scopedSlots: { customRender: 'role' },
                        width: 100
                    }, {
                        title: '状态',
                        key: 'deleteFlag',
                        dataIndex: 'deleteFlag',
                        scopedSlots: { customRender: 'deleteFlag' },
                        width: 100
                    }, {
                        title: '操作',
                        key: 'action',
                        dataIndex: 'action',
                        scopedSlots: { customRender: 'action' },
                        // width: 250
                    }
                ]
            },
            upload: {
                previewVisible: false,
                previewImage: '',
                fileList: []
                // 上传返回数据格式
                // {
                //     "name": "xxx.png",
                //     "status": "done",
                //     "url": "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png",
                //     "thumbUrl": "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png"
                // }
            },
            tableData: {
                data: [],
                pagination: {},
                loading: false,
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            },formForAdd: function () {
                return this.$form.createForm(this)
            },uploadPath: function () {
                return this.$uploadHost + '/upload/img'
            }
        },
        watch: {
            // pageSize(val) {
            //     console.log('pageSize', val);
            // },
            // current(val) {
            //     console.log('current', val);
            // }
        },
        mounted: function() {
            this.fetch();
        },
        methods: {
            // 翻页触发
            handleTableChange (pagination, filters, sorter) {
                let me = this;
                console.log(pagination);
                const pager = { ...me.tableData.pagination };
                pager.current = pagination.current;
                me.tableData.pagination = pager;
                me.fetch({
                    pageSize: pagination.pageSize,
                    pageNo: pagination.current,
                    ...filters,
                });
            },
            // 向后台请求数据
            fetch (params = {}) {
                let me = this;
                console.log('params:', params);
                me.tableData.loading = true;
                me.$axios.post('/user/list',{
                    pageNo: 1,
                    pageSize: 10,
                    ...params
                })
                    .then((response) => {
                        let list = response.data.data.dataList;
                        console.log('----------',response.data)
                        list.forEach((i) => {
                            i.key = i.id;
                        })
                        console.log('results:', list);
                        const pagination = { ...me.tableData.pagination };
                        pagination.total = response.data.data.pageInfo.totalPage;
                        me.tableData.loading = false;
                        me.tableData.data = list;
                        me.tableData.pagination = pagination;
                    });
            },
            handleUploadCancel () {
                this.upload.previewVisible = false
            },
            handleUploadPreview (file) {
                this.upload.previewImage = file.url || file.thumbUrl
                this.upload.previewVisible = true
            },
            handleUploadChange ({ fileList }) {
                this.upload.fileList = fileList
            },
            // onShowSizeChange(current, pageSize) {
            //     console.log(current, pageSize);
            // },
            // Only show error after a field is touched.
            handleSubmit  (e) {
                e.preventDefault()
                this.form.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                    }
                });

            },
            showDrawer() {
                this.common.visible = true
            },
            onClose() {
                this.common.visible = false
            },
            // 添加用户
            onAddUser(e) {
                let me = this;
                e.preventDefault();
                me.formForAdd.validateFields((err, values) => {
                    if (!err) {
                        let imgInfo = me.upload.fileList[0].response;
                        values.photo = imgInfo.url;
                        console.log('Received values of form: ', values, imgInfo);

                        me.$axios.post('/user/add',values)
                            .then((data) => {
                                // 刷新页面
                                me.fetch();
                            });
                        me.common.visible = false
                    }
                });
            }
        }
    }
</script>

<style scoped>

</style>