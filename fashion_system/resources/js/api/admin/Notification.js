import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getNotificationByIdStaff() {
        return index.get(`/get-notifications`);
    },
    CheckForUnreadNotifications(id) {
        return index.get(`/check-notifications/${id}`);
    },
}