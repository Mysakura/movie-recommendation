<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="新闻标题">
                <a-input v-decorator="['name',{}]">
                    <a-icon
                            slot="prefix"
                            type="bulb"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
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
                title="添加新闻"
                width="70%"
                @close="onClose"
                :visible="common.visible"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="标题">
                            <a-input
                                    v-decorator="['title', {
                                      rules: [{ required: true, message: 'Please enter user name' }]
                                    }]"
                                    placeholder="请输入标题"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="评论开关">
                            <a-switch checkedChildren="开" unCheckedChildren="关" defaultChecked @change='onCommentSwitchChange'/>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="关联电影">
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
                        <a-form-item label="关联明星">
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
                    <a-col :span="24">
                        <a-form-item label="摘要">
                            <a-textarea
                                    v-decorator="['description', {
                                      rules: [{ required: true, message: 'Please enter url description' }]
                                    }]"
                                    :rows="4"
                                    placeholder="请输入摘要"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="内容">
                            <simple-editor></simple-editor>
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <div class="drawer-btn">
                <a-button :style="{marginRight: '8px'}" @click="onClose">Cancel</a-button>
                <a-button @click="onClose" type="primary">保存</a-button>
            </div>
        </a-drawer>
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle" :scroll="{ x: 1500 }">
            <template v-slot:newsTitle="text">
                <a href="javascript:;">{{text}}</a>
            </template>
            <template v-slot:movie="movie">
                <a href="javascript:;">{{movie.name}}</a>
            </template>
            <template v-slot:star="star">
                <a href="javascript:;">{{star.name}}</a>
            </template>

            <template v-slot:status="status">
                <a-tag v-if="status == '发布'" color="blue" :key="status">{{status}}</a-tag>
                <a-tag v-else color="red" :key="status">{{status}}</a-tag>
            </template>
            <template v-slot:allowComment="allowComment">
                <a-tag v-if="allowComment == '开启'" color="blue" :key="allowComment">{{allowComment}}</a-tag>
                <a-tag v-else color="red" :key="allowComment">{{allowComment}}</a-tag>
            </template>
            <template v-slot:deleteFlag="deleteFlag">
                <a-tag v-if="deleteFlag == '正常'" color="blue" :key="deleteFlag">{{deleteFlag}}</a-tag>
                <a-tag v-else color="red" :key="deleteFlag">{{deleteFlag}}</a-tag>
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
    import SimpleEditor from "../components/SimpleEditor";

    export default {
        components: {SimpleEditor},
        name: "news-list",
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
                        title: '新闻标题',
                        dataIndex: 'title',
                        key: 'title',
                        scopedSlots: { customRender: 'newsTitle' },
                        width: 200
                    }, {
                        title: '关联电影',
                        dataIndex: 'movie',
                        key: 'movie',
                        scopedSlots: { customRender: 'movie' },
                        width: 150
                    }, {
                        title: '关联明星',
                        dataIndex: 'star',
                        key: 'star',
                        scopedSlots: { customRender: 'star' },
                        width: 150
                    }, {
                        title: '摘要',
                        dataIndex: 'digest',
                        key: 'digest',
                        scopedSlots: { customRender: 'digest' },
                        width: 300
                    }, {
                        title: '允许评论',
                        dataIndex: 'allowComment',
                        key: 'allowComment',
                        scopedSlots: { customRender: 'allowComment' },
                    }, {
                        title: '发布状态',
                        dataIndex: 'status',
                        key: 'status',
                        scopedSlots: { customRender: 'status' },
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
                        width: 150
                    }, {
                        title: '删除状态',
                        dataIndex: 'deleteFlag',
                        key: 'deleteFlag',
                        scopedSlots: { customRender: 'deleteFlag' },
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
                    title: '《阿丽塔》内地公映延长一个月 秘钥延期至4月21日 内地票房破8亿远超北美',
                    movie: {
                        id: 1,
                        name: '阿丽塔：战斗天使'
                    },
                    star: {
                        id: 1,
                        name: '罗莎·萨拉扎尔'
                    },
                    digest: '内地上映两周的《阿丽塔：战斗天使》累计票房已经突破8亿大关。今日，片方宣布影片密钥将延期至4月21日，延长一个月电影放映时间。',
                    allowComment: '开启',
                    status: '发布',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    deleteFlag: '正常'
                }, {
                    key: '2',
                    id: '2',
                    title: '《美少女特攻队》原声受捧 视觉听觉双重享受',
                    movie: {
                        id: 1,
                        name: '美少女特攻队'
                    },
                    star: {
                        id: 1,
                        name: '艾米莉·布朗宁'
                    },
                    digest: '影片开场的一曲《Sweet Dreams》震撼人心　　好莱坞视觉系猛片《美少女特攻队》正在火热公映，除了震撼的视觉效果、激烈的动作场景和美少女们白花花',
                    allowComment: '开启',
                    status: '草稿',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    deleteFlag: '正常'
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
            onCommentSwitchChange(checked){
                console.log(`a-switch to ${checked}`);
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
            }
        }
    }
</script>

<style scoped>
    .drawer-btn{
        position: absolute;
        left: 0px;
        bottom: 0px;
        width: 100%;
        border-top: 1px solid rgb(233, 233, 233);
        padding: 10px 16px;
        background: rgb(255, 255, 255);
        text-align: right;
    }
</style>