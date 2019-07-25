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
            <a-form-item>
                <a-button
                        type="primary"
                        html-type="submit"
                        class="mr-15"
                >
                    查询
                </a-button>
            </a-form-item>
        </a-form>
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
                <a v-for="a in actor" href="javascript:;">{{a.name}}</a>
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
            ]
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            }
        },
        watch: {
            //
        },
        mounted: function() {

        },
        methods: {
            // Only show error after a field is touched.
            handleSubmit  (e) {
                e.preventDefault()
                this.form.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                    }
                });

            },
        }
    }
</script>

<style scoped>

</style>