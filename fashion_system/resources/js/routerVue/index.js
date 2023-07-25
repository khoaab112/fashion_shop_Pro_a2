import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import other from "./other";
import jwt from '@/js/auth/jwt.js';
import cookie from '@/js/auth/cookie';


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
    const isLoginAdmin = to.path === "/auth/login";
    console.log('bb');

    if (isAdminRoute) {

        const existRefreshToken = jwt.decodePayloadRefreshToken();
        const isRememberMe = (jwt.decodePayloadRefreshToken().remember) === 'true';
        const expiryDate = jwt.checkExpiryDateRefreshToken();
        const expiryDateAccessToken = jwt.checkExpiryDateAccessToken();
        const reservation = jwt.decodePayloadAccessToken().reservation;
        // mã tồn tại / access token cho nhớ / còn time / còn time
        if (existRefreshToken && reservation && expiryDate && expiryDateAccessToken) {
            console.log('aa');
            return next();
        }
        //check token tồn tại , có nhớ mật khẩu , còn thời gian sử dụng
        if (existRefreshToken && isRememberMe && expiryDate) {
            console.log('bb');

            return next();
        } else {
            return next("/auth/login");
        }
    }
    if (isLoginAdmin) {
        const existRefreshToken = jwt.decodePayloadRefreshToken();
        const expiryDate = jwt.checkExpiryDateRefreshToken();
        const isRememberMe = (jwt.decodePayloadRefreshToken().remember) === 'true';
        const expiryDateAccessToken = jwt.checkExpiryDateAccessToken();
        if (existRefreshToken && expiryDate && expiryDateAccessToken) {
            return next('/admin');
        }
        if (existRefreshToken && expiryDate && isRememberMe) {
            return next('/admin');
        }
    }
    return next();
});



export default router;