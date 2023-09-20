import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    followAccountAdmin(data) {
        return index.post(`/follow-account-admin`, (data));
    },
    deleteStatusAccountAdmin() {
        return index.delete(`/delete-account-admin`);
    },
}