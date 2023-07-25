import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import other from "./other";
import jwt from '@/js/auth/jwt.js';



const routes = [
    ...other.error,
    ...other.error404,
    ...customer.home,
    ...customer.auth,
    ...customer.test,
    ...admin.admin,
    ...admin.auth,
];
const router = createRouter({
    history: createWebHistory(),
    routes
})

//check login
router.beforeEach((to, from, next) => {
    const isAdminRoute = to.path.startsWith('/admin');
    const isClientRoute = to.path.startsWith("");
    const isLoginAdmin = to.path.startsWith("/auth/login");
    //check khi cố truy cập home admin
    if (isAdminRoute) {
        console.log('khoarse c');
        const existRefreshToken = jwt.existRefreshToken;
        const isRememberMe = jwt.payload.remember;
        const expiryDate = jwt.expiryDate;
        //check token tồn tại , có nhớ mật khẩu , còn thời gian sử dụng
        if (existRefreshToken && isRememberMe == true && expiryDate) {
            return next();
        } else {
            return next("/auth/login");
        }
    }
    //truy cập ở trang admin
    if (isLoginAdmin) {
        console.log('a');

        const existRefreshToken = jwt.existRefreshToken;
        const expiryDate = jwt.expiryDate;
        if (existRefreshToken && expiryDate) {
            return next();
        } else {
            return next("/auth/login");
        }
    }
    if (isClientRoute) {}
    next();
});



export default router;