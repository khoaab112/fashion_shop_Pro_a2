import index from '../setupApi.js';

export default {
    getCustomers(data) {
        return index.get(`/customers/?page=${data.page}&record_number=${data.record_number}&count=${data.count}&active=${data.active??true}`);
    },
}
