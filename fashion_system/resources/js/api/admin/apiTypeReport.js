import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    createTypeReports(data) {
        return index.post(`/type-reports`, (data));
    }
}