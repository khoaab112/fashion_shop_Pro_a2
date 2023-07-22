import axios from "axios";
// sửa lại tên file là setting_api
console.log("ass");
const apiClient = axios.create({
    baseURL: 'http://127.0.0.1:8000/api/auth', // Đặt URL gốc của API của bạn
    timeout: 5000, // Đặt thời gian chờ tối đa cho mỗi yêu cầu
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer '
    }
});

export default apiClient;