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
                title="添加影院"
                :width="720"
                @close="onClose"
                :visible="common.visible"
                :wrapStyle="{height: 'calc(100% - 108px)',overflow: 'auto',paddingBottom: '108px'}"
        >
            <a-form :form="formForAdd" layout="vertical" hideRequiredMark>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="名称">
                            <a-input
                                    v-decorator="['name', {
                                      rules: [{ required: true, message: '请输入影院名称' }]
                                    }]"
                                    placeholder="请输入影院名称"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="联系电话">
                            <!--addonBefore="http://"-->
                            <!--addonAfter=".com"-->
                            <a-input
                                    v-decorator="['phone', {
                                      rules: [{ required: true, message: '请输入联系电话' }]
                                    }]"
                                    style="width: 100%"
                                    placeholder="请输入联系电话"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="影院地址">
                            <a-input
                                    v-decorator="['address', {
                                      rules: [{ required: true, message: '请输入地址' }]
                                    }]"
                                    placeholder="请输入地址"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="营业开始">
                            <a-time-picker
                                    v-decorator="['openBeginTime', {
                                      rules: [{ required: true, message: '请选择开始时间' }]
                                    }]"
                                    style="width: 100%"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="营业结束">
                            <a-time-picker
                                    v-decorator="['openEndTime', {
                                      rules: [{ required: true, message: '请选择结束时间' }]
                                    }]"
                                    style="width: 100%"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="24">
                        <a-form-item label="影院介绍">
                            <a-textarea
                                    v-decorator="['description', {
                                      rules: [{ required: true, message: '请填写影院介绍' }]
                                    }]"
                                    :rows="4"
                                    placeholder="请填写影院介绍"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
                <a-row :gutter="16">
                    <a-col :span="12">
                        <a-form-item label="经度">
                            <a-input
                                    v-decorator="['longitude', {
                                      rules: [{ required: true, message: 'Please choose the approver' }]
                                    }]"
                            />
                        </a-form-item>
                    </a-col>
                    <a-col :span="12">
                        <a-form-item label="纬度">
                            <a-input
                                    v-decorator="['latitude', {
                                      rules: [{ required: true, message: 'Please choose the dateTime' }]
                                    }]"
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <simple-map :map="mapForAdd" @select-location="selectLocation"></simple-map>
            <div class="drawer-btn">
                <a-button
                        :style="{marginRight: '8px'}"
                        @click="onClose"
                >
                    Cancel
                </a-button>
                <a-button @click="handleAddSubmit" type="primary">Submit</a-button>
            </div>
        </a-drawer>
        <a-drawer
                title="影院位置"
                :width="720"
                @close="onMapClose"
                :visible="common.mapVisible"
                :wrapStyle="{height: 'calc(100% - 108px)',overflow: 'auto',paddingBottom: '108px'}"
        >
            <simple-map :map="mapForLook"></simple-map>
            <div class="drawer-btn">
                <a-button @click="onMapClose" type="primary">OK</a-button>
            </div>
        </a-drawer>
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:name="text">
                <a href="javascript:;">{{text}}</a>
            </template>

            <template v-slot:address="text">
                <a href="javascript:;" @click="showMapDrawer">{{text}}</a>
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
    import SimpleMap from "../components/SimpleMap";

    export default {
        components: {SimpleMap},
        name: "cinema-list",
        data: () => ({
            common: {
                visible: false,
                mapVisible: false,
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    },{
                        title: '影院',
                        dataIndex: 'name',
                        key: 'name',
                        scopedSlots: { customRender: 'name' },
                    }, {
                        title: '营业时间',
                        dataIndex: 'openTime',
                        key: 'openTime',
                        scopedSlots: { customRender: 'openTime' },
                    }, {
                        title: '地址',
                        dataIndex: 'address',
                        key: 'address',
                        scopedSlots: { customRender: 'address' },
                    }, {
                        title: '电话',
                        dataIndex: 'phone',
                        key: 'phone',
                        scopedSlots: { customRender: 'phone' },
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
            mapForAdd:{
                center: {lng: 121.4472540000, lat: 31.3236200000},
                zoom: 3,
                show: true,
                dragging: true,
                location: '北京',
                keyword: '百度',
                // 查看或者选点
                isAdd: true
            },
            mapForLook:{
                center: {lng: 121.4472540000, lat: 31.3236200000},
                zoom: 17,
                show: true,
                dragging: false,
                location: '',
                keyword: '',
                // 查看或者选点
                isAdd: false
            },
            submitData: {
                lng: null,
                lat: null
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    name: '上海宝山万达广场店',
                    openTime: '9:00-1:00',
                    address: '上海市宝山区一二八纪念路936号5楼（万达广场2号门 直达电梯可到）',
                    phone: '021-31150880-810',
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
            },
            showMapDrawer() {
                this.common.mapVisible = true
            },
            onMapClose() {
                this.common.mapVisible = false
            },
            selectLocation: function (e) {
                this.formForAdd.setFieldsValue({
                    longitude: e.lng,
                    latitude: e.lat,
                })
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