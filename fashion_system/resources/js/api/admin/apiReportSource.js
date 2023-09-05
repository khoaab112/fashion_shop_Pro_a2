import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    createReportSource(data) {
        return index.post(`/report-source`, (data));
    },
    getListReportSourceByPage(data) {
        return index.get(`/report-source?page=${data.page}&record_number=${data.record_number}&count=${data.count}`);
    },
    changeReportSource(data) {
        return index.put(`/change-report-source`, (data));
    },
    deleteReportSource(data) {
        return index.delete(`/delete-report-source/${data.id}`);
    },
}