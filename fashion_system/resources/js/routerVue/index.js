import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customRef from "./custommer";
import error404 from "./other";

const routes = [...admin, ...error404, ...customRef];
const router = createRouter({
    history: createWebHistory(),
    routes
})
export default router;