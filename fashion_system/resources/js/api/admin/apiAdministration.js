import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getAdministrations() {
        return index.get(`/administrations`);
    }
}