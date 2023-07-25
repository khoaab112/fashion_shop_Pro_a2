import cookie from "./cookie";
import localStorage from "./localStorage";
// import router from "@/js/routerVue/index.js";
import mixins from "@/js/mixins/getAddressFromRouter.js";

export default {
    methods: {
        loginSuccess(accessToken, refreshToken) {
            cookie.setCookie(refreshToken);
            localStorage.setAccessToken(accessToken);
            this.$router.push(mixins.admin);
        },
    },
};