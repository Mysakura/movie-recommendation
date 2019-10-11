<template>
    <div class="body">
        <a-row type="flex" justify="center" align="middle" style="height: 100%">
            <a-col :xs="20" :sm="16" :md="12" :lg="10" :xl="6" class="login-wrap">
                <a-form :form="formForLogin" layout="vertical" hideRequiredMark>
                    <a-row :gutter="16" type="flex" justify="center" style="margin: 40px;">
                        <a-col :span="18">
                            <a-form-item>
                                <a-input
                                        v-decorator="['userName', {
                                      rules: [{ required: true, message: 'Please enter user name' }]
                                    }]"
                                        placeholder="Please enter user name"
                                        size="large"
                                >
                                <a-icon
                                        slot="prefix"
                                        type="user"
                                        style="color: rgba(0,0,0,.25)"
                                />
                                </a-input>
                            </a-form-item>
                        </a-col>
                        <a-col :span="18">
                            <a-form-item>
                                <a-input
                                        v-decorator="['password', {
                                      rules: [{ required: true, message: 'please enter password' }]
                                    }]"
                                        type="password"
                                        placeholder="please enter password"
                                        size="large"
                                >
                                <a-icon
                                        slot="prefix"
                                        type="lock"
                                        style="color: rgba(0,0,0,.25)"
                                />
                                </a-input>
                            </a-form-item>
                        </a-col>
                        <a-col :span="18">
                            <a-button
                                    block
                                    type="primary"
                                    @click="login"
                                    size="large"
                            >
                                登录
                            </a-button>
                        </a-col>
                    </a-row>
                </a-form>
            </a-col>
        </a-row>
    </div>
</template>

<script>
    export default {
        name: "login",
        data: () => ({

        }),
        computed: {
            // 处理表单使其具有自动收集数据并校验的功能
            formForLogin: function () {
                return this.$form.createForm(this)
            }
        },
        methods: {
            login(){
                let me = this;
                me.formForLogin.validateFields((err, values) => {
                    if (!err) {
                        console.log('Received values of form: ', values);
                        me.$axios.post('/user/login', values)
                            .then((response) => {
                                console.log("登录返回", response);
                                let headers = response.headers;
                                let result = response.data;
                                if(result.code === 200){
                                    let userName = result.data.userName;
                                    let token = headers["x-auth-token"];
                                    console.log("用户信息", userName, token);
                                    sessionStorage.setItem("x-auth-token", token);
                                }else{
                                    me.$notification.error({
                                        message: '登录失败',
                                        description: result.message,
                                    });
                                }
                            });
                    }
                });
            }
        }
    }
</script>

<style scoped>
    .body{
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: url("../assets/grass.jpg") no-repeat center;
        background-size: cover;
        z-index: 999;
    }
    .login-wrap{
        min-height: 200px;
        background-color: rgba(97, 95, 90, 0.82);
        border-radius: 3px;
    }
</style>