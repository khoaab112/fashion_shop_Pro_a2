import index from '../setupApi.js';

export default {
    rank() {
        return index.get(`rank`);
    },
    statusChange(data) {
        return index.put(`/rank/status/${data.id}`, (data));
    },
    update(data, id) {
        return index.put(`/update/${id}`, (data));
    },
    create(data) {
        return index.post(`/rank`, data);
    },
    remove(id) {
        return index.delete(`/rank/${id}`);
    }
}
