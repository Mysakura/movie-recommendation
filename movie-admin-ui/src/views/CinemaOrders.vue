<template>
    <div>
        <a-form
                layout="inline"
                :form="form"
                @submit="handleSubmit"
                class="mb-15"
        >
            <a-form-item label="订单单号">
                <a-input v-decorator="['orderNumber',{}]">
                    <a-icon
                            slot="prefix"
                            type="key"
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
            </a-form-item>
        </a-form>

        <a-table :columns="common.columns" :dataSource="data" bordered size="middle">
            <template v-slot:name="text">
                <a href="javascript:;">{{text}}</a>
            </template>


            <template v-slot:orderStatus="orderStatus">
                <a-tag v-if="orderStatus == '已付款'" color="green" :key="orderStatus">{{orderStatus}}</a-tag>
                <a-tag v-else color="red" :key="orderStatus">{{orderStatus}}</a-tag>
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
        name: "cinema-orders",
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
                        title: '订单编号',
                        dataIndex: 'orderNumber',
                        key: 'orderNumber',
                        scopedSlots: { customRender: 'orderNumber' },
                    }, {
                        title: '影院',
                        dataIndex: 'cinema',
                        key: 'cinema',
                        scopedSlots: { customRender: 'cinema' },
                    }, {
                        title: '电话',
                        dataIndex: 'phone',
                        key: 'phone',
                        scopedSlots: { customRender: 'phone' },
                    }, {
                        title: '座位',
                        dataIndex: 'seat',
                        key: 'seat',
                        scopedSlots: { customRender: 'seat' },
                    }, {
                        title: '票价',
                        dataIndex: 'price',
                        key: 'price',
                        scopedSlots: { customRender: 'price' },
                    }, {
                        title: '实付款',
                        dataIndex: 'realPrice',
                        key: 'realPrice',
                        scopedSlots: { customRender: 'realPrice' },
                    }, {
                        title: '场次',
                        dataIndex: 'showsNo',
                        key: 'showsNo',
                        scopedSlots: { customRender: 'showsNo' },
                    }, {
                        title: '创建人',
                        dataIndex: 'createUser',
                        key: 'createUser',
                        scopedSlots: { customRender: 'createUser' },
                    }, {
                        title: '创建时间',
                        dataIndex: 'createTime',
                        key: 'createTime',
                        scopedSlots: { customRender: 'createTime' },
                    }, {
                        title: '订单状态',
                        dataIndex: 'orderStatus',
                        key: 'orderStatus',
                        scopedSlots: { customRender: 'orderStatus' },
                    },{
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
                    orderNumber: '30014462967596008',
                    cinema: '上海宝山万达广场店',
                    phone: '18832059556',
                    seat: '2排1座',
                    price: '37',
                    realPrice: '37',
                    showsNo: '7月30日  20:10',
                    createUser: 'Admin',
                    createTime: '2019-07-23 11:37',
                    orderStatus: '已付款',
                    status: '正常',
                },
            ],
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
            }
        }
    }
</script>

<style scoped>

</style>