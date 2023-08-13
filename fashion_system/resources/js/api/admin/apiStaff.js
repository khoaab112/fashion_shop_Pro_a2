import index from '../setupApi.js';


export default {
    getInfoStaff(id) {
        return index.get(`/staff/${id}`);
    }
}