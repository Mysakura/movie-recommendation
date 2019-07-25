<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="用户名">
                <a-input id="userName" v-decorator="['userName',{}]">
                    <a-icon
                            slot="prefix"
                            type="user"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
            </a-form-item>
            <a-form-item label="角色">
                <a-select v-decorator="['role',{initialValue: '9'}]">
                    <a-select-option value="9">
                        全部
                    </a-select-option>
                    <a-select-option value="1">
                        管理员
                    </a-select-option>
                    <a-select-option value="2">
                        用户
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item label="状态">
                <a-select v-decorator="['deleteFlag',{initialValue: '9'}]">
                    <a-select-option value="9">
                        全部
                    </a-select-option>
                    <a-select-option value="0">
                        正常
                    </a-select-option>
                    <a-select-option value="1">
                        删除
                    </a-select-option>
                </a-select>
            </a-form-item>
            <a-form-item>
                <a-button
                        type="primary"
                        html-type="submit"
                >
                    查询
                </a-button>
            </a-form-item>
        </a-form>
        <!--:scroll="{ y: 140 }"-->
        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:userName="text">
                <a href="javascript:;">{{text}}</a>
            </template>

            <template v-slot:role="text">
                <a-tag v-if="text == '用户'" color="blue">{{text}}</a-tag>
                <a-tag v-else color="red">{{text}}</a-tag>
            </template>
            <template v-slot:status="status">
                <a-tag v-if="status == '正常'" color="blue" :key="status">{{status}}</a-tag>
                <a-tag v-else color="red" :key="status">{{status}}</a-tag>
            </template>

            <template v-slot:action="text, record">
                <a href="javascript:;" :data-set="JSON.stringify(record)">Edit</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Delete</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Look Exp</a>
            </template>
        </a-table>
        <!--<a-pagination showSizeChanger :pageSize.sync="common.pageSize" @showSizeChange="onShowSizeChange" :total="500"-->
                      <!--v-model="common.current"/>-->
    </div>
</template>

<script>
    export default {
        name: "user-list",
        data: () => ({
            common: {
                // pageSize: 10,
                // current: 1,
                columns: [
                    {
                        title: 'ID',  // 表头名称
                        dataIndex: 'id',
                        key: 'id',
                        scopedSlots: { customRender: 'id' },
                        width: 50
                    },{
                        title: '用户名',  // 表头名称
                        dataIndex: 'userName',
                        key: 'userName',
                        scopedSlots: { customRender: 'userName' },
                        width: 150
                    }, {
                        title: '创建时间',
                        dataIndex: 'age',
                        key: 'age',
                        scopedSlots: { customRender: 'age' },
                        width: 200
                    }, {
                        title: '更新时间',
                        dataIndex: 'address',
                        key: 'address',
                        scopedSlots: { customRender: 'address' },
                        width: 200
                    }, {
                        title: '角色',
                        key: 'role',
                        dataIndex: 'role',
                        scopedSlots: { customRender: 'role' },
                        width: 100
                    }, {
                        title: '状态',
                        key: 'status',
                        dataIndex: 'status',
                        scopedSlots: { customRender: 'status' },
                        width: 100
                    }, {
                        title: '操作',
                        key: 'action',
                        dataIndex: 'action',
                        scopedSlots: { customRender: 'action' },
                        // width: 250
                    }
                ]
            },
            data: [
                {
                    key: '1',
                    id: '1',
                    userName: 'John Brown',
                    age: '2019-07-23 11:37',
                    address: '2019-07-23 11:37',
                    role: '管理员',
                    status: '正常',
                }, {
                    key: '2',
                    id: '2',
                    userName: 'Jim Green',
                    age: '2019-07-23 11:37',
                    address: '2019-07-23 11:37',
                    role: '用户',
                    status: '删除',
                }, {
                    key: '3',
                    id: '3',
                    userName: 'Joe Black',
                    age: '2019-07-23 11:37',
                    address: '2019-07-23 11:37',
                    role: '用户',
                    status: '删除',
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
            // pageSize(val) {
            //     console.log('pageSize', val);
            // },
            // current(val) {
            //     console.log('current', val);
            // }
        },
        mounted: function() {

        },
        methods: {
            // onShowSizeChange(current, pageSize) {
            //     console.log(current, pageSize);
            // },
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