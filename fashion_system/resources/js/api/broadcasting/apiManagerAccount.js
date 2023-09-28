import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    followAccountAdmin(data) {
        return index.post(`/follow-account-admin`, (data));
    },
    deleteStatusAccountAdmin() {
        return index.delete(`/delete-account-admin`);
    },
    deleteListAccountAdmin() {
        return index.delete(`/reset-list-account`);
    },
}