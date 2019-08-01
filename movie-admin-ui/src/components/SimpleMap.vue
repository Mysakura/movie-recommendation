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
            <!--自动填充-->
            <!--<bm-control class="auto-search">-->
                <!--<bm-auto-complete v-model="map.keyword" :sugStyle="{zIndex: 999999}">-->
                    <!--<a-input placeholder="请输入搜索关键字"/>-->
                <!--</bm-auto-complete>-->
            <!--</bm-control>-->
            <!--缩放-->
            <!--<bm-navigation anchor="BMAP_ANCHOR_TOP_LEFT"></bm-navigation>-->
            <!--定位-->
            <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true" :autoLocation="true"></bm-geolocation>
            <bm-marker v-if="!map.isAdd" :position="map.center" :dragging="map.dragging" animation="BMAP_ANIMATION_DROP">
                <bm-info-window :show="map.show">
                    <h3>上海宝山万达广场店</h3>
                    <div>地址：上海市宝山区一二八纪念路936号5楼（万达广场2号门 直达电梯可到）</div>
                    <div>电话：021-31150880-810</div>
                </bm-info-window>
            </bm-marker>
            <bm-local-search v-if="map.isAdd" class="search-result" :keyword="map.keyword" :auto-viewport="true" :location="map.location"></bm-local-search>
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

        }),
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
        height: 300px;
    }
    .map .auto-search{
        padding: 10px;
        margin: 10px;
        background-color: #fff;
        box-shadow: 0px 0px 10px #a2a2a2;
        border-radius: 3px;
        width: 300px;
    }
    .map .search-result{
        margin-bottom: 65px;
    }
</style>