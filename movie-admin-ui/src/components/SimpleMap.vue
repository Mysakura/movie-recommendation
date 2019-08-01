<template>
    <div>
        <a-row :gutter="16">
            <a-col :span="12">
                <a-form-item v-if="map.isAdd" label="关键词">
                    <a-input v-model="map.keyword"/>
                </a-form-item>
            </a-col>
            <a-col :span="12">
                <a-form-item v-if="map.isAdd" label="地区">
                    <a-input v-model="map.location"/>
                </a-form-item>
            </a-col>
        </a-row>

        <baidu-map class="map" :center="map.center" :zoom="map.zoom" @ready="handler">
            <bm-navigation anchor="BMAP_ANCHOR_TOP_LEFT"></bm-navigation>
            <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true" :autoLocation="true"></bm-geolocation>
            <bm-marker v-if="!map.isAdd" :position="map.center" :dragging="map.dragging" animation="BMAP_ANIMATION_DROP">
                <bm-info-window :show="map.show">上海宝山万达广场店</bm-info-window>
            </bm-marker>
            <bm-local-search v-if="map.isAdd" class="search" :keyword="map.keyword" :auto-viewport="true" :location="map.location"></bm-local-search>
        </baidu-map>
    </div>
</template>

<script>
    export default {
        name: "simple-map",
        props: {
            map: {
                type: Object
            }
        },
        data: () => ({
            current: {
                lng: 0.0,
                lat: 0.0
            }
        }),
        watch: {
            current: function () {
                this.$emit('select-location', this.current);
            }
        },
        methods: {
            handler ({BMap, map}) {
                let me = this;
                console.log(BMap, map)
                // 鼠标缩放
                map.enableScrollWheelZoom(true);
                // 点击事件获取经纬度
                map.addEventListener('click', function (e) {
                    console.log(e.point.lng, e.point.lat)
                    me.$emit('select-location', {
                        lng: e.point.lng,
                        lat: e.point.lat
                    });
                })
            }
        }
    }
</script>

<style scoped>
    .map {
        width: 100%;
        height: 400px;
    }
    .map .search{
        margin-bottom: 65px;
    }
</style>