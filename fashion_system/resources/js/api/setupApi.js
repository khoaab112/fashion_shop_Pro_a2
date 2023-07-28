import axios from "axios";
import localStorage from "@/js/auth/localStorage";
import router from "@/js/routerVue/index.js";
import method from "../mixins/methodDefine";

// sửa lại tên file là setting_api
//localStorage => accessToken
//cookie => refreshToken
const accessToken = localStorage.getAccessToken();
const apiClient = axios.create({
    baseURL: 'http://127.0.0.1:8000/api/auth', // Đặt URL gốc của API 
    timeout: 5000, // Đặt thời gian chờ tối đa cho mỗi yêu cầu
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
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
        const codeHttp = response.status;
        if (checkHttpResponse(codeHttp))
            return response;
    },
    (error) => {
        checkHttpResponse(error.response.status);
        return Promise.reject(error);
    }
);

function checkHttpResponse(codeHttp) {
    console.log(22, codeHttp);
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
            //login failed
            if (response.data.result_code == 200) {

            } else
                router.push({ path: "/error401" });
            break;
        case 402:
            break;
        case 403:
            router.push({ path: "/error403" });
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