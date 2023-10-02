import axios from "axios";

const url = 'https://www.24h.com.vn/lich-van-nien-c936.html';

async function cuttingStrings(string) {
    var regex = /^(.*?)\s*\(/;
    var result = regex.exec(string);
    if (result && result.length > 1) {
        return result[1].trim();
    } else {
        return null;
    }
}
// Gửi yêu cầu HTTP đến trang web.
export default {
    crawlDataLichVanLien() {
        var obj = {
            'dates': [],
            'events': [],
            'days': [],
            'good-hour': '',
            'time-string': '',
        };
        return axios.get(url)
            .then(async response => {
                let parser = new DOMParser();
                let doc = parser.parseFromString(response.data, 'text/html');
                // Lấy tiêu đề trang
                let month = doc.querySelectorAll('.month.bld');
                month.forEach(async element => {
                    await obj.dates.push(element.textContent.trim())
                });
                let day = doc.querySelectorAll('.day.bld');
                day.forEach(async element => {
                    await obj.days.push(element.textContent.trim())
                });
                let events = doc.querySelectorAll('.inner.txtCent .txt');
                events.forEach(async element => {
                    await obj.events.push(element.textContent.trim())
                });
                let timeStringNow = await cuttingStrings(doc.querySelector('h3.txt span.bld').textContent);
                obj["time-string"] = timeStringNow.trim();
                let goodHour = doc.querySelector('.clBlue').textContent.trim();
                obj["good-hour"] = goodHour;

                return obj;
            })
            .catch(error => {
                // Xử lý lỗi.
                console.error(error);
            });
    }
};
