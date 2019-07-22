<template>
    <div>
        <a-row>
            <a-col :span="12">
                <h2>
                    <a-icon type="area-chart" />
                    Analytics Dashboard
                </h2>
            </a-col>
            <a-col :span="8" :offset="4">
                <a-row>
                    <a-col :span="12">
                        <a-col :span="12" class="text-center">
                            <div class="gray-title">User Number</div>
                            <h2>255</h2>
                        </a-col>
                        <a-col :span="12">
                            <span class="inlinebar">1, 4, 7, 5, 9, 10, 2, 6, 21, 8</span>
                        </a-col>
                    </a-col>
                    <a-col :span="12">
                        <a-col :span="12" class="text-center">
                            <div class="gray-title">Movie Number</div>
                            <h2>9999</h2>
                        </a-col>
                        <a-col :span="12">
                            <span class="inlinebar2">2, 5, 9, 4, 2, 2, 15, 1, 6, 7</span>
                        </a-col>
                    </a-col>
                </a-row>
            </a-col>
        </a-row>
        <a-card title="应用监控">
            <a-row>
                <a-col :span="16">
                    <simple-line-chart :chartdata="dataSet.slc.chartdata" :options="dataSet.slc.options"></simple-line-chart>
                </a-col>
                <a-col :span="8">
                    <custom-progress :total="500" :already="100" title="在线用户"></custom-progress>
                    <custom-progress :total="800" :already="100" title="在线用户" bg-color="#9c7bbd" progress-text="100/800"></custom-progress>
                </a-col>
            </a-row>
            <a-row class="pt-15 mt-15">
                <a-col :span="6">
                    <a-col :span="12">
                        <a-col :span="12">
                            <vue-easy-pie-chart :percent="90" bar-color="#16899c" :line-width="5"  font-size="14px" line-cap="butt" :size="dataSet.easyPie.size"></vue-easy-pie-chart>
                        </a-col>
                        <a-col :span="12">
                            <div class="pie-info">JVM内存</div>
                        </a-col>
                    </a-col>
                    <a-col :span="12" class="text-right">
                        <a-col :span="12" class="mt-15">
                            <span class="inlinesparkline"></span>
                        </a-col>
                        <a-col :span="12" class="little-tip mt-15">
                            <a-tooltip>
                                <template slot='title'>
                                    总堆内存
                                </template>
                                <div class="tip">8G</div>
                            </a-tooltip>
                            <a-tooltip>
                                <template slot='title'>
                                    已用内存
                                </template>
                                <div class="tip">7.5G</div>
                            </a-tooltip>
                        </a-col>
                    </a-col>
                </a-col>
                <a-col :span="6">
                    <a-col :span="12">
                        <a-col :span="12">
                            <vue-easy-pie-chart :percent="82" bar-color="#7d9a0a" :line-width="5"  font-size="14px" line-cap="butt" :size="dataSet.easyPie.size"></vue-easy-pie-chart>
                        </a-col>
                        <a-col :span="12">
                            <div class="pie-info">系统内存</div>
                        </a-col>
                    </a-col>
                    <a-col :span="12" class="text-right">
                        <a-col :span="12" class="mt-15">
                            <span class="inlinesparkline"></span>
                        </a-col>
                        <a-col :span="12" class="little-tip mt-15">
                            <a-tooltip>
                                <template slot='title'>
                                    总内存
                                </template>
                                <div class="tip">16G</div>
                            </a-tooltip>
                            <a-tooltip>
                                <template slot='title'>
                                    已用内存
                                </template>
                                <div class="tip">14.5G</div>
                            </a-tooltip>
                        </a-col>
                    </a-col>
                </a-col>
                <a-col :span="6">
                    <a-col :span="12">
                        <a-col :span="12">
                            <vue-easy-pie-chart :percent="30" bar-color="#2e2f2f" :line-width="5"  font-size="14px" line-cap="butt" :size="dataSet.easyPie.size"></vue-easy-pie-chart>
                        </a-col>
                        <a-col :span="12">
                            <div class="pie-info">磁盘</div>
                        </a-col>
                    </a-col>
                    <a-col :span="12" class="text-right">
                        <a-col :span="12" class="mt-15">
                            <span class="inlinesparkline"></span>
                        </a-col>
                        <a-col :span="12" class="little-tip mt-15">
                            <a-tooltip>
                                <template slot='title'>
                                    总磁盘空间
                                </template>
                                <div class="tip">100G</div>
                            </a-tooltip>
                            <a-tooltip>
                                <template slot='title'>
                                    已用磁盘空间
                                </template>
                                <div class="tip">20G</div>
                            </a-tooltip>
                        </a-col>
                    </a-col>
                </a-col>
                <a-col :span="6">
                    <a-col :span="12">
                        <a-col :span="12">
                            <vue-easy-pie-chart :percent="25" bar-color="#c50e4a" :line-width="5"  font-size="14px" line-cap="butt" :size="dataSet.easyPie.size"></vue-easy-pie-chart>
                        </a-col>
                        <a-col :span="12">
                            <div class="pie-info">线程</div>
                        </a-col>
                    </a-col>
                    <a-col :span="12" class="text-right">
                        <a-col :span="12" class="mt-15">
                            <span class="inlinesparkline"></span>
                        </a-col>
                        <a-col :span="12" class="little-tip mt-15">
                            <a-tooltip>
                                <template slot='title'>
                                    线程总数
                                </template>
                                <div class="tip">4</div>
                            </a-tooltip>
                            <a-tooltip>
                                <template slot='title'>
                                    工作线程，非守护线程
                                </template>
                                <div class="tip">1</div>
                            </a-tooltip>
                        </a-col>
                    </a-col>
                </a-col>
            </a-row>
        </a-card>
        <a-row class="mt-15">
            <a-col :span="12">
                <a-card title="数据比例" class="mr-7-5">
                    <div class="pd-15">
                        <simple-doughnut-chart :chartdata="dataSet.sdc.chartdata" :options="dataSet.sdc.options"></simple-doughnut-chart>
                    </div>
                </a-card>
            </a-col>
            <a-col :span="12">
                <a-card title="电影分布" class="ml-7-5">
                    <div id="vmap" style="height: 400px;"></div>
                    <div class="vmap-tip" id="vmapTip"></div>
                </a-card>
            </a-col>
        </a-row>
    </div>
</template>
<script>
    import $ from 'jquery';
    import '@/assets/jquery.sparkline.js';
    import SimpleLineChart from "../components/SimpleLineChart";
    import ARow from "ant-design-vue/es/grid/Row";
    import ACol from "ant-design-vue/es/grid/Col";
    import VueEasyPieChart from 'vue-easy-pie-chart';
    import 'vue-easy-pie-chart/dist/vue-easy-pie-chart.css';
    import CustomProgress from "../components/CustomProgress";
    import SimpleDoughnutChart from "../components/SimpleDoughnutChart";
    import '@/assets/jqvmap/jquery.vmap.js'
    import '@/assets/jqvmap/maps/jquery.vmap.world.js'
    import '@/assets/jqvmap/jqvmap.css'

    export default {
        components: {
            SimpleDoughnutChart,
            CustomProgress,
            VueEasyPieChart,
            ACol,
            ARow,
            SimpleLineChart},
        name: 'home',
        data: () => ({
            dataSet: {
                slc: {
                    chartdata: {
                        labels: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30'],
                        datasets: [
                            {
                                label: '订单量',
                                backgroundColor: '#f87979',
                                data: [793,409,179,481,650,223,916,44,653,245,259,316,136,243,606,175,19,311,2,368,336,563,921,466,505,293,224,965,600,22],
                                fill: true,
                                borderColor: '#f87979',             // 线条颜色
                                pointBorderColor: '#f87979',       // 数据点边框颜色
                                pointBackgroundColor: '#fff',  // 数据点背景色
                                pointRadius: 3,                      // 数据点半径
                                lineTension: 0.4,                      // 0-直线，> 0曲线
                            },{
                                label: '金额',
                                backgroundColor: '#25cfc6',
                                data: [793*2,409*2,179*2,481*2,650*2,223*2,916*2,44*2,653*2,245*2,259*2,316*2,136*2,243*2,606*2,175*2,19*2,311*2,2*2,368*2,336*2,563*2,
                                    921*2,466*2,505*2,293*2,224*2,965*2,600*2,22*2],
                                fill: true,
                                borderColor: '#25cfc6',             // 线条颜色
                                pointBorderColor: '#25cfc6',       // 数据点边框颜色
                                pointBackgroundColor: '#fff',  // 数据点背景色
                                pointRadius: 3,                      // 数据点半径
                                lineTension: 0.4,                      // 0-直线，> 0曲线
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false
                    }
                },
                sdc: {
                    chartdata: {
                        labels: ['用户','电影','影院','明星'],
                        datasets: [
                            {
                                backgroundColor: ['#f87979','#d8c42a','#6db320','#f866e6'],
                                data: [793,409,179,481]
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false
                    }
                },
                easyPie:{
                    size: 70
                }
            }
        }),
        mounted: function () {
            $('.inlinesparkline').sparkline([1, 4, 4, 7, 5, 9, 10, 2], {
                type: 'line',
                lineColor: '#a92f51',
                width: '70px',
                height: '40px',
                spotRadius: 3,    // 所有专色标记的半径,以像素为单位（默认值：1.5）
                enableTagOptions: true,
                disableHiddenCheck: false,
                fillColor: false    // 填充图表下方区域,设置为false以禁用填充
            })

            $('.inlinebar').sparkline('html', {
                type: 'bar',
                barColor: '#886ab5',
                width: '85px',
                height: '46px',
                barWidth: 5,    // 柱子宽度
                barSpacing: 3,  // 间距
                enableTagOptions: true,
                disableHiddenCheck: false
            })
            $('.inlinebar2').sparkline('html', {
                type: 'bar',
                barColor: '#fe6bb0',
                width: '85px',
                height: '46px',
                barWidth: 5,    // 柱子宽度
                barSpacing: 3,  // 间距
                enableTagOptions: true,
                disableHiddenCheck: false
            })
            $('#vmap').vectorMap(
                {
                    map: 'world_en',
                    backgroundColor: '#62adc3',
                    borderColor: '#818181',
                    borderOpacity: 0.25,
                    borderWidth: 1,
                    color: '#f4f3f0',
                    enableZoom: true,
                    hoverColor: '#aadc59',
                    hoverOpacity: null,
                    normalizeFunction: 'linear',
                    scaleColors: ['#b6d6ff', '#005ace'],
                    selectedColor: '#aadc59',
                    selectedRegions: null,
                    showTooltip: true,
                    onRegionClick: function(element, code, region)
                    {
                        var message = 'You clicked "'
                            + region
                            + '" which has the code: '
                            + code.toUpperCase();

                        // alert(message);
                        $('#vmapTip').text(message);
                    }
                });
        }
    }
</script>
<style scoped>
    .vue-easy-pie-chart{
        display: inline-block;
    }
    .gray-title{
        color: #969393;
    }
    .pie-info{
        line-height: 70px;
        font-size: 16px;
        font-weight: 500;
        display: inline-block;
    }
    .little-tip .tip{
        width: 50px;
        height: 22px;
        margin: 0px auto 5px;
        color: #fff;
        background-color: #45b2e6;
        box-sizing: border-box;
        border-radius: 3px;
        text-align: center;
    }
    .vmap-tip{
        height: 30px;
        background-color: rgb(98, 173, 195);
        padding-left: 10px;
        color: #c0f1ff;
        font-size: 16px;
    }
</style>