import API from '@/js/api/admin/apiAdmin.js'
import cookie from './cookie';
import localStorage from './localStorage';
import router from "@/js/routerVue/index.js";

export default {
    methods: {
        async logoutAdmin() {
            try {
                const response = await API.logout();
                if (response.data.result_code === 200) {
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    router.push({ path: "/auth/login" });
                    return true;
                } else {
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    router.push({ path: "/auth/login" });
                    return false;
                }
            } catch (error) {
                cookie.deleteCookie();
                localStorage.removeAccessToken();
                router.push({ path: "/auth/login" });
                return false;
            };
        },
    },
};