import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    createTypeReports(data) {
        return index.post(`/type-reports`, (data));
    },
    getListTypeReportsByPage(data) {
        return index.get(`/type-reports?page=${data.page}&record_number=${data.record_number}&count=${data.count}`);
    },
    changeTypeReports(data) {
        return index.put(`/change-type-report`, (data));
    },
    deleteTypeReports(data) {
        return index.delete(`/delete-type-report/${data.id}`);
    },
}
