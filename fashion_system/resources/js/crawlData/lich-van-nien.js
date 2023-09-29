import axios from "axios";

const url = 'https://www.24h.com.vn/lich-van-nien-c936.html';

// Gửi yêu cầu HTTP đến trang web.
export default {
    crawlDataLichVanLien() {
        var obj = {
            'dates': [],
            'events': [],
            'good-hour': '',
        };
        return axios.get(url)
            .then(async response => {
                let parser = new DOMParser();
                let doc = parser.parseFromString(response.data, 'text/html');
                // Lấy tiêu đề trang
                let day = doc.querySelectorAll('.month.bld');
                day.forEach(async element => {
                    await obj.dates.push(element.textContent.trim())
                });
                let events = doc.querySelectorAll('.inner.txtCent .txt');
                events.forEach(async element => {
                    await obj.events.push(element.textContent.trim())
                });
                let goodHour = doc.querySelectorAll('.clBlue').textContent;
                obj["good-hour"] = goodHour;
                console.log(obj);
                return obj;
            })
            .catch(error => {
                // Xử lý lỗi.
                console.error(error);
            });
    }
};