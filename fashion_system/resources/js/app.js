import './bootstrap';
import { createApp } from 'vue';
import App from './App.vue';
import router from './routerVue/index.js';

const app = createApp(App);
app.use(router);
app.mount("#app");