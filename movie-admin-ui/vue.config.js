module.exports = {
    css: {
        loaderOptions: {
            less: {
                modifyVars: {
                    'primary-color': '#12B4B2',     // 全局主色
                    'link-color': '#12B4B2',        // 链接色
                    'success-color': '#42b983',        // 成功色
                    'warning-color': '#faad14',        // 警告色
                    'error-color': '#f5222d',        // 错误色
                    'border-radius-base': '2px',
                },
                javascriptEnabled: true
            }
        }
    },
    // configureWebpack: {
    //     plugins: [
    //         new webpack.ProvidePlugin({
    //             $:"jquery",
    //             jQuery:"jquery",
    //             "windows.jQuery":"jquery"
    //         })
    //     ]
    // }
};