import ENV from '@/js/generalSetting/filterEnv.js'

const KEY_ACCESS_TOKEN = ENV.KEY_ACCESS_TOKEN

function getSession() {
    return sessionStorage.getItem(KEY_ACCESS_TOKEN);
}

function setSession(value) {
    sessionStorage.setItem(KEY_ACCESS_TOKEN, value);
}

function clearSession() {
    sessionStorage.clear();
}
export default {
    getSession,
    setSession,
    clearSession,
}