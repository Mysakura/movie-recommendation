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
                        @search="showSelectCinemaDrawer"
                >
                    <template v-slot:enterButton>
                        <a-button type="primary">选择</a-button>
                    </template>
                </a-input-search>
            </a-form-item>

            <a-form-item>
                <a-button icon="plus" type="danger" @click="" class="mb-15 mr-15">添加</a-button>
                <a-popover
                        title="座位信息"
                        trigger="click"
                        v-model="common.seatCreateVisible"
                >
                    <template v-slot:content>
                        <a-form :form="formForCreateSeat" layout="vertical" hideRequiredMark style="text-align: center">
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
                                    <a href="javascript:;" @click="createSeats">Create</a>
                                </a-col>
                            </a-row>
                        </a-form>
                    </template>
                    <a-button type="primary">座位</a-button>
                </a-popover>
            </a-form-item>
        </a-form>
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
        <a-card title="座位调整">
            <div style="text-align: center;overflow-y: hidden;">
                <h2>金逸上海张江店 3号厅</h2>
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
                seatCreateVisible: false,
                selectCinemaVisible: false,
                rowNumber: 10,
                colNumber: 10,
            },
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
            submitData: {
                selectCinema: null
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
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
            createSeats:function (e) {
                let me = this;
                e.preventDefault()
                me.formForCreateSeat.validateFields((err, values) => {
                    if (!err) {
                        me.common.rowNumber = values.rowNumber;
                        me.common.colNumber = values.colNumber;
                        me.common.seatCreateVisible = false;
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
                console.log(this.submitData.selectCinema)
            },
            handleAddSubmit  (e) {
                e.preventDefault()
                this.formForCreateSeat.validateFields((err, values) => {
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
    /*未用*/
    .seat-title{
        color: #fff;
        background: linear-gradient(250deg, rgb(57, 207, 214), rgb(211, 231, 45));
        padding: 5px 16px 4px;
    }
</style>