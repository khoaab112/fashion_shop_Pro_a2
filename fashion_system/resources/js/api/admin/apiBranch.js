import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getInfoBranch(id) {
        return index.get(`/branch/${id}`);
    },
    getBranches() {
        return index.get(`/branches`);
    }
}