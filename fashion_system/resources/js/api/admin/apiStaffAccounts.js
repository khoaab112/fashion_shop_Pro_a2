import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getByPage(data) {
        return index.get(`/get-staff-accounts?page=${data.page}&record_number=${data.record_number}&count=${data.count}`);
    }
}
