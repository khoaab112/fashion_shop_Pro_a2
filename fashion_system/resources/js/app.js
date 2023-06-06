import './bootstrap';
import { createApp } from 'vue';
// import Vue from 'vue';
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import { DatePicker, Radio } from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import App from './App.vue';
import router from './routerVue/index.js';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import axios from 'axios';
window.axios = axios;



const app = createApp(App);
app.use(ElementPlus)
app.use(router);
app.use(DatePicker);
app.use(Radio);

// app.use(radio);
app.mount("#app");
// app.config.globalProperties.$message = message;

// export const bus = new Vue()
// new Vue({
//     router,
//     render: h => h(App),
// }).$mount('#app')