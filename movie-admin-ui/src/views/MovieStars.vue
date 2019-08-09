<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="明星">
                <a-input v-decorator="['name',{}]">
                    <a-icon
                            slot="prefix"
                            type="user"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item label="国家地区">
                <a-select
                        style="width: 200px"
                        @change="handleChange"
                        v-decorator="['region',{initialValue: 1}]"
                >
                    <a-select-option v-for="i in regionData" :key="i.id">
                        {{i.name}}
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item>
                <a-button
                        icon="search"
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
                title="添加明星信息"
                :width="720"
                @close="onClose"
                :visible="common.visible"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="中文名">
                            <a-input
                                    v-decorator="['name', {
                                      rules: [{ required: true, message: '请输入中文名' }]
                                    }]"
                                    placeholder="请输入中文名"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="英文名">
                            <a-input
                                    v-decorator="['enName', {
                                      rules: [{ required: true, message: '请输入英文名' }]
                                    }]"
                                    placeholder="请输入英文名"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="职业">
                            <a-input
                                    v-decorator="['profession', {
                                      rules: [{ required: true, message: '请输入职业（多个用 | 分隔）' }]
                                    }]"
                                    placeholder="请输入职业"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="生日">
                            <a-date-picker
                                    v-decorator="['date', {
                                      rules: [{ required: true, message: '请选择生日日期' }]
                                    }]"
                                    style="width: 100%"
                                    placeholder="请选择生日日期"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="身高">
                            <a-input-number
                                    v-decorator="['height', {
                                        rules: [{ required: true, message: '请输入身高' }]
                                    }]"
                                    :min="1"
                                    :max="300"
                                    :formatter="value => `${value}cm`"
                                    :parser="value => value.replace('cm', '')"
                                    placeholder="请输入身高"
                                    style="width: 100%"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="国籍">
                            <a-select
                                    @change="handleChange"
                                    v-decorator="['region',{
                                        rules: [{ required: true, message: '请选择国籍' }],
                                        initialValue: 1
                                    }]"
                                    placeholder="请选择国籍"
                            >
                                <a-select-option v-for="i in regionData" :key="i.id">
                                    {{i.name}}
                                </a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="明星照片">
                            <a-upload
                                    action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
                                    listType="picture-card"
                                    :fileList="upload.fileList"
                                    @preview="handleUploadPreview"
                                    @change="handleUploadChange"
                            >
                                <div v-if="upload.fileList.length < 5">
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
                        <a-form-item label="介绍">
                            <a-textarea
                                    v-decorator="['introduce', {
                                      rules: [{ required: true, message: '请填写明星介绍' }]
                                    }]"
                                    :rows="4"
                                    placeholder="请填写明星介绍"
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
                <a-button @click="handleAddSubmit" type="primary">Save</a-button>
            </div>
        </a-drawer>
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:name="text, record">
                <img :src="record.photo" width="100px;"/>
                <a href="javascript:;">{{text}}</a>
            </template>
            <template v-slot:enName="text">
                <a href="javascript:;">{{text}}</a>
            </template>

            <template v-slot:height="height">
                <span>{{height}}cm</span>
            </template>

            <template v-slot:status="status">
                <a-tag v-if="status == '正常'" color="blue" :key="status">{{status}}</a-tag>
                <a-tag v-else color="red" :key="status">{{status}}</a-tag>
            </template>
            <template v-slot:updateUser="text">
                <a href="javascript:;">{{text}}</a>
            </template>
            <template v-slot:action="text, record">
                <a href="javascript:;" :data-set="JSON.stringify(record)">Edit</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Delete</a>
            </template>
        </a-table>
    </div>
</template>

<script>
    export default {
        name: "movie-stars",
        data: () => ({
            common: {
                visible: false,
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    },{
                        title: '中文名',
                        dataIndex: 'name',
                        key: 'name',
                        scopedSlots: { customRender: 'name' },
                        width: 120
                    }, {
                        title: '英文名',
                        dataIndex: 'enName',
                        key: 'enName',
                        scopedSlots: { customRender: 'enName' },
                        width: 120
                    }, {
                        title: '生日',
                        dataIndex: 'birthday',
                        key: 'birthday',
                        scopedSlots: { customRender: 'birthday' },
                        width: 120
                    }, {
                        title: '国籍',
                        dataIndex: 'region',
                        key: 'region',
                        scopedSlots: { customRender: 'region' },
                        width: 80
                    }, {
                        title: '身高',
                        dataIndex: 'height',
                        key: 'height',
                        scopedSlots: { customRender: 'height' },
                        width: 50
                    }, {
                        title: '介绍',
                        dataIndex: 'introduce',
                        key: 'introduce',
                        scopedSlots: { customRender: 'introduce' },
                    }, {
                        title: '更新人',
                        dataIndex: 'updateUser',
                        key: 'updateUser',
                        scopedSlots: { customRender: 'updateUser' },
                        width: 100
                    }, {
                        title: '更新时间',
                        dataIndex: 'updateTime',
                        key: 'updateTime',
                        scopedSlots: { customRender: 'updateTime' },
                        width: 120
                    }, {
                        title: '状态',
                        dataIndex: 'status',
                        key: 'status',
                        scopedSlots: { customRender: 'status' },
                    }, {
                        title: '操作',
                        key: 'action',
                        dataIndex: 'action',
                        scopedSlots: { customRender: 'action' },
                        fixed: 'right',
                        width: 100
                    }
                ],
            },
            upload: {
                previewVisible: false,
                previewImage: '',
                fileList: [{
                    uid: '-1',
                    name: 'xxx.png',
                    status: 'done',
                    url: 'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
                    // 上传返回数据格式
                    // {
                    //     "name": "xxx.png",
                    //     "status": "done",
                    //     "url": "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png",
                    //     "thumbUrl": "https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png"
                    // }
                }]
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    name: '罗莎·萨拉扎尔',
                    enName: 'Rosa Salazar',
                    introduce: '罗莎·萨拉扎尔（Rosa Salazar），1985年7月16日出生于加拿大不列颠哥伦比亚省，加拿大影视女演员。\n' +
                    '2010年，因参演家庭剧《为人父母》而正式出道。2013年，出演剧情电影《詹姆士》。2015年，出演的科幻电影《移动迷宫2》首映。\n' +
                    '2017年，主演的犯罪喜剧电影《加州公路巡警》上映。2018年，出演的科幻悬疑动作电影《移动迷宫3：死亡解药》上映。\n' +
                    '2019年，她主演的科幻动作电影《阿丽塔：战斗天使》在中国内地上映，她也因此被更多的中国观众所认识。',
                    profession: '演员',
                    birthday: '1985年7月16日',
                    region: '加拿大',
                    height: 163,
                    photo: 'http://img5.mtime.cn/ph/2017/12/09/112026.94266823_290X440X4.jpg',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                },
            ],
            regionData:[
                {key:1,id:1,name:'中国大陆',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:2,id:2,name:'美国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:3,id:3,name:'香港',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:4,id:4,name:'台湾',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:5,id:5,name:'日本',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:6,id:6,name:'韩国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:7,id:7,name:'英国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:8,id:8,name:'法国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:9,id:9,name:'德国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:10,id:10,name:'意大利',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:11,id:11,name:'西班牙',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:12,id:12,name:'印度',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:13,id:13,name:'泰国',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:14,id:14,name:'俄罗斯',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:15,id:15,name:'伊朗',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:16,id:16,name:'加拿大',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:17,id:17,name:'澳大利亚',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:18,id:18,name:'爱尔兰',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:19,id:19,name:'瑞典',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:20,id:20,name:'巴西',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:21,id:21,name:'丹麦',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'}
            ]
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            },formForAdd: function () {
                return this.$form.createForm(this)
            }
        },
        watch: {
            //
        },
        mounted: function() {

        },
        methods: {
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
            handleChange(value) {
                console.log(`Selected: ${value}`);
            },
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
            handleAddSubmit  (e) {
                e.preventDefault()
                this.formForAdd.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                        // 格式化成字符串
                        console.log('time: ', values.openBeginTime.format('HH:mm:ss'));
                    }
                });
            }
        }
    }
</script>

<style scoped>

</style>