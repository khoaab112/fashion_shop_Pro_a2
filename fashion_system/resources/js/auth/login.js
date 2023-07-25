import cookie from "./cookie";
import localStorage from "./localStorage";
import sessionStorage from "./sessionStorage";
// import router from "@/js/routerVue/index.js";
import mixins from "@/js/mixins/getAddressFromRouter.js";

export default {
    methods: {
        loginSuccess(accessToken, refreshToken) {
            cookie.setCookie(refreshToken);
            localStorage.setAccessToken(accessToken);
            sessionStorage.setSession(JSON.stringify({ 'online': true }));
            this.$router.push(mixins.admin);
        },
    },
};