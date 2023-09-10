import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    createReportTicket(data) {
        return index.post(`/report?type=${data.type}&source=${data.source}`);
    }
}