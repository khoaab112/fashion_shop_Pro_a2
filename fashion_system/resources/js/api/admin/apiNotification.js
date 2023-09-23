import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getNotificationByIdStaff(data) {
        return index.get(`/get-notifications?page=${data.page}&record_number=${data.record_number}&count=${data.count}`);
    },
    CheckForUnreadNotifications(id) {
        return index.get(`/check-notifications/${id}`);
    },
    changeWatchedStatus(staffId) {
        return index.put(`/change-watched-notification/${staffId}`);
    },
    changeWatchedStatusByID(arr) {
        return index.put(`/change-watched-notification`, (arr));
    },
}