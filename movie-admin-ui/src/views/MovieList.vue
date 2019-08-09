<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="电影名称">
                <a-input v-decorator="['name',{}]">
                    <a-icon
                            slot="prefix"
                            type="video-camera"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item label="影片类型">
                <a-select
                        style="width: 200px"
                        @change="handleChange"
                        v-decorator="['type',{initialValue: 0}]"
                >
                    <a-select-option v-for="i in typeData" :key="i.id">
                        {{i.name}}
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item label="国家地区">
                <a-select
                        style="width: 200px"
                        @change="handleChange"
                        v-decorator="['region',{initialValue: 0}]"
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
                title="Create a new account"
                :width="720"
                @close="onClose"
                :visible="common.visible"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="Name">
                            <a-input
                                    v-decorator="['name', {
                  rules: [{ required: true, message: 'Please enter user name' }]
                }]"
                                    placeholder="Please enter user name"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="Url">
                            <a-input
                                    v-decorator="['url', {
                  rules: [{ required: true, message: 'please enter url' }]
                }]"
                                    style="width: 100%"
                                    addonBefore="http://"
                                    addonAfter=".com"
                                    placeholder="please enter url"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="Owner">
                            <a-select
                                    v-decorator="['owner', {
                  rules: [{ required: true, message: 'Please select an owner' }]
                }]"
                                    placeholder="Please a-s an owner"
                            >
                                <a-select-option value="xiao">Xiaoxiao Fu</a-select-option>
                                <a-select-option value="mao">Maomao Zhou</a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="Type">
                            <a-select
                                    v-decorator="['type', {
                  rules: [{ required: true, message: 'Please choose the type' }]
                }]"
                                    placeholder="Please choose the type"
                            >
                                <a-select-option value="private">Private</a-select-option>
                                <a-select-option value="public">Public</a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="Approver">
                            <a-select
                                    v-decorator="['approver', {
                  rules: [{ required: true, message: 'Please choose the approver' }]
                }]"
                                    placeholder="Please choose the approver"
                            >
                                <a-select-option value="jack">Jack Ma</a-select-option>
                                <a-select-option value="tom">Tom Liu</a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="DateTime">
                            <a-date-picker
                                    v-decorator="['dateTime', {
                  rules: [{ required: true, message: 'Please choose the dateTime' }]
                }]"
                                    style="width: 100%"
                                    :getPopupContainer="trigger => trigger.parentNode"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="Description">
                            <a-textarea
                                    v-decorator="['description', {
                  rules: [{ required: true, message: 'Please enter url description' }]
                }]"
                                    :rows="4"
                                    placeholder="please enter url description"
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
                <a-button @click="onClose" type="primary">Submit</a-button>
            </div>
        </a-drawer>
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle" :scroll="{ x: 1500 }">
            <template v-slot:name="text">
                <a href="javascript:;">{{text}}</a>
            </template>
            <template v-slot:director="director">
                <a href="javascript:;">{{director.name}}</a>
            </template>
            <template v-slot:writer="writer">
                <a href="javascript:;">{{writer.name}}</a>
            </template>
            <template v-slot:actor="actor">
                <template v-for="a in actor">
                    <a href="javascript:;">{{a.name}}</a>
                    <a-divider type="vertical"/>
                </template>
            </template>
            <template v-slot:regin="regin">
                <a href="javascript:;">{{regin.name}}</a>
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
        name: "movie-list",
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
                        title: '电影名',
                        dataIndex: 'name',
                        key: 'name',
                        scopedSlots: { customRender: 'name' },
                    }, {
                        title: '导演',
                        dataIndex: 'director',
                        key: 'director',
                        scopedSlots: { customRender: 'director' },
                    }, {
                        title: '编剧',
                        dataIndex: 'writer',
                        key: 'writer',
                        scopedSlots: { customRender: 'writer' },
                    }, {
                        title: '主演',
                        dataIndex: 'actor',
                        key: 'actor',
                        scopedSlots: { customRender: 'actor' },
                        // width: 150
                    }, {
                        title: '地区',
                        dataIndex: 'regin',
                        key: 'regin',
                        scopedSlots: { customRender: 'regin' },
                    }, {
                        title: '片长',
                        dataIndex: 'runningTime',
                        key: 'runningTime',
                        scopedSlots: { customRender: 'runningTime' },
                    }, {
                        title: '更新人',
                        dataIndex: 'updateUser',
                        key: 'updateUser',
                        scopedSlots: { customRender: 'updateUser' },
                    }, {
                        title: '更新时间',
                        dataIndex: 'updateTime',
                        key: 'updateTime',
                        scopedSlots: { customRender: 'updateTime' },
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
                ]
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    name: '阿丽塔：战斗天使',
                    director: {
                        id: 1,
                        name: '罗伯特·罗德里格兹'
                    },
                    writer: {
                        id: 1,
                        name: '詹姆斯·卡梅隆'
                    },
                    actor: [
                        {
                            id: 1,
                            name: '罗莎·萨拉扎尔'
                        },{
                            id: 2,
                            name: '克里斯托弗·瓦尔兹'
                        }
                    ],
                    regin: {
                        id: 1,
                        name: '美国'
                    },
                    runningTime: '122分钟',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                }, {
                    key: '2',
                    id: '2',
                    name: '美少女特攻队',
                    director: {
                        id: 1,
                        name: '扎克·斯奈德'
                    },
                    writer: {
                        id: 1,
                        name: '扎克·施奈德'
                    },
                    actor: [
                        {
                            id: 1,
                            name: '艾米莉·布朗宁'
                        },{
                            id: 2,
                            name: '吉娜·马隆'
                        }
                    ],
                    regin: {
                        id: 1,
                        name: '美国'
                    },
                    runningTime: '110分钟， 127分钟(加长版)',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                }, {
                    key: '3',
                    id: '3',
                    name: '守法公民',
                    director: {
                        id: 1,
                        name: 'F·加里·格雷'
                    },
                    writer: {
                        id: 1,
                        name: '科特·维莫'
                    },
                    actor: [
                        {
                            id: 1,
                            name: '杰米·福克斯'
                        },{
                            id: 2,
                            name: '杰拉德·巴特勒'
                        }
                    ],
                    regin: {
                        id: 1,
                        name: '美国'
                    },
                    runningTime: '118分钟',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                }
            ],
            typeData:[
                {key:0,id:0,name:'全部类型'},
                {key:1,id:1,name:'动作',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:2,id:2,name:'冒险',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:3,id:3,name:'喜剧',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:4,id:4,name:'爱情',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:5,id:5,name:'战争',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:6,id:6,name:'恐怖',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:7,id:7,name:'犯罪',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:8,id:8,name:'悬疑',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:9,id:9,name:'惊悚',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:10,id:10,name:'武侠',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:11,id:11,name:'科幻',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:12,id:12,name:'音乐',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:13,id:13,name:'动画',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:14,id:14,name:'奇幻',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:15,id:15,name:'家庭',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:16,id:16,name:'剧情',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:17,id:17,name:'伦理',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:18,id:18,name:'记录',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:19,id:19,name:'历史',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:20,id:20,name:'青春',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:21,id:21,name:'励志',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'}
            ],
            regionData:[
                {key:0,id:0,name:'全部地区'},
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
            ],
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            },formForAdd: function () {
                return this.$form.createForm(this)
            },
        },
        watch: {
            //
        },
        mounted: function() {

        },
        methods: {
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
            }
        }
    }
</script>

<style scoped>

</style>