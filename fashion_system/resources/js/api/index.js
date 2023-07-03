import axios from "axios";
// sửa lại tên file là setting_api
const apiClient = axios.create({
    baseURL: 'http://127.0.0.1:8000/api', // Đặt URL gốc của API của bạn
    timeout: 5000 // Đặt thời gian chờ tối đa cho mỗi yêu cầu
});

export default apiClient;
