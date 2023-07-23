import cookie from './cookie';
const refreshToken = cookie.getRefreshToken();
var existRefreshToken = refreshToken ? true : false;
try {
    var payload = await decodePayload(refreshToken);
    var expiryDate = await checkExpiryDate(payload.exp);
} catch (error) {
    console.error('Invalid JWT:', error.message);
}

function decodePayload(payload) {
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
}

function checkExpiryDate(exp) {
    const currentTimeInSeconds = Math.floor(Date.now() / 1000);
    return currentTimeInSeconds <= exp
}
export default {
    payload,
    existRefreshToken,
    expiryDate,
}