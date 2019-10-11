import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
        {
            path: '/login',
            name: 'login',
            component: () => import('./views/Login.vue')
        },
        {
            path: '/',
            name: 'home',
            component: Home
        }, {
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
        }, {
            path: '/groupManage',
            name: 'groupManage',
            component: () => import('./views/module/GroupView.vue'),
            children: [
                {
                    path: 'list',
                    component: () => import('./views/GroupList.vue')
                },{
                    path: 'classify',
                    component: () => import('./views/GroupClassify.vue')
                },{
                    path: 'topic',
                    component: () => import('./views/GroupTopic.vue')
                }
            ]
        }, {
            path: '/movieManage',
            name: 'movieManage',
            component: () => import('./views/module/MovieView.vue'),
            children: [
                {
                    path: 'list',
                    component: () => import('./views/MovieList.vue')
                },{
                    path: 'detail',
                    component: () => import('./views/MovieDetails.vue')
                },{
                    path: 'type',
                    component: () => import('./views/MovieTypeList.vue')
                },{
                    path: 'region',
                    component: () => import('./views/MovieRegionList.vue')
                },{
                    path: 'stars',
                    component: () => import('./views/MovieStars.vue')
                },{
                    path: 'critics',
                    component: () => import('./views/MovieCritics.vue')
                },{
                    path: 'details/:id',
                    component: () => import('./views/other/CriticsDetails.vue')
                }
            ]
        }, {
            path: '/cinemaManage',
            name: 'cinemaManage',
            component: () => import('./views/module/CinemaView.vue'),
            children: [
                {
                    path: 'list',
                    component: () => import('./views/CinemaList.vue')
                },{
                    path: 'seats',
                    component: () => import('./views/CinemaSeats.vue')
                },{
                    path: 'shows',
                    component: () => import('./views/CinemaShows.vue')
                },{
                    path: 'tickets',
                    component: () => import('./views/CinemaTicket.vue')
                },{
                    path: 'orders',
                    component: () => import('./views/CinemaOrders.vue')
                }
            ]
        }, {
            path: '/newsManage',
            name: 'newsManage',
            component: () => import('./views/module/NewsView.vue'),
            children: [
                {
                    path: 'list',
                    component: () => import('./views/NewsList.vue')
                },{
                    path: 'details/:id',
                    component: () => import('./views/other/NewsDetails.vue')
                }
            ]
        }
    ]
})
// 可以在任何组件内通过 this.$router 访问路由器，也可以通过 this.$route 访问当前路由