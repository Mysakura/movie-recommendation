<template>
  <div id="app">
      <a-layout id="components-layout-demo-fixed-sider">
          <a-layout-sider :style="[styles.sider, styles.siderBg]">
              <div class="logo">电影系统管理后台</div>
              <a-menu theme="dark" mode="inline" :defaultSelectedKeys="common.defaultActive" :openKeys.sync="common.defaultOpen" :style="styles.siderBg">
                  <!--<a-menu-item key="0">-->
                      <!--<a-icon type="home" />-->
                      <!--<span class="nav-text">-->
                          <!--<router-link to="/">Dashboard</router-link>-->
                      <!--</span>-->
                  <!--</a-menu-item>-->

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
          <a-layout :style="styles.content">
              <a-layout-header class="app-header">
                  <a-button type="primary" icon="logout">退出</a-button>
              </a-layout-header>
              <a-layout-content :style="{ margin: '24px 16px 0', overflow: 'initial' }">
                  <router-view/>
              </a-layout-content>
              <a-layout-footer :style="styles.footer">
                  Movie Admin ©2019 Created by Dong & Liao
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
                    id: '0',
                    name: '首页',
                    url: '/',
                    icon: 'home',
                    subNavs: [
                        {
                            id: '0-1',
                            name: 'Dashboard',
                            url: ''
                        }
                    ]
                },{
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
                            name: '拉黑名单',
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
            ],
            styles: {
                commonBgGradient: {
                    background: 'linear-gradient(250deg, rgb(173, 57, 214), rgb(45, 150, 231))'
                },
                siderBg: {
                    backgroundColor: '#327978',
                    backgroundImage: 'linear-gradient(270deg,rgba(51,148,225,.18),transparent)'
                },
                sider: {
                    overflow: 'auto',
                    flex: '0 0 230px',
                    maxWidth: '230px',
                    minWidth: '230px',
                    width: '230px',
                    height: '100vh',
                    position: 'fixed',
                    left: 0
                },
                content: {
                    marginLeft: '230px',
                    backgroundColor: '#f2fdff'
                },
                footer: {
                    textAlign: 'center',
                    backgroundColor: '#fff'
                }
            },
            common: {
                defaultOpen: ['0'],
                defaultActive: ['0-1'],

            }
        }),
    }
</script>
<style>
    #app {
      font-family: 'Avenir', Helvetica, Arial, sans-serif;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
      /*text-align: center;*/
      /*color: #2c3e50;*/
    }
    #components-layout-demo-fixed-sider .logo {
        height: 60px;
        /*background: linear-gradient(250deg, rgb(57, 207, 214), rgb(211, 231, 45));*/
        /*条纹*/
        background-image: repeating-linear-gradient(60deg,rgba(0,94,93,1),rgba(0,94,93,1) 15px,rgba(0,94,93,0.5) 0,rgba(0,94,93,0.5) 30px);
        margin: 16px;
        padding: 19px;
        font-size: 16px;
        font-weight: 600;
        color: #fff;
    }
    /*菜单a标签*/
    .ant-menu.ant-menu-dark a{
        text-decoration: none;
        padding: 10px 46px;
        color: #b7cacf;
        font-size: 14px !important;
    }
    .ant-menu.ant-menu-dark a:hover{
        color: #fff;
    }
    /*选中导航，前景色*/
    .ant-menu-item-selected a{
        color: #fff !important;
    }
    .ant-menu-item-selected a:hover{
        color: #fff;
    }
    /*上方导航条*/
    .app-header {
        background: #fff !important;
        padding: 0px 15px !important;
        height: 68px !important;
        text-align: right;
        box-shadow: 0px 0px 10px 0px rgba(101, 238, 255, 0.4);
    }

    .ant-menu.ant-menu-dark .ant-menu-item-selected{
        background-color: #12B4B2 !important;
    }
    .ant-menu-dark .ant-menu-sub{
        background-color: #447075 !important;
    }
    /*悬浮菜单颜色*/
    .ant-menu-item:hover{
        background-color: #225252 !important;
    }
    .ant-menu-submenu:hover{
        background-color: #225252;
    }

    /*自定义全局通用样式*/
    .text-center{
        text-align: center;
    }
    .text-right{
        text-align: right;
    }
    .mt-15{
        margin-top: 15px;
    }
    .pt-15{
        padding-top: 15px;
    }
    .bt{
        border-top: 1px solid #ddd;
    }
</style>
