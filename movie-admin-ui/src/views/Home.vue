<template>
  <div class="about">
    <span class="inlinesparkline"></span>
    <span class="inlinebar"></span>
  </div>
</template>
<script>
    import $ from 'jquery'
    import '@/assets/jquery.sparkline.js'

    export default {
        name: 'home',
        mounted: function () {
            $('.inlinesparkline').sparkline([1,4,4,7,5,9,10,2],{
                type:'line',
                lineColor:'#1dc9b7',
                width: '70px',
                height: '32px',
                spotRadius: 3,    // 所有专色标记的半径,以像素为单位（默认值：1.5）
                enableTagOptions: true,
                disableHiddenCheck: false,
                fillColor: false    // 填充图表下方区域,设置为false以禁用填充
            })
            $('.inlinebar').sparkline([1,4,4,7,5,9,10,2,6,21,8],{
                type:'bar',
                barColor:'#886ab5',
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

</style>