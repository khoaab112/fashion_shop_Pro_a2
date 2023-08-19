import ENV from '@/js/generalSetting/filterEnv.js'

const KEY_ACCESS_TOKEN = ENV.KEY_ACCESS_TOKEN

function getAccessToken() {
    return localStorage.getItem(KEY_ACCESS_TOKEN);
}

function setAccessToken(value) {
    localStorage.setItem(KEY_ACCESS_TOKEN, value);
}

function clearStorage() {
    localStorage.clear();
}

function removeAccessToken() {
    localStorage.removeItem(ENV.KEY_ACCESS_TOKEN);
}

function getLocalStorage(key) {
    return localStorage.getItem(key);

}

function setLocalStorage(key, value) {
    localStorage.setItem(key, value);
}

function removeLocalStorageByKey(key) {
    localStorage.removeItem(key);

}
export default {
    getAccessToken,
    setAccessToken,
    clearStorage,
    removeAccessToken,
    getLocalStorage,
    setLocalStorage,
    removeLocalStorageByKey,
}