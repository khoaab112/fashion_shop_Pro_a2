import axios from "axios";

// sửa lại tên file là setting_api
//localStorage => accessToken
//cookie => refreshToken
const apiClient = axios.create({
    baseURL: 'https://api.openweathermap.org/data/2.5',
    timeout: 5000, //  thời gian chờ tối đa cho mỗi yêu cầu
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
    }
});


export default {
    getOpenWeatherMap(data) {
        const lat = data.lat;
        const lon = data.lon;
        const units = 'metric';
        const appid = '86898262411df86d21f2d61b8300d1c4';
        return apiClient.get(`weather?appid=${appid}&units=${units}&lat=${lat}&lon=${lon}`);
    }
};