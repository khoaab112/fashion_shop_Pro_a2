import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import other from "./other";

const routes = [
    ...other.error401,
    ...other.error404,
    ...other.error500,
    ...customer.home,
    ...customer.test,
    ...admin
];
const router = createRouter({
    history: createWebHistory(),
    routes
})
export default router;