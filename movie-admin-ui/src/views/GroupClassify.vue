<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="分类名称">
                <a-input v-decorator="['classifyName',{}]">
                    <a-icon
                            slot="prefix"
                            type="appstore"
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
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:classifyName="text">
                <a-tag color="green" :key="text">{{text}}</a-tag>
            </template>
            <template v-slot:status="status">
                <a-tag v-if="status == '正常'" color="blue" :key="status">{{status}}</a-tag>
                <a-tag v-else color="red" :key="status">{{status}}</a-tag>
            </template>
            <template v-slot:createUser="text">
                <a href="javascript:;">{{text}}</a>
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
        name: "group-classify",
        data: () => ({
            common: {
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    }, {
                        title: '分类名称',
                        dataIndex: 'classifyName',
                        key: 'classifyName',
                        scopedSlots: { customRender: 'classifyName' },
                        width: 150
                    }, {
                        title: '创建时间',
                        dataIndex: 'createTime',
                        key: 'createTime',
                        scopedSlots: { customRender: 'createTime' },
                        width: 200
                    }, {
                        title: '创建人',
                        dataIndex: 'createUser',
                        key: 'createUser',
                        scopedSlots: { customRender: 'createUser' },
                        width: 150
                    }, {
                        title: '更新时间',
                        dataIndex: 'updateTime',
                        key: 'updateTime',
                        scopedSlots: { customRender: 'updateTime' },
                        width: 200
                    }, {
                        title: '更新人',
                        dataIndex: 'updateUser',
                        key: 'updateUser',
                        scopedSlots: { customRender: 'updateUser' },
                        width: 150
                    }, {
                        title: '状态',
                        dataIndex: 'status',
                        key: 'status',
                        scopedSlots: { customRender: 'status' },
                        width: 100
                    }, {
                        title: '操作',
                        key: 'action',
                        dataIndex: 'action',
                        scopedSlots: { customRender: 'action' }
                    }
                ]
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    classifyName: '电影电视',
                    createUser: '午夜快车',
                    updateUser: '午夜快车',
                    createTime: '2019-07-23 11:37',
                    updateTime: '2019-07-23 11:37',
                    status: '正常'
                }, {
                    key: '2',
                    id: '2',
                    classifyName: '生活时尚',
                    createUser: '客星探',
                    updateUser: '客星探',
                    createTime: '2019-07-23 11:37',
                    updateTime: '2019-07-23 11:37',
                    status: '删除'
                }, {
                    key: '3',
                    id: '3',
                    classifyName: '文化艺术',
                    createUser: '狼790952',
                    updateUser: '狼790952',
                    createTime: '2019-07-23 11:37',
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
            pageSize(val) {
                console.log('pageSize', val);
            },
            current(val) {
                console.log('current', val);
            }
        },
        mounted: function() {

        },
        methods: {
            onShowSizeChange(current, pageSize) {
                console.log(current, pageSize);
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
        }
    }
</script>

<style scoped>

</style>