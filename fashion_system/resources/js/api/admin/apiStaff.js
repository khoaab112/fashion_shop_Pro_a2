import index from '../setupApi.js';


export default {
    getInfoStaff(id) {
        return index.get(`/staff/${id}`);
    },
    changeAvatarStaffById(file, id) {
        return index.post(`/avatar-staff/${id}`, (file));
    },
    changeBackgroundStaffById(file, id) {
        return index.post(`/background-staff/${id}`, (file));
    },
    changePassword(staffData) {
        return index.put(`/change-password`, (staffData));
    },
    updateDataStaff(staffData) {
        return index.put(`/update-info-staff`, (staffData));
    },
    editCarefully(staffData) {
        return index.put(`/edit-carefully`, (staffData));
    },
}