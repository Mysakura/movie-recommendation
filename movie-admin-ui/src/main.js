import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ant from 'ant-design-vue'
import 'ant-design-vue/dist/antd.less'
import BaiduMap from 'vue-baidu-map'

Vue.use(BaiduMap, {
    ak: 'GpRqD2SowifsTdi1lRqD59ObuRRRRVl9'
});

Vue.use(ant);
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
