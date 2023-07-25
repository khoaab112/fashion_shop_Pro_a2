import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    loginAdmin(user) {
        return index.post(`/login`, (user));
    },
}