<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="用户名">
                <a-input id="userName" v-decorator="['userName',{rules: [{ required: true, message: '请填写用户名!' }]}]">
                    <a-icon
                            slot="prefix"
                            type="user"
                            style="color:rgba(0,0,0,.25)"
                    />
                </a-input>
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
        <a-card title="经验特权" class="mb-15">
            <a-steps>
                <a-step status="finish" title="Login">
                    <template v-slot:icon>
                        <a-icon type="user"/>
                    </template>
                    <template v-slot:description>This is a description.</template>
                </a-step>
                <a-step status="finish" title="Verification">
                    <template v-slot:icon>
                        <a-icon type="solution"/>
                    </template>
                </a-step>
                <a-step status="process" title="Pay">
                    <template v-slot:icon>
                        <a-icon type="loading"/>
                    </template>
                </a-step>
                <a-step status="wait" title="Done">
                    <template v-slot:icon>
                        <a-icon type="smile-o"/>
                    </template>
                </a-step>
            </a-steps>
        </a-card>
        <a-card title="经验明细">
            <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
                <template v-slot:action="text, record">
                    <a href="javascript:;" :data-set="JSON.stringify(record)">Edit</a>
                    <a-divider type="vertical"/>
                    <a href="javascript:;">Delete</a>
                </template>
            </a-table>
        </a-card>

    </div>
</template>

<script>

    export default {
        name: "user-exp",
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
                        title: '经验值',  // 表头名称
                        dataIndex: 'exp',
                        key: 'exp',
                        scopedSlots: { customRender: 'exp' },
                        width: 150
                    }, {
                        title: '经验来源',
                        dataIndex: 'expSource',
                        key: 'expSource',
                        scopedSlots: { customRender: 'expSource' },
                        width: 300
                    }, {
                        title: '创建时间',
                        dataIndex: 'createTime',
                        key: 'createTime',
                        scopedSlots: { customRender: 'createTime' },
                        width: 200
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
                    exp: '+5',
                    expSource: '发布影评',
                    createTime: '2019-07-23 11:37'
                }, {
                    key: '2',
                    id: '2',
                    exp: '+1',
                    expSource: '影评回复',
                    createTime: '2019-07-23 11:37'
                }, {
                    key: '3',
                    id: '3',
                    exp: '+10',
                    expSource: '完善个人资料',
                    createTime: '2019-07-23 11:37'
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