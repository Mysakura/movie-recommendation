import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ant from 'ant-design-vue'
import Axios from 'axios'
import 'ant-design-vue/dist/antd.less'
import BaiduMap from 'vue-baidu-map'
import VueQuillEditor from 'vue-quill-editor'
// require styles
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

Vue.use(VueQuillEditor, /* { default global options } */);

Vue.use(BaiduMap, {
    ak: 'GpRqD2SowifsTdi1lRqD59ObuRRRRVl9'
});

Vue.use(ant);
Vue.config.productionTip = false;
Axios.defaults.baseURL = 'http://localhost:8081';
Vue.prototype.$axios = Axios;
// 测试环境，图片请求路径为后台地址，打包之前这个置为空
Vue.prototype.$uploadHost = 'http://localhost:8081';

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
