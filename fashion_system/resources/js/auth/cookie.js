import ENV from '@/js/generalSetting/filterEnv.js'

const KEY_REFRESH_TOKEN = ENV.KEY_REFRESH_TOKEN
const TIME_REFRESH_TOKEN = ENV.TIME_REFRESH_TOKEN

function setCookie(cookieValue) {
    const cookieName = KEY_REFRESH_TOKEN;
    expirationDays = Number(TIME_REFRESH_TOKEN);
    const d = new Date();
    d.setTime(d.getTime() + (expirationDays * 24 * 60 * 60 * 1000));
    const expires = "expires=" + d.toUTCString();
    document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
}

function deleteCookie() {
    document.cookie = KEY_REFRESH_TOKEN + "=; expires=Thu, 01 Jan 2000 00:00:00 UTC; path=/;";
}
export default {
    setCookie,
    deleteCookie,
}