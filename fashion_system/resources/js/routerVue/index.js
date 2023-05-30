import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import { error404, home } from "./other";

const routes = [...admin, ...error404, ...home];
const router = createRouter({
    history: createWebHistory(),
    routes
})
export default router;