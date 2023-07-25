import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    loginAdmin() {
        return index.post(`/login`);
    },
}