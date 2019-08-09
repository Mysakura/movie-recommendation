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
                visible: false,
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