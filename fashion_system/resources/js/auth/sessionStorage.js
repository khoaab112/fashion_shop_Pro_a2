import ENV from '@/js/generalSetting/filterEnv.js'

// const KEY_ACCESS_TOKEN = ENV.KEY_ACCESS_TOKEN

function getSession(key) {
    return sessionStorage.getItem(key);
}

function setSession(key, value) {
    sessionStorage.setItem(key, value);
}

function clearSession() {
    sessionStorage.clear();
}
export default {
    getSession,
    setSession,
    clearSession,
}