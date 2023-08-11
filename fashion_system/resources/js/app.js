import { createApp } from 'vue';
//element-plus
import ElementPlus from 'element-plus';
import VN from 'element-plus/dist/locale/vi.mjs';
// import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import 'element-plus/dist/index.css';
//ant-design
import { DatePicker, Radio } from 'ant-design-vue';
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

//app
import App from './App.vue';
import router from './routerVue/index.js';

window.axios = axios;

library.add(fas, fab, far)

const app = createApp(App);
app.component('font-awesome-icon', FontAwesomeIcon)
    // app.use(ElementPlus);
app.use(router);
app.use(DatePicker);
app.use(Radio);
app.use(ElementPlus, {
    locale: VN,
});


app.mount("#app");