<script>
    import {Line} from 'vue-chartjs'

    export default {
        extends: Line,
        name: "simple-line-chart",
        props: ['chartdata', 'options'],
        mounted () {
            this.renderChart(this.chartdata, this.options)
        }
    }
</script>

<style scoped>

</style>