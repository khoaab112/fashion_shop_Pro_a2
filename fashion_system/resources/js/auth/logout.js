import API from '@/js/api/admin/apiAdmin.js'
import cookie from './cookie';
import localStorage from './localStorage';

export default {
    methods: {
        logoutAdmin() {
            API.logout().then(response => {
                    var result = true;
                    if (response.data.result_code == 200) {
                        result = true;
                    } else result = false;
                    cookie.deleteCookie();
                    localStorage.removeAccessToken();
                    return result;
                })
                .catch(error => {
                    return false;
                });
        }
    },
};