'use strict';
var infoStaff = '';

const getGlobalVariableInfoStaff = () => infoStaff;
const setGlobalVariableInfoStaff = (newValue) => {
    if (!newValue) return false;
    infoStaff = {
        'id': newValue.id,
        'name': newValue.name,
        'code_staff': newValue.code_staff,
        'branch_id': newValue.branch_id,
        'position_id': newValue.position_id,
        'email': newValue.email,
        'img': newValue.img,
        'account': newValue.account,
        'jod_roles': '',
        'address': newValue.address,
        'phone_number': newValue.phone_number,
        'birthday': newValue.birthday,
        'sex': newValue.sex,
    }
    return true;
};
export default {
    getGlobalVariableInfoStaff,
    setGlobalVariableInfoStaff,
}