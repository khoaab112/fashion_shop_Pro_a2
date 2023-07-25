import cookie from './cookie';
import localStorage from './localStorage.js';

function decodePayloadRefreshToken() {
    var payload = cookie.getRefreshToken();
    if (!payload) return false;
    const parts = payload.split('.');
    if (parts.length !== 3) {
        return false;
    }
    // Lấy phần payload của JWT (phần thứ hai)
    const encodedPayload = parts[1];
    try {
        return payload = JSON.parse(atob(encodedPayload.replace(/-/g, '+').replace(/_/g, '/')));
    } catch (error) {
        return false;
    }
};

function decodePayloadAccessToken() {
    var payload = localStorage.getAccessToken();
    if (!payload) return false;
    const parts = payload.split('.');
    if (parts.length !== 3) {
        return false;
    }
    // Lấy phần payload của JWT (phần thứ hai)
    const encodedPayload = parts[1];
    try {
        return payload = JSON.parse(atob(encodedPayload.replace(/-/g, '+').replace(/_/g, '/')));
    } catch (error) {
        return false;
    }
};

function checkExpiryDateRefreshToken() {
    const exp = decodePayloadRefreshToken().exp;
    const currentTimeInSeconds = Math.floor(Date.now() / 1000);
    return currentTimeInSeconds <= exp
};

function checkExpiryDateAccessToken() {
    const exp = decodePayloadAccessToken().exp;
    const currentTimeInSeconds = Math.floor(Date.now() / 1000);
    return currentTimeInSeconds <= exp
}


export default {
    decodePayloadRefreshToken,
    decodePayloadAccessToken,
    checkExpiryDateRefreshToken,
    checkExpiryDateAccessToken,
}