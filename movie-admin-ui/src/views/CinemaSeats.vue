<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="">
                <a-input-search
                        v-decorator="['name', {
                                      rules: [{ required: true, message: '请选择影院' }]
                                    }]"
                        placeholder="请选择影院"
                        style="width: 300px"
                        @search="showSelectCinemaDrawer"
                >
                    <template v-slot:enterButton>
                        <a-button type="primary">选择</a-button>
                    </template>
                </a-input-search>
            </a-form-item>
            <a-form-item v-if="submitData.selectCinema != null && submitData.selectCinema.seats != null && submitData.selectCinema.seats.length > 0">
                <a-select defaultValue="0" style="width: 150px;" @change="">
                    <a-select-option value="0">请选择影厅</a-select-option>
                    <a-select-option v-for="i in submitData.selectCinema.seats" value="i.id">{{i.videoHall}}</a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item>
                <a-popover
                        title="座位配置信息"
                        trigger="click"
                        v-model="common.seatSettingVisible"
                >
                    <template v-slot:content>
                        <a-form :form="formForSeatSetting" layout="vertical" hideRequiredMark style="text-align: center">
                            <a-row :gutter="16">
                                <a-col :span="12">
                                    <a-form-item label="行">
                                        <a-input-number
                                                v-decorator="['rowNumber', {
                                                  rules: [{ required: true, message: '请输入行数' }],
                                                  initialValue: 10
                                                }]"
                                                style="width: 100%"
                                                :min="1"
                                                :max="100"
                                        />
                                    </a-form-item>
                                </a-col>
                                <a-col :span="12">
                                    <a-form-item label="列">
                                        <a-input-number
                                                v-decorator="['colNumber', {
                                                  rules: [{ required: true, message: '请输入列数' }],
                                                  initialValue: 10
                                                }]"
                                                style="width: 100%"
                                                :min="1"
                                                :max="100"
                                        />
                                    </a-form-item>
                                </a-col>
                                <a-col :span="24">
                                    <a href="javascript:;" @click="createSeatsSetting">OK</a>
                                </a-col>
                            </a-row>
                        </a-form>
                    </template>
                    <a-button type="primary" icon="setting" class="mb-15 mr-15">配置</a-button>
                </a-popover>
                <a-popover
                        title="当前配置添加新的影厅座位信息"
                        trigger="click"
                        v-model="common.seatCreateVisible"
                >
                    <template v-slot:content>
                        <a-form :form="formForCreateSeat" layout="vertical" hideRequiredMark style="text-align: center">
                            <a-row :gutter="16">
                                <a-col :span="24">
                                    <a-form-item label="影厅名称">
                                        <a-input
                                                v-decorator="['videoHall', {
                                                  rules: [{ required: true, message: '请输入影厅名称' }]
                                                }]"
                                                style="width: 100%"
                                        />
                                    </a-form-item>
                                </a-col>
                                <a-col :span="24">
                                    <a-button icon="save" type="primary" @click="handleAddSubmit" class="mb-15 mr-15">保存</a-button>
                                </a-col>
                            </a-row>
                        </a-form>
                    </template>
                    <a-button icon="plus" type="danger" @click="" class="mb-15 mr-15">添加</a-button>
                </a-popover>

                <a-button icon="reload" type="danger" @click="" class="mb-15 mr-15">更新</a-button>
            </a-form-item>
        </a-form>
        <a-drawer
                title="影院搜索"
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
                                      rules: [{ required: true, message: '请输入影院名称' }]
                                    }]"
                                    placeholder="请输入影院名称查找"
                                    @search=""
                                    enterButton
                            />
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
            <a-radio-group @change="onSelectCinemaChange" v-model="submitData.selectCinema">
                <template v-for="i in cinemaData">
                    <a-radio class="radio-style" :value="i">{{i.name}}</a-radio>
                </template>
            </a-radio-group>
        </a-drawer>
        <a-card title="座位配置">
            <div style="text-align: center;overflow-y: hidden;">
                <h2>金逸上海张江店 3号厅【共260个座位】</h2>
                <p>新问题：一个电影院，有多个放映厅。相关操作的时候，没有配置放映厅，要先配置放映厅</p>
                <div v-for="i in common.rowNumber" style="white-space: nowrap;">
                    <div style="display: inline-block; width: 60px;">
                        <a-tag color="#c41a5f">{{i}}排</a-tag>
                    </div>
                    <a-button-group>
                        <!--<a-button type="primary">L</a-button>-->
                        <a-button v-for="i in common.colNumber" type="primary" icon="shop" size="small" class="mr-15 mb-15"></a-button>
                        <!--<a-button type="dashed">R</a-button>-->
                        <!--<a-button>N</a-button>-->
                    </a-button-group>
                </div>
            </div>
        </a-card>
    </div>
</template>

<script>
    export default {
        name: "cinema-seats",
        data: () => ({
            common: {
                seatSettingVisible: false,
                seatCreateVisible: false,
                selectCinemaVisible: false,
                rowNumber: 10,
                colNumber: 10,
            },
            cinemaData: [
                {
                    key: '1',
                    id: '1',
                    name: '上海宝山万达广场店',
                    seats: [
                        {
                            id: 1,
                            videoHall: '1号厅'
                        }
                    ]
                },{
                    key: '2',
                    id: '2',
                    name: '金逸上海张江店',
                    seats: [
                        {
                            id: 1,
                            videoHall: '1号厅'
                        }
                    ]
                },{
                    key: '3',
                    id: '3',
                    name: '金逸影城（上海中环杜比全景声店）',
                    seats: []
                },{
                    key: '4',
                    id: '4',
                    name: '海上明珠国际影城大宁店'
                }
            ],
            submitData: {
                selectCinema: null
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            },formForSeatSetting: function () {
                return this.$form.createForm(this)
            },formForCreateSeat: function () {
                return this.$form.createForm(this)
            },formForSelectCinema: function () {
                return this.$form.createForm(this)
            }
        },
        watch: {
            //
        },
        mounted: function() {

        },
        methods: {
            createSeatsSetting:function (e) {
                let me = this;
                e.preventDefault()
                me.formForSeatSetting.validateFields((err, values) => {
                    if (!err) {
                        me.common.rowNumber = values.rowNumber;
                        me.common.colNumber = values.colNumber;
                        me.common.seatSettingVisible = false;
                    }
                });
            },
            onCinemaSearch: function () {

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
            showSelectCinemaDrawer() {
                this.common.selectCinemaVisible = true
            },
            onSelectCinemaClose() {
                this.common.selectCinemaVisible = false
            },
            onSelectCinemaChange() {
                let data = this.submitData.selectCinema;
                console.log(data)
                this.form.setFieldsValue({name: data.name});
            },
            handleAddSubmit  (e) {
                e.preventDefault()
                this.formForCreateSeat.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                        this.common.seatCreateVisible = false;
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
    /*未用*/
    .seat-title{
        color: #fff;
        background: linear-gradient(250deg, rgb(57, 207, 214), rgb(211, 231, 45));
        padding: 5px 16px 4px;
    }
</style>