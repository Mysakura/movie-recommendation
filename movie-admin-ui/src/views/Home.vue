<template>
    <div>
        <div class="panel">
            <span class="inlinesparkline"></span>
            <span class="inlinebar"></span>
        </div>
        <div>
            <simple-line-chart :chartdata="dataSet.slc.chartdata" :options="dataSet.slc.options"></simple-line-chart>
        </div>
    </div>
</template>
<script>
    import $ from 'jquery'
    import '@/assets/jquery.sparkline.js'
    import SimpleLineChart from "../components/SimpleLineChart";

    export default {
        components: {SimpleLineChart},
        name: 'home',
        data: () => ({
            dataSet: {
                slc: {
                    chartdata: {
                        labels: ['1', '2', '3', '4', '5', '6'],
                        datasets: [
                            {
                                label: 'Data One',
                                backgroundColor: '#f87979',
                                data: [4, 10, 5, 35, 20, 5],
                                fill: false,
                                borderColor: '#f87979',             // 线条颜色
                                pointBorderColor: '#f87979',       // 数据点边框颜色
                                pointBackgroundColor: '#fff',  // 数据点背景色
                                pointRadius: 5                      // 数据点半径
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false
                    }
                }
            }
        }),
        mounted: function () {
            $('.inlinesparkline').sparkline([1, 4, 4, 7, 5, 9, 10, 2], {
                type: 'line',
                lineColor: '#1dc9b7',
                width: '70px',
                height: '32px',
                spotRadius: 3,    // 所有专色标记的半径,以像素为单位（默认值：1.5）
                enableTagOptions: true,
                disableHiddenCheck: false,
                fillColor: false    // 填充图表下方区域,设置为false以禁用填充
            })
            $('.inlinebar').sparkline([1, 4, 4, 7, 5, 9, 10, 2, 6, 21, 8], {
                type: 'bar',
                barColor: '#886ab5',
                width: '85px',
                height: '32px',
                barWidth: 5,    // 柱子宽度
                barSpacing: 3,  // 间距
                enableTagOptions: true,
                disableHiddenCheck: false
            })

        }
    }
</script>
<style scoped>
    .panel{
        box-sizing: border-box;
        width: 100%;
        height: 150px;
        padding: 15px;
    }

</style>