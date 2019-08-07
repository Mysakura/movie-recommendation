<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="影院名称">
                <a-input v-decorator="['name',{}]">
                    <a-icon
                            slot="prefix"
                            type="video-camera"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item label="城市">
                <a-select
                        style="width: 200px"
                        @change="handleChange"
                        v-decorator="['region',{initialValue: 0}]"
                >
                    <a-select-option v-for="i in provinceData" :key="i.id">
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
                title="添加影院场次"
                :width="720"
                @close="onClose"
                :visible="common.visible"
                :wrapStyle="{height: 'calc(100% - 108px)',overflow: 'auto',paddingBottom: '108px'}"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="影院">
                            <a-input-search
                                    v-decorator="['name', {
                                      rules: [{ required: true, message: '请选择影院' }]
                                    }]"
                                    placeholder="请选择影院"
                                    @search="showSelectCinemaDrawer"
                            >
                                <template v-slot:enterButton>
                                    <a-button type="primary">选择</a-button>
                                </template>
                            </a-input-search>
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="影厅">
                            <a-select
                                    v-decorator="['videoHall', {
                                      rules: [{ required: true, message: '请选择影厅' }],

                                    }]"
                                    placeholder="请选择影厅"
                                    @change="">
                                <a-select-option value="1">1号厅</a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="电影">
                            <a-input-search
                                    v-decorator="['movie', {
                                      rules: [{ required: true, message: '请选择电影' }]
                                    }]"
                                    placeholder="请选择电影"
                                    @search="showSelectMovieDrawer"
                            >
                                <template v-slot:enterButton>
                                    <a-button type="primary">选择</a-button>
                                </template>
                            </a-input-search>
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="日期">
                            <a-date-picker
                                    v-decorator="['date', {
                                      rules: [{ required: true, message: '请选择日期' }]
                                    }]"
                                    style="width: 100%"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="场次">
                            <a-time-picker
                                    format="h:mm a"
                                    v-decorator="['time', {
                                      rules: [{ required: true, message: '请选择场次' }]
                                    }]"
                                    style="width: 100%"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <div class="drawer-btn">
                <a-button
                        :style="{marginRight: '8px'}"
                        @click="onClose"
                >
                    Cancel
                </a-button>
                <a-button @click="handleAddSubmit" type="primary">Save</a-button>
            </div>
        </a-drawer>
        <a-drawer
                title="选择影院"
                :width="360"
                @close="onSelectCinemaClose"
                :visible="common.selectCinemaVisible"
                :wrapStyle="{height: 'calc(100% - 108px)',overflow: 'auto',paddingBottom: '108px'}"
        >
            <a-form :form="formForSelectCinema" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="名称">
                            <a-input-search
                                    v-decorator="['name', {
                                      rules: [{ required: true, message: '请选择影院' }]
                                    }]"
                                    placeholder="请选择影院"
                                    @search=""
                                    enterButton
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <a-radio-group @change="onSelectCinemaChange" v-model="submitData.selectCinema">
                <template v-for="i in cinemaData">
                    <a-radio class="radio-style" :value="i.id">{{i.name}}</a-radio>
                </template>
            </a-radio-group>
        </a-drawer>
        <a-drawer
                title="选择电影"
                :width="360"
                @close="onSelectMovieClose"
                :visible="common.selectMovieVisible"
                :wrapStyle="{height: 'calc(100% - 108px)',overflow: 'auto',paddingBottom: '108px'}"
        >
            <a-form :form="formForSelectMovie" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="名称">
                            <a-input-search
                                    v-decorator="['name', {
                                      rules: [{ required: true, message: '请选择电影' }]
                                    }]"
                                    placeholder="请选择电影"
                                    @search=""
                                    enterButton
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <a-radio-group @change="onSelectMovieChange" v-model="submitData.selectMovie">
                <template v-for="i in movieData">
                    <!--<a-radio class="radio-style" :value="i.id">-->
                        <!--<img :src="i.cover"/>-->
                        <!--<span>{{i.name}}</span>-->
                    <!--</a-radio>-->
                    <a-radio-button class="radio-style" :value="i.id">
                        <img :src="i.cover"/>
                        <span>{{i.name}}</span>
                    </a-radio-button>
                </template>
            </a-radio-group>
        </a-drawer>
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:cinema="cinema">
                <a href="javascript:;">{{cinema.name}}</a>
            </template>

            <template v-slot:movie="movie">
                <a href="javascript:;">{{movie.name}}</a>
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
        name: "cinema-shows",
        data: () => ({
            common: {
                visible: false,
                selectCinemaVisible: false,
                selectMovieVisible: false,
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    },{
                        title: '影院',
                        dataIndex: 'cinema',
                        key: 'cinema',
                        scopedSlots: { customRender: 'cinema' },
                    }, {
                        title: '电影',
                        dataIndex: 'movie',
                        key: 'movie',
                        scopedSlots: { customRender: 'movie' },
                    }, {
                        title: '场次',
                        dataIndex: 'showsNo',
                        key: 'showsNo',
                        scopedSlots: { customRender: 'showsNo' },
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
                ],
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    cinema: {
                        id: 1,
                        name: '上海宝山万达广场店'
                    },
                    movie: {
                        id: 1,
                        name: '哪吒之魔童降世'
                    },
                    showsNo: '8月5日  20:10',
                    updateUser: 'Admin',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                },
            ],
            provinceData:[
                {key:0,id:0,name:'全国'},
                {key:1,id:1,name:'北京',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:2,id:2,name:'上海',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:3,id:3,name:'广州',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:4,id:4,name:'深圳',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:5,id:5,name:'成都',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:6,id:6,name:'重庆',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:7,id:7,name:'天津',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:8,id:8,name:'郑州',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:9,id:9,name:'杭州',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'},
                {key:10,id:10,name:'西安',updateUser: 'Admin',updateTime: '2019-07-23 11:37',status: '正常'}
            ],
            cinemaData: [
                {
                    key: '1',
                    id: '1',
                    name: '上海宝山万达广场店'
                },{
                    key: '2',
                    id: '2',
                    name: '金逸上海张江店'
                },{
                    key: '3',
                    id: '3',
                    name: '金逸影城（上海中环杜比全景声店）'
                },{
                    key: '4',
                    id: '4',
                    name: '海上明珠国际影城大宁店'
                }
            ],
            movieData: [
                {
                    key: '1',
                    id: '1',
                    name: '哪吒之魔童降世',
                    cover: 'http://img5.mtime.cn/mt/2019/07/31/110048.94153693_270X360X4.jpg'
                },{
                    key: '2',
                    id: '2',
                    name: '扫毒2天地对决',
                    cover: 'http://img5.mtime.cn/mt/2019/07/01/091242.87940531_100X140X4.jpg'
                },{
                    key: '3',
                    id: '3',
                    name: '银河补习班',
                    cover: 'http://img5.mtime.cn/mt/2019/07/18/113302.96781520_100X140X4.jpg'
                },{
                    key: '4',
                    id: '4',
                    name: '狮子王',
                    cover: 'http://img5.mtime.cn/mt/2019/06/28/141445.67206086_100X140X4.jpg'
                }
            ],
            submitData: {
                selectCinema: null,
                selectMovie: null,
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            },formForAdd: function () {
                return this.$form.createForm(this)
            },formForSelectCinema: function () {
                return this.$form.createForm(this)
            },formForSelectMovie: function () {
                return this.$form.createForm(this)
            },
        },
        watch: {
            //
        },
        mounted: function() {

        },
        methods: {
            onCinemaSearch: function () {

            },
            onMovieSearch: function () {

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
            showSelectCinemaDrawer() {
                this.common.selectCinemaVisible = true
            },
            showSelectMovieDrawer() {
                this.common.selectMovieVisible = true
            },
            onClose() {
                this.common.visible = false
            },
            onSelectCinemaClose() {
                this.common.selectCinemaVisible = false
            },
            onSelectMovieClose() {
                this.common.selectMovieVisible = false
            },
            onSelectCinemaChange() {
                console.log(this.submitData.selectCinema)
            },
            onSelectMovieChange() {
                console.log(this.submitData.selectMovie)
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
    .radio-style{
        display: block;
        margin-bottom: 10px;
        padding: 8px;
        height: auto;
    }
    .radio-style img{
        width: 100px;
        margin-right: 5px;
    }
</style>