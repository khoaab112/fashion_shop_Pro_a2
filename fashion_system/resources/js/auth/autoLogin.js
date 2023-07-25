import cookie from "./cookie";
import localStorage from "./localStorage";
import sessionStorage from "./sessionStorage";
import API from '@/js/api/admin/apiAdmin.js'

// import router from "@/js/routerVue/index.js";

function autoLogin() {
    var remember = { 'remember_token': true }
    API.loginAdmin(remember).then(response => {
            return response.data.result_code;
        })
        .catch(error => {
            return false;
        });
};

function decodeJWT() {
    var token = localStorage.getAccessToken();
    API.checkToken(token).then(response => {
            console.log(response.data.result_code);
            return response.data.result_code;
        })
        .catch(error => {
            return false;
        });
};
export default {
    autoLogin,
    decodeJWT
};