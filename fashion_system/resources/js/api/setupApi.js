import axios from "axios";
import localStorage from "@/js/auth/localStorage";
// sửa lại tên file là setting_api
//localStorage => accessToken
//cookie => refreshToken
const accessToken = localStorage.getAccessToken();


const apiClient = axios.create({
    baseURL: 'http://127.0.0.1:8000/api/auth', // Đặt URL gốc của API của bạn
    timeout: 5000, // Đặt thời gian chờ tối đa cho mỗi yêu cầu
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': accessToken ? 'Bearer ' + accessToken : '',
    }
});
//xử lý kết quả trước rồi mới trả về lơi gọi
apiClient.interceptors.response.use(
    (response) => {
        const codeHttp = response.status;
        switch (codeHttp) {
            case 200:
                break;
            case 400:
                break;
            case 401:
                break;
            case 402:
                break;
            case 403:
                break;
            case 404:
                break;
            case 413:
                break;
            case 429:
                break;
            case 500:
                break;
            default:
                //500

        };

    },
    (error) => {
        console.error('API Connection Error:', error);
        return Promise.reject(error);
    }
);
export default apiClient;