import cookie from "./cookie";
import localStorage from "./localStorage";
import mixins from "@/js/mixins/getAddressFromRouter.js";

export default {
    methods: {
        loginSuccess(accessToken, refreshToken) {
            cookie.setCookie(refreshToken);
            localStorage.setAccessToken(accessToken);
            return this.$router.push(mixins.home);
        },
    },
};