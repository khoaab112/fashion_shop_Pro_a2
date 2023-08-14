import index from '../setupApi.js';


export default {
    getInfoStaff(id) {
        return index.get(`/staff/${id}`);
    },
    changeAvatarStaffById(file, id) {
        return index.post(`/avatar-staff/${id}`, (file));
    }
}
