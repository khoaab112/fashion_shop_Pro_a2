import API from '@/js/api/admin/apiAdmin.js'
import cookie from './cookie';
import localStorage from './localStorage';

export default {
    methods: {
        async logoutAdmin() {
            try {
                const response = await API.logout();
                if (response.data.result_code === 200) {
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    return true;
                } else {
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    return false;
                }
            } catch (error) {
                console.error(error);
                return false;
            };
        },
    },
};