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
        <a-card title="电影详细">
            <a-row>
                <a-col :span="6">
                    <img :src="data.cover">
                </a-col>
                <a-col :span="18">
                    <custom-progress :width="data.score.one" title="1星" bg-color="#e55d87"></custom-progress>
                    <custom-progress :width="data.score.two" title="2星" bg-color="#cf6e97"></custom-progress>
                    <custom-progress :width="data.score.three" title="3星" bg-color="#a68cb2"></custom-progress>
                    <custom-progress :width="data.score.four" title="4星" bg-color="#7baed1"></custom-progress>
                    <custom-progress :width="data.score.five" title="5星" bg-color="#5fc2e3"></custom-progress>
                </a-col>
            </a-row>
        </a-card>
    </div>
</template>

<script>
    import CustomProgress from "../components/CustomProgress";

    export default {
        components: {CustomProgress},
        name: "movie-details",
        data: () => ({
            common: {
                //
            },
            data: {
                cover: 'http://img5.mtime.cn/mg/2019/01/09/171109.73085148_270X405X4.jpg',
                score: {
                    avg: 4.8,   // 平均分
                    participant: 4858,     // 评分人数
                    one: '0.8%',     // 1星
                    two: '4.5%',   // 2星
                    three: '31.4%',   // 3星
                    four: '43.3%',   // 4星
                    five: '20%'     // 5星
                }
            }
        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            form: function () {
                return this.$form.createForm(this)
            }
        },
        watch: {
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