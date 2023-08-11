import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import customer from "./customer";
import auth from "./auth";
import other from "./other";
import jwt from '@/js/auth/jwt.js';


const routes = [
    ...other.error,
    ...other.error404,
    ...customer.home,
    ...customer.test,
    ...admin.admin,
    ...auth.authAdmin,
    ...auth.authCustomer,
];
const router = createRouter({
    history: createWebHistory(),
    routes
})

//check login
router.beforeEach((to, from, next) => {
    const isAdminRoute = to.path.startsWith('/admin');
    const isLoginAdmin = to.path === "/auth/login";
    if (isAdminRoute) {

        const existRefreshToken = jwt.decodePayloadRefreshToken();
        const isRememberMe = (jwt.decodePayloadRefreshToken().remember) === 'true';
        const expiryDate = jwt.checkExpiryDateRefreshToken();
        const expiryDateAccessToken = jwt.checkExpiryDateAccessToken();
        const reservation = jwt.decodePayloadAccessToken().reservation;
        // mã tồn tại / access token cho nhớ / còn time / còn time
        if (existRefreshToken && reservation && expiryDate && expiryDateAccessToken) {
            if (to.fullPath == '/admin') {
                return next("/admin/home");
            }
            return next();
        }
        //check token tồn tại , có nhớ mật khẩu , còn thời gian sử dụng
        if (existRefreshToken && isRememberMe && expiryDate) {
            if (to.fullPath == '/admin') {
                return next("/admin/home");
            }
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
            return next('/admin/home');
        }
        if (existRefreshToken && expiryDate && isRememberMe) {
            return next('/admin/home');
        }
    }
    return next();
});



export default router;
