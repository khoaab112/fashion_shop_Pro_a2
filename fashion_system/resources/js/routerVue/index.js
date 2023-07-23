import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import other from "./other";

const routes = [
    ...other.error,
    ...other.error404,
    ...customer.home,
    ...customer.test,
    ...admin.admin,
    ...admin.auth,
];
const router = createRouter({
    history: createWebHistory(),
    routes
})
export default router;