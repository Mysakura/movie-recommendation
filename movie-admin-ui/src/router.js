import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/userManage',
            name: 'userManage',
            component: () => import('./views/module/UserView.vue'),
            children: [
                {
                    // 当 /userManage/list 匹配成功
                    // UserList 会被渲染在 UserView 的 <router-view> 中
                    path: 'list',
                    component: () => import('./views/UserList.vue')
                },{
                    path: 'vip',
                    component: () => import('./views/UserExp.vue')
                }
            ]
        }
    ]
})
// 可以在任何组件内通过 this.$router 访问路由器，也可以通过 this.$route 访问当前路由