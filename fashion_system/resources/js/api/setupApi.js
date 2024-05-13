import axios from "axios";
import localStorage from "@/js/auth/localStorage";
import logout from "@/js/auth/logout.js";
import jwt from "@/js/auth/jwt.js";
import router from "@/js/routerVue/index.js";
import ENV from "@/js/generalSetting/filterEnv.js";
//broadcasting
import { configureEcho } from "@/js/generalSetting/configureEcho.js";


// sửa lại tên file là setting_api
//localStorage => accessToken
//cookie => refreshToken
console.log(ENV.APP_URL)
const accessToken = localStorage.getAccessToken();
const apiClient = axios.create({
    baseURL: `${ENV.APP_URL}/api/auth`,
    timeout: 30000, //  thời gian chờ tối đa cho mỗi yêu cầu
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': (accessToken ? 'Bearer ' + accessToken : ''),
    }
});

// Interceptor trước khi gửi yêu cầu
apiClient.interceptors.request.use(config => {
    // Kiểm tra và thêm accessToken vào header (nếu có)
    const accessToken = localStorage.getAccessToken();
    if (accessToken) {
        config.headers['Authorization'] = 'Bearer ' + accessToken;
    }
    return config;
}, error => {
    // Xử lý lỗi nếu có
    return Promise.reject(error);
});


//xử lý kết quả trả về trước rồi mới trả về lơi gọi
apiClient.interceptors.response.use(
    (response) => {
        var numberRequest = 0;
        const codeHttp = response.status;
        //trả về assetToken
        if (codeHttp == 200 && response.data.result_code == 401 && response.data.status == 'success') {
            const token = response.data.results;
            numberRequest++;
            if (numberRequest > 2) {
                return Promise.reject(new Error('Lỗi bất thường từ người dùng'));
            }
            localStorage.clearStorage();
            localStorage.setAccessToken(token);
            //broadcasting
            const echo = configureEcho(token);
            window.Echo.disconnect();
            window.Echo = echo;
            return apiClient.request(response.config);
        }
        if (checkHttpResponse(codeHttp, response))
            numberRequest = 0;
        return response;
    },
    (error) => {
        checkHttpResponse(error.response.status, error.response);
        return Promise.reject(error);
    }
);

async function checkHttpResponse(codeHttp, response) {

    switch (codeHttp) {
        case 200:
            break;
        case 302:
            //logout
            break;
        case 400:
            router.push({ path: "/error404" });
            break;
        case 401:
            //request failed
            if (response.data.results == "CANCEL_SESSION" && response.data.status == 'error' && response.data.result_code == 401) {
                await logout.methods.logoutAdmin();
                // router.push({ path: "/auth/login" });
                break;
            }
            if (response.data.results == "Unauthorized" && response.data.status == 'error' && response.data.result_code == 401) {
                await logout.methods.logoutAdmin();
                // router.push({ path: "/auth/login" });
                break;
            }
            break;
        case 402:
            break;
        case 403:
            if (response.data.results == 'role not have access' && response.data.status == 'error') {
                // await logout.methods.logoutAdmin();
                router.push({ name: "homeClient" });
            } else {
                router.push({ path: "/error403" });
            }
            break;
        case 404:
            router.push({ path: "/error404" });
            break;
        case 413:
            break;
        case 429:
            break;
        case 500:
            router.push({ path: "/error500" });
            break;
        default:
            router.push({ path: "/error500" });
            //500

    };
    if (codeHttp == 200) return true;
    return false;
};
export default apiClient;