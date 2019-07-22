<script>
    import {Doughnut} from 'vue-chartjs'
    export default {
        extends: Doughnut,
        name: "simple-doughnut-chart",
        props: ['chartdata', 'options'],
        mounted () {
            this.renderChart(this.chartdata, this.options)
        }
    }
</script>

<style scoped>

</style>