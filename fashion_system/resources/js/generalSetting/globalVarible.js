'use strict';
import Vue from 'vue';

//tên quyền_nhan_vien chi nhanh tên_quyen_tai_khoan

async function setGlobalStaffInfo(key, value) {

    Vue.prototype.$globalStaffInfo = {
        'name': value,
        'jod_roles': '',
        'branches': '',
        'account_role': '',
    };

};
// export default {

// }