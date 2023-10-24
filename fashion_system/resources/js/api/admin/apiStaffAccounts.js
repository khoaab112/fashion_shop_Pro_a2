import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getByPage(data) {
        return index.get(`/get-staff-accounts?page=${data.page}&record_number=${data.record_number}&count=${data.count}&active=${data.active??true}`);
    },
    getStaffDetail(id) {
        return index.get(`/staff-detail/${id}`);
    },
    lockAccount(data) {
        return index.put(`/lock-account/${data.idAccount}`, (data));
    },
    indirectlyDisconnect(id) {
        return index.delete(`/indirectly-disconnect/${id}`);
    },
    editRequest(data, id) {
        return index.post(`/edit-request/${id}`, (data));
    },
    activeStaff(staffId) {
        return index.put(`/active-staff/${staffId}`);
    }
}