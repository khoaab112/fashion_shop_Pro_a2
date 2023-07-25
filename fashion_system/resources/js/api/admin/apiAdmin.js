import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    loginAdmin(user) {
        return index.post(`/login`, (user));
    },
    checkToken(token) {
        return index.post(`/decodeJwt`, (token));
    }
}