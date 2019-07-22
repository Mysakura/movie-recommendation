<template>
    <div>
        <a-table :columns="common.columns" :dataSource="data" bordered>
            <template v-slot:name="text">
                <a href="javascript:;">{{text}}</a>
            </template>

            <template v-slot:customTitle>
                <span><a-icon type="smile-o"/> Name</span>
            </template>

            <template v-slot:tags="tags">
                <a-tag v-for="tag in tags" color="blue" :key="tag">{{tag}}</a-tag>
            </template>

            <template v-slot:action="text, record">
                <a href="javascript:;">Invite 一 {{record.name}}</a>
                <a-divider type="vertical"/>
                <a href="javascript:;">Delete</a>
                <a-divider type="vertical"/>
                <a href="javascript:;" class="ant-dropdown-link">
                More actions <a-icon type="down"/>
                </a>
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
                columns: [{
                    dataIndex: 'name',
                    key: 'name',
                    slots: { title: 'customTitle' },
                    scopedSlots: { customRender: 'name' },
                }, {
                    title: 'Age',
                    dataIndex: 'age',
                    key: 'age',
                }, {
                    title: 'Address',
                    dataIndex: 'address',
                    key: 'address',
                }, {
                    title: 'Tags',
                    key: 'tags',
                    dataIndex: 'tags',
                    scopedSlots: { customRender: 'tags' },
                }, {
                    title: 'Action',
                    key: 'action',
                    scopedSlots: { customRender: 'action' },
                }]
            },
            data: [{
                key: '1',
                name: 'John Brown',
                age: 32,
                address: 'New York No. 1 Lake Park',
                tags: ['nice', 'developer'],
            }, {
                key: '2',
                name: 'Jim Green',
                age: 42,
                address: 'London No. 1 Lake Park',
                tags: ['loser'],
            }, {
                key: '3',
                name: 'Joe Black',
                age: 32,
                address: 'Sidney No. 1 Lake Park',
                tags: ['cool', 'teacher'],
            }]
        }),
        watch: {
            pageSize(val) {
                console.log('pageSize', val);
            },
            current(val) {
                console.log('current', val);
            }
        },
        methods: {
            onShowSizeChange(current, pageSize) {
                console.log(current, pageSize);
            }
        }
    }
</script>

<style scoped>

</style>