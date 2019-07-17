<template>
  <div id="app">
      <a-layout id="components-layout-demo-fixed-sider">
          <a-layout-sider :style="{ overflow: 'auto', height: '100vh', position: 'fixed', left: 0 }">
              <div class="logo"></div>
              <a-menu theme="dark" mode="inline" :defaultSelectedKeys="['1']">
                  <a-menu-item key="1">
                      <a-icon type="home" />
                      <span class="nav-text">
                          <router-link to="/">Home</router-link>
                      </span>
                  </a-menu-item>

                  <a-menu-item key="2">
                      <a-icon type="video-camera" />
                      <span class="nav-text">
                          <router-link to="/about">About</router-link>
                      </span>
                  </a-menu-item>

                  <a-sub-menu v-for="m in navs" :key="m.id">
                      <span slot="title"><a-icon :type="m.icon" /><span>{{m.name}}</span></span>
                      <a-menu-item v-for="sm in m.subNavs" :key="sm.id">
                          <span class="nav-text">
                              <router-link :to="m.url + sm.url">{{sm.name}}</router-link>
                          </span>
                      </a-menu-item>
                  </a-sub-menu>

              </a-menu>
          </a-layout-sider>
          <a-layout :style="{ marginLeft: '200px' }">
              <a-layout-header :style="{ background: '#001529', padding: '0 15px', height: '68px', textAlign: 'right' }">
                  <a-button type="primary" icon="logout">退出</a-button>
              </a-layout-header>
              <a-layout-content :style="{ margin: '24px 16px 0', overflow: 'initial' }">
                  <router-view/>
              </a-layout-content>
              <a-layout-footer :style="{ textAlign: 'center' }">
                  Ant Design ©2018 Created by Ant UED
              </a-layout-footer>
          </a-layout>
      </a-layout>
  </div>
</template>
<script>
    export default {
        data: () => ({
            navs: [
                {
                    id: '1',
                    name: '用户管理',
                    url: '/userManage',
                    icon: 'user',
                    subNavs: [
                        {
                            id: '1-1',
                            name: '用户列表',
                            url: '/list'
                        },{
                            id: '1-2',
                            name: '黑名单用户',
                            url: '/blackList'
                        },{
                            id: '1-3',
                            name: '经验特权',
                            url: '/vip'
                        }
                    ]
                },{
                    id: '2',
                    name: '群组管理',
                    url: '/groupManage',
                    icon: 'team',
                    subNavs: [
                        {
                            id: '2-1',
                            name: '群组列表',
                            url: '/list'
                        },{
                            id: '2-2',
                            name: '群组分类',
                            url: '/classify'
                        },{
                            id: '2-3',
                            name: '群组话题',
                            url: '/topic'
                        }
                    ]
                },{
                    id: '3',
                    name: '电影管理',
                    url: '/movieManage',
                    icon: 'video-camera',
                    subNavs: [
                        {
                            id: '3-1',
                            name: '电影列表',
                            url: '/list'
                        },{
                            id: '3-2',
                            name: '电影类型',
                            url: '/type'
                        },{
                            id: '3-3',
                            name: '国家地区',
                            url: '/region'
                        },{
                            id: '3-4',
                            name: '影视明星',
                            url: '/stars'
                        },{
                            id: '3-5',
                            name: '影评管理',
                            url: '/comments'
                        }
                    ]
                },{
                    id: '4',
                    name: '影院管理',
                    url: '/cinemaManage',
                    icon: 'shop',
                    subNavs: [
                        {
                            id: '4-1',
                            name: '影院列表',
                            url: '/list'
                        },{
                            id: '4-2',
                            name: '座位管理',
                            url: '/seats'
                        },{
                            id: '4-3',
                            name: '上映管理',
                            url: '/shows'
                        },{
                            id: '4-4',
                            name: '影院订单',
                            url: '/orders'
                        }
                    ]
                },{
                    id: '5',
                    name: '新闻管理',
                    url: '/newsManage',
                    icon: 'notification',
                    subNavs: [
                        {
                            id: '5-1',
                            name: '新闻列表',
                            url: '/list'
                        }
                    ]
                },{
                    id: '6',
                    name: '统计信息',
                    url: '/stat',
                    icon: 'bar-chart',
                    subNavs: [
                        {
                            id: '6-1',
                            name: '社区系统',
                            url: '/comunity'
                        },{
                            id: '6-2',
                            name: '榜单系统',
                            url: '/top'
                        }
                    ]
                }
            ]
        }),
    }
</script>
<style>
    #app {
      font-family: 'Avenir', Helvetica, Arial, sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
      text-align: center;
      color: #2c3e50;
    }
    #components-layout-demo-fixed-sider .logo {
        height: 32px;
        background: rgba(255,255,255,.2);
        margin: 16px;
    }
    /*选中导航，前景色*/
    .ant-menu-item-selected a{
        color: #fff;
    }
    .ant-menu-item-selected a:hover{
        color: #fff;
    }
</style>
