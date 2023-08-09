'use strict';
let infoStaff = '';

const getGlobalVariableInfoStaff = () => infoStaff;
const setGlobalVariableInfoStaff = (newValue) => {
    if (!newValue) return false;
    infoStaff = {
        'name': newValue.name,
        'code_staff': newValue.code_staff,
        'branch_id': newValue.branch_id,
        'position_id': newValue.position_id,
        'email': newValue.email,
        'img': newValue.img,
        'account': newValue.account,
        'jod_roles': '',
    }
    return true;
};
export default {
    getGlobalVariableInfoStaff,
    setGlobalVariableInfoStaff,
}
