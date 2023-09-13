import { createApp } from 'vue';
import ENV from './generalSetting/filterEnv'
//element-plus
import ElementPlus from 'element-plus';
import VN from 'element-plus/dist/locale/vi.mjs';
// import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import 'element-plus/dist/index.css';
//ant-design
import { DatePicker, Radio, Table } from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
//bootstrap
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
//axios
import axios from 'axios';
//font-awesome
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
//mavonEditor hiện tại không dùng tới
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
//Vue-Quill
import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css';

import VueClientRecaptcha from 'vue-client-recaptcha'

//app
import App from './App.vue';
import router from './routerVue/index.js';


//BROADCAST
import Echo from "laravel-echo"
// window.Pusher = require('pusher-js');
import Pusher from 'pusher-js';
window.Pusher = Pusher;
window.Echo = new Echo({
    broadcaster: 'pusher',
    key: ENV.PUSHER_APP_KEY,
    // wsHost: ENV.APP_URL,
    // wsPort: 6001,
    cluster: ENV.PUSHER_APP_CLUSTER,
    forceTLS: true,
    disableStats: true,
    // authEndpoint: 'http://127.0.0.1:8000/api/auth/test-ting',
    // auth: {
    //     headers: {
    //         Authorization: 'Bearer ' + YOUR_TOKEN_FROM_LOGIN,
    //     }
    // },
});

window.axios = axios;

library.add(fas, fab, far)

const app = createApp(App);
app.component('font-awesome-icon', FontAwesomeIcon);
app.component('QuillEditor', QuillEditor);
app.component("VueClientRecaptcha", VueClientRecaptcha);
// app.use(ElementPlus);
app.use(router);
app.use(DatePicker);
app.use(Radio);
app.use(ElementPlus, {
    locale: VN,
});
app.use(mavonEditor);


app.mount("#app");