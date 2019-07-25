<template>
    <div class="custom-progress">
        <div class="info">
            <div class="title">{{title}}</div>
            <div class="progress">{{showText}}</div>
        </div>
        <div class="outer" :style="{height: height}">
            <div class="inner" :style="{backgroundColor: bgColor, width: ratio}"></div>
        </div>
    </div>
</template>

<script>
    export default {
        // 自定义进度条
        name: "CustomProgress",
        // 标题，展示进度文字信息，总进度，已完成，进度条高度，进度条颜色
        props:{
            title: {
                type: String,
                default: ''
            },progressText: {
                type: String,
                default: ''
            },total: {
                type: Number,
                default: 1
            },already: {
                type: Number,
                default: 0
            },height: {
                type: String,
                default: '8px'
            },bgColor: {
                type: String,
                default: '#5d5d5d'
            },width: {
                type: String,
                default: ''
            }
        },
        computed: {
            ratio: function () {
                // 如果配置了百分比的width属性，则优先使用width
                return this.width ? this.width : this.already/this.total*100 + '%';
            },
            showText: function () {
                if(this.progressText === ''){
                    return this.ratio;
                }else{
                    return this.progressText;
                }
            }
        }
    }
</script>

<style scoped>
    .custom-progress{
        margin: 10px;
        padding: 8px;
    }
    .info{
        text-align: right;
    }
    .info .title{
        float: left;
    }
    .outer{
        position: relative;
        border-bottom-left-radius: 3px;
        border-top-left-radius: 3px;
        background-color: #efefef;
    }
    .outer .inner{
        position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        border-bottom-left-radius: 3px;
        border-top-left-radius: 3px;
    }
</style>