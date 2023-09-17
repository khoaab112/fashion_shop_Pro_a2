import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    followAccountAdmin(data) {
        return index.post(`/follow-account-admin`, (data));
    },
    deleteStatusAccountAdmin(id) {
        return index.delete(`/delete-account-admin/${id}`, );
    },
}