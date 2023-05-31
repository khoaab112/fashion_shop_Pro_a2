import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import error404 from "./other";

const routes = [...admin, ...error404, ...customer];
// const routes = [...customer];

const router = createRouter({
    history: createWebHistory(),
    routes
})
export default router;