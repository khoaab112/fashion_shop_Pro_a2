import { createApp } from 'vue';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import { DatePicker, Radio } from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import App from './App.vue';
import router from './routerVue/index.js';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import axios from 'axios';
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";

window.axios = axios;

library.add(fas, fab, far)

const app = createApp(App);
app.component('font-awesome-icon', FontAwesomeIcon)
app.use(ElementPlus);
app.use(router);
app.use(DatePicker);
app.use(Radio);


app.mount("#app");