import API from '@/js/api/admin/apiAdmin.js'
import cookie from './cookie';
import localStorage from './localStorage';
import router from "@/js/routerVue/index.js";
import sessionStorage from '@/js/auth/sessionStorage.js'
import apiManagerAccount from '@/js/api/broadcasting/apiManagerAccount.js';

export default {
    methods: {
        async logoutAdmin() {
            try {
                const resultEcho = await apiManagerAccount.deleteStatusAccountAdmin();
                const response = await API.logout();
                if (response.data.result_code === 200) {
                    cookie.deleteCookie();
                    sessionStorage.clearSession();
                    localStorage.removeAccessToken();
                    router.push({ path: "/auth/login" });
                    return true;
                } else {
                    sessionStorage.clearSession();
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    router.push({ path: "/auth/login" });
                    return false;
                }
            } catch (error) {
                sessionStorage.clearSession();
                cookie.deleteCookie();
                localStorage.removeAccessToken();
                router.push({ path: "/auth/login" });
                return false;
            };
        },
    },
};