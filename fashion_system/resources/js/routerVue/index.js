import { createRouter, createWebHistory } from "vue-router";
import admin from "./admin";
import auth from "./auth";
import other from "./other";
import jwt from '@/js/auth/jwt.js';


const routes = [
    ...other.error,
    ...other.error404,
    ...admin.admin,
    ...admin.home,
    ...auth.authAdmin,
    // ...auth.authCustomer,
];
const router = createRouter({
    history: createWebHistory(),
    routes
})

//check login
router.beforeEach((to, from, next) => {
    if (to.path.startsWith('/api'))
        return next('/error404');

    const isAdminRoute = to.path.startsWith('/admin') || to.path == "/";
    const isLoginAdmin = to.path === "/auth/login" || to.path == "/";
    if (isAdminRoute) {
        const existRefreshToken = jwt.decodePayloadRefreshToken();
        const isRememberMe = (jwt.decodePayloadRefreshToken().remember) === 'true';
        const expiryDate = jwt.checkExpiryDateRefreshToken();
        const expiryDateAccessToken = jwt.checkExpiryDateAccessToken();
        const reservation = jwt.decodePayloadAccessToken().reservation;
        // mã tồn tại / access token cho nhớ / còn time / còn time
        if (existRefreshToken && reservation && expiryDate && expiryDateAccessToken) {
            if (to.fullPath == '/admin' || to.path == "/") {
                return next({ name: 'home' });
            }
            return next();
        }
        //check token tồn tại , có nhớ mật khẩu , còn thời gian sử dụng
        if (existRefreshToken && isRememberMe && expiryDate) {
            if (to.fullPath == '/admin' || to.path == "/") {
                return next({ name: 'home' });
            }
            return next();
        } else {
            return next({ name: 'login' });
        }
    }
    if (isLoginAdmin) {
        const existRefreshToken = jwt.decodePayloadRefreshToken();
        const expiryDate = jwt.checkExpiryDateRefreshToken();
        const isRememberMe = (jwt.decodePayloadRefreshToken().remember) === 'true';
        const expiryDateAccessToken = jwt.checkExpiryDateAccessToken();
        if (existRefreshToken && expiryDate && expiryDateAccessToken) {
            return next({ name: 'home' });
        }
        if (existRefreshToken && expiryDate && isRememberMe) {
            return next({ name: 'home' });
        }
    }
    return next();
});

export default router;