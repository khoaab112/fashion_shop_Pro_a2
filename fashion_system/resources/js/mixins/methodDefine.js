export default {
    methods: {
        goToPage(path) {
            this.$router.push(path);
        },
        checkStrangeCharacters(string) {
            var format = /[%^&*()+\=\[\]{};':"\\|,.<>\/?]+/;
            if (format.test(string)) {
                return true;
            } else {
                return false;
            }
        },
        formatTime(date) {
            const dateformat = new Date(date);
            const house = dateformat.getHours();
            const minute = dateformat.getMinutes();
            const seconds = dateformat.getSeconds();
            return house + ':' + minute + ':' + seconds
        },
        formatDate(date) {
            const dateformat = new Date(date);
            const day = dateformat.getDate();
            const month = Number(dateformat.getMonth()) + 1;
            const year = dateformat.getFullYear();
            return day + '-' + month + '-' + year;
        },
        //tạo kí tự ngẫu nhiên
        generateRandomCharacters(length) {
            var strings = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var randomCharacters = "";
            for (var i = 0; i < length; i++) {
                var location = Math.floor(Math.random() * strings.length);
                randomCharacters += strings.charAt(location);
            }
            return randomCharacters;
        },
        // check màu
        isColorCode(text) {
            // Sử dụng biểu thức chính quy để kiểm tra định dạng mã màu
            var colorRegex = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/;
            return colorRegex.test(text);
        }
    },
};