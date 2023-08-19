<template>
    <div id="profile-staff">
        <!-- <section id="background-info-staff" style="
        background-image: url('https://wallpapers.com/images/hd/abstract-background-6m6cjbifu3zpfv84.jpg');
      "> -->
        <section id="background-info-staff" @mouseenter="eventHoverBackground(true)"
            @mouseleave="eventHoverBackground(false)" :style="`background-image: url(${backgroundStaff})`">
            <avatar :src="urlAvatar" class="avatar-staff" @click="UploadAvatar('AVT')" @image-error="failureTracking">
            </avatar>
            <div class="show-background" v-if="isShowIconEyeBackground">
                <font-awesome-icon icon="fa-regular fa-eye" fade class="icon-eye" @click="showPopupBackgroundStaff()" />
            </div>
            <div class="action-change-bg" @click="UploadAvatar('BG')">
                <font-awesome-icon icon="fa-solid fa-palette" style="color: #ffffff" />
            </div>
        </section>
        <section id="avatar-staff">
            <div class="basic-information">
                <InfoStaff v-if="!isShowInfoBase" class="staff-name"></InfoStaff>
                <div class="staff-name" v-if="isShowInfoBase">
                    <h3>{{ staffName }}</h3>
                    <div>
                        <p>
                            <strong>Giới tính&emsp;:&emsp;</strong>
                            <span>{{ sex ? "Nam" : "Nữ" }}</span>
                            &ensp;
                            <font-awesome-icon icon="fa-solid fa-mars" v-show="sex" style="color: #6caddd" />
                            <font-awesome-icon icon="fa-solid fa-venus" v-show="!sex" style="color: #e66c95" />
                        </p>
                        <p>
                            <strong class="with-i">Tuổi&emsp;:&emsp;</strong><span>{{ yearOld }}</span>
                        </p>
                    </div>
                </div>
                <div class="action-page" :class="{ 'animate__animated animate__fadeInRight': isShowAction }">
                    <font-awesome-icon icon="fa-solid fa-gears" class="icon" @click="showAction()" />
                    <div class="list-action" v-if="isShowAction">
                        <div class="action-change-pass" @click="showPopupChangePassword = true">
                            Đổi mật khẩu
                        </div>
                        <hr class="line-action" />
                        <div class="action-change-info" :class="{ tick: isEdit }" @click="showEdit()">
                            {{ !isEdit ? "Cập nhật thông tin" : "Thông tin" }}
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
        <hr class="line-hr" />
        <br />
        <section id="content-staff" v-show="!isEdit">
            <div class="container">
                <div class="row info">
                    <twoColumnsOfData class="col-lg-6 col-sm-12 col-info-staff" v-show="!isShowDetails"></twoColumnsOfData>
                    <div class="col-lg-6 col-sm-12 col-info-staff" v-show="isShowDetails">
                        <h4>Thông tin nhân viên</h4>
                        <p>
                            <strong>Họ và tên :</strong><span>{{ staffName }}</span>
                        </p>
                        <p>
                            <strong>Giới tính :</strong><span>{{ sex ? "Nam" : "Nữ" }}</span>
                        </p>
                        <p>
                            <strong>Ngày sinh :</strong><span>{{ birthDay }}</span>
                        </p>
                        <p>
                            <strong>Địa chi:</strong><span>{{ address }}</span>
                        </p>
                        <p>
                            <strong>Số điện thoại:</strong><span>{{ phoneNumber }}</span>
                        </p>
                        <p>
                            <strong>email cá nhân:</strong><span>{{ email }}</span>
                        </p>
                    </div>
                    <twoColumnsOfData class="col-lg-6 col-sm-12 col-info-position text-end" v-show="!isShowDetails">
                    </twoColumnsOfData>
                    <div class="col-lg-6 col-sm-12 col-info-position " v-show="isShowDetails">
                        <h4>Thông tin chức vụ</h4>
                        <p>
                            <strong>Chức vụ:</strong><span>{{ position_id }}</span>
                        </p>
                        <p>
                            <strong>Thuộc chi nhánh:</strong><span>{{ branch.name }}&ensp;
                                <font-awesome-icon icon="fa-solid fa-location-dot" style="color: #6caddd" /></span>
                        </p>
                        <p>
                            <strong>Thời gian vào làm:</strong><span>{{ dateStartWork }}</span>
                        </p>
                        <p><strong>Quyền tài khoản:</strong><span>123123</span></p>
                        <p><strong>Quyền tài khoản:</strong><span>123123</span></p>
                    </div>
                </div>
            </div>
        </section>
        <!-- box edit -->
        <section class="edit-info container " v-if="isEdit">
            <div>
                <strong>Giới tính</strong>
                <el-radio-group v-model="sex" class="ml-4 justify-content-end">
                    <el-radio :label="true" size="large">Nam</el-radio>
                    <el-radio :label="false" size="large">Nữ</el-radio>
                </el-radio-group>
            </div>
            <div class="">
                <strong>Ngày sinh</strong>
                <el-date-picker v-model="birthDay" type="date" placeholder="Chọn" />
            </div>
            <div>
                <strong>Địa chỉ</strong>
                <el-input v-model="address" :rows="2" type="textarea" placeholder="Địa chỉ" autocomplete="on"
                    class="edit-address" />
            </div>
            <div class="submit">
                <button type="button" class="btn btn-primary ">Cập nhật<loadingSpinner></loadingSpinner></button>
            </div>
        </section>
        <!-- dialog change password -->
        <el-dialog v-model="showPopupChangePassword" title="Đổi mật khẩu" width="30%" align-center @close="clearPassword"
            class="group-change-password">
            <form action="" class="from-change-password">
                <p class="text-center">
                    <strong>Tài khoản : </strong><span>{{ userName }}</span>
                </p>
                <div>
                    <span>Mật khẩu cũ</span><input v-model="password.passwordOld" type="password" class="pass-old float-end"
                        placeholder="Mật khẩu cũ" autocomplete="off" />
                </div>
                <br />
                <div>
                    <span>Mật khẩu mới</span>
                    <input type="password" v-model="password.passwordNew" class="pass-new float-end"
                        placeholder="Mật khẩu mới" autocomplete="off" />
                </div>
                <br />
                <div>
                    <span>Xác thực</span>
                    <input type="password" v-model="password.passwordConfirm" class="pass-confirm float-end"
                        placeholder="Xác nhận" autocomplete="off" />
                </div>
                <div class="captcha">
                    <input type="text" class="" placeholder="mã xác thức ->" v-model="inputValue">
                    <VueClientRecaptcha ref="recaptcha" :value="inputValue" @getCode="getCaptchaCode"
                        @isValid="checkValidCaptcha" class="code-captcha" />
                </div>
            </form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="showPopupChangePassword = false">Đóng</el-button>
                    <el-button type="primary" @click="changePassword">
                        Xác nhận
                    </el-button>
                </span>
            </template>
        </el-dialog>
    </div>
    <upload-avatar :type="typeImg" :show="showUploadFile" :data="staff" @hide-upload="emitUpload"
        @upload-success="uploadSuccess"></upload-avatar>

    <el-dialog v-model="showPopupBackground" title="Ảnh" width="70%" draggable>
        <div :style="`background-image: url(${backgroundStaff})`" class="show-background-popup"></div>
    </el-dialog>
</template>

<script>
import avatar from "../../components/avatar.vue";
import "animate.css";
import UploadAvatar from "../../components/popupUploadAvatar.vue";
import globalVariable from "@/js/generalSetting/globalVariable.js";
import apiBranch from "@/js/api/admin/apiBranch.js";
import method from "@/js/mixins/methodDefine.js";
import loadingSpinner from "../../components/loadingSpinner.vue";
import InfoStaff from "../../components/svgComponents/infoStaff.vue";
import twoColumnsOfData from "../../components/svgComponents/twoColumnsOfData.vue";
import jwt from "@/js/auth/jwt.js";
import logoutAdmin from "@/js/auth/logout.js";
import { ElNotification } from 'element-plus'
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";
import backgroundAdminDefault from "@/public/images/staff/backgroundStaff.png";
import apiStaff from '@/js/api/admin/apiStaff.js';

const pathPublic = "@public/data_client/"
export default {
    name: "staffProfile",
    components: {
        avatar,
        UploadAvatar,
        loadingSpinner,
        InfoStaff,
        twoColumnsOfData,
    },
    setup() {
    },
    directives: {},
    data() {
        return {
            userName: null,
            img: null,
            isShowAction: false,
            centerDialogVisible: false,
            isEdit: false,
            yearOld: null,
            sex: null,
            address: null,
            showUploadFile: false,
            typeImg: null,
            staffName: null,
            staff: null,
            pollingInterval: null,
            birthDay: null,
            phoneNumber: null,
            email: null,
            position_id: null,
            dateStartWork: null,
            idStaff: null,
            branch: {
                name: "",
            },
            isShowInfoBase: false,
            isShowDetails: false,
            // isAvatarError: false,
            urlAvatar: null,
            backgroundStaff: '',
            isShowIconEyeBackground: false,
            showPopupBackground: false,
            password: {
                passwordNew: "",
                passwordOld: "",
                passwordConfirm: "",
            },
            showPopupChangePassword: false,
            // emitUpload:null,
            inputValue: '',
            captcha: null,
            isSuccessCaptcha: false,
            getCaptchaCode: (value) => { this.captcha = value },
            checkValidCaptcha: (value) => { this.isSuccessCaptcha = value },
        };
    },
    watch: {
        img(value) {
            this.checkImageAdmin(this.img);
        },

        // backgroundStaff(value) {
        //     this.checkBackground(this.backgroundStaff);
        // }
    },
    async created() {
        this.startPolling();
        this.checkImageAdmin(this.img);
        this.checkBackground(this.backgroundStaff);
        this.getInfoAccout();
        // this.checkBackground(this.backgroundStaff);

    },
    mounted() {
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        showAction() {
            this.isShowAction = !this.isShowAction;
        },
        showEdit() {
            this.isEdit = !this.isEdit;
        },
        UploadAvatar(value) {
            this.showUploadFile = !this.showUploadFile;
            this.typeImg = value;
        },
        //theo dõi sự kiện thoát upload file
        emitUpload(value) {
            this.showUploadFile = value;

        },
        uploadSuccess(value) {
            if (value) {
                this.getBackInformationStaff();
            }
        },
        failureTracking(value) {
            this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href
        },
        async startPolling() {
            this.defaultShow();
            const intervalTime = 1000; // 1 giây
            const maxDuration = 10000; // 10 giây
            const startTime = Date.now();
            this.pollingInterval = setInterval(async () => {
                this.staff = await globalVariable.getGlobalVariableInfoStaff();
                if (this.staff || Date.now() - startTime > maxDuration) {
                    // Dừng polling
                    clearInterval(this.pollingInterval);
                    // Tiếp tục
                    if (this.staff) {
                        this.idStaff = this.staff.id;
                        this.isShowInfoBase = true;
                        this.staffName = this.staff.name;
                        this.sex = this.staff.sex;
                        this.yearOld = this.currentAge(this.staff.birthday);
                        this.birthDay = this.staff.birthday;
                        this.address = this.staff.address;
                        this.phoneNumber = this.staff.phone_number;
                        this.email = this.staff.email;
                        this.position_id = this.staff.position_id;
                        this.img = this.staff.img;
                        // this.backgroundStaff= this.staff.background;
                        this.checkImageAdmin(this.img);
                        this.checkBackground(this.staff.background);
                        await this.getBranchById(this.staff.branch_id);
                        this.dateStartWork = method.methods.formatDate(this.staff.created_at);
                    } else {
                        ElNotification({
                            title: "Error",
                            message: "Có lỗi bất thường",
                            type: "error",
                        });
                    }
                }
            }, intervalTime);
        },
        currentAge(birthday) {
            const yearNow = new Date().getFullYear();
            const yearBirth = new Date(birthday).getFullYear();
            return Number(yearNow) - Number(yearBirth);
        },
        async getBranchById(branchId) {
            apiBranch
                .getInfoBranch(branchId)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.branch = dataResponse.results;
                        this.isShowDetails = true;
                    } else throw new Error(dataResponse.result_code);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        },
        defaultShow() {
            this.isShowInfoBase = false;
            this.isShowDetails = false;
        },
        checkImageAdmin(img) {

            try {
                if (img) {
                    const publicPath = window.location.origin + '/public';
                    const imagePath = `data_client/${img}`;
                    // const urlImage = new URL(imagePath, publicPath).href
                    this.urlAvatar = new URL(imagePath, publicPath).href;
                    return
                }
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href
                return
            } catch (e) {
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href
                return
            }
        },
        checkBackground(background) {
            try {
                if (background) {
                    const publicPath = window.location.origin + '/public';
                    const imagePath = `data_client/${background}`;
                    // const urlImage = new URL(imagePath, publicPath).href
                    this.backgroundStaff = new URL(imagePath, publicPath).href;
                    return
                }
                this.backgroundStaff = new URL(backgroundAdminDefault, import.meta.url).href
                return
            } catch (e) {
                this.backgroundStaff = new URL(backgroundAdminDefault, import.meta.url).href
                return
            }
        },
        getBackInformationStaff() {
            apiStaff.getInfoStaff(this.idStaff).then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    const result = dataResponse.results[0];
                    this.idStaff = result.id;
                    this.isShowInfoBase = true;
                    this.staffName = result.name;
                    this.sex = result.sex;
                    this.yearOld = this.currentAge(result.birthday);
                    this.birthDay = result.birthday;
                    this.address = result.address;
                    this.phoneNumber = result.phone_number;
                    this.email = result.email;
                    this.position_id = result.position_id;
                    this.img = result.img;
                    this.checkBackground(result.background);
                    // this.backgroundStaff= result.background;
                } else
                    throw new Error(dataResponse.result_code);
            }).catch(error => {
                console.log(error)
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });
            });
        },
        eventHoverBackground(isHover) {
            this.isShowIconEyeBackground = isHover;
        },
        showPopupBackgroundStaff() {
            this.showPopupBackground = !this.showPopupBackground;
        },
        changePassword() {
            if (!this.password.passwordOld) {
                return ElNotification({
                    title: "Warning",
                    message: "Hãy nhập mật khẩu cũ",
                    type: "warning",
                });
            }
            else if (!this.password.passwordNew) {
                return ElNotification({
                    title: "Warning",
                    message: "Hãy nhập mật khẩu mới",
                    type: "warning",
                });
            }
            else if (!this.password.passwordConfirm) {
                return ElNotification({
                    title: "Warning",
                    message: "Hãy nhập mật khẩu xác nhận",
                    type: "warning",
                });
            }
            if (this.password.passwordNew != this.password.passwordConfirm) {
                return ElNotification({
                    title: "Warning",
                    message: "Mật khẩu mới và mật khẩu xác thực không hợp lệ",
                    type: "warning",
                });
            }
            if (this.password.passwordNew.length < 9) {
                return ElNotification({
                    title: "Warning",
                    message: "Mật khẩu mới tối thiểu phải có 8 kí tự",
                    type: "warning",
                });
            }
            if (!this.isSuccessCaptcha) {
                return ElNotification({
                    title: "Warning",
                    message: "Mã xác thực không hợp lệ",
                    type: "warning",
                });
            }
            var staffData = {
                'staff_id': this.idStaff,
                'user_name': this.userName,
                'passwordOld': this.password.passwordOld,
                'password': this.password.passwordNew,
                'password_confirmation': this.password.passwordConfirm,
            };
            apiStaff.changePassword(staffData).then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    ElNotification({
                        title: 'Success',
                        message: dataResponse.results,
                        type: 'success',
                    });
                    logoutAdmin.methods.logoutAdmin();
                 return   location.reload();
                }
                else if (dataResponse.result_code == 400) {
                    const resultsError = dataResponse.results
                    for (let value in resultsError) {
                        ElNotification({
                            title: 'Error',
                            message: resultsError[value][0],
                            type: 'error',
                        });
                    }
                }
                else
                    throw new Error(dataResponse.results);
            }).catch(error => {
                console.log(error)
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });

            });
        },
        clearPassword() {
            this.showPopupChangePassword = false;
            this.password = {
                passwordOld: "",
                passwordNew: "",
                passwordConfirm: "",
            }
        },
        getInfoAccout() {
            this.userName = jwt.decodePayloadAccessToken().user_name
        },
        delay(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
    },
};
</script>

<style scoped>
#profile-staff {
    height: 100vh;
}

.captcha {
    margin-top: 1rem;
}

.captcha input {
    width: 40% !important;
    margin-top: 1rem;
}

.captcha .code-captcha {
    float: right;
}

.show-background-popup {
    width: 100%;
    height: 43rem;
    background-repeat: no-repeat;
    background-position: center;
    background-size: contain;
}

.submit {
    width: 60%;
    text-align: end;
    margin-top: 2rem;
}

.show-background {
    position: absolute;
    bottom: 50%;
    top: 50%;
    right: 50%;
    left: 50%;
    font-size: 34px;
    color: #e1eaea;
}

.icon-eye:hover {
    color: blue;
}

.tick {
    background-color: aqua;
}

#background-info-staff {
    width: 100%;
    height: 16rem;
    position: relative;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
}

.avatar-staff {
    width: 0px;
    position: absolute;
    top: 170px;
    left: 3rem;
    border: 2px solid white;
    transition: transform 0.5s ease;
}

.avatar-staff:hover {
    transform: scale(1.1);
    border: 1px rgb(6, 241, 108) solid;
    transform-origin: center;
}

.basic-information {
    /* position: relative; */
}

.staff-name {
    display: inline-block;
    margin-left: 15rem;
    margin-top: 1rem;
}

.action-page {
    float: right;
    margin: 2rem;
    display: flex;
    margin-right: 1rem;
}

.action-page .icon {
    font-size: 150%;
}

.action-page .icon:hover {
    transform: translateY(-5px);
}

.line-hr {
    width: 99%;
    margin: 0 auto;
}

.col-info-staff {
    border-right: 1px solid black;
}

.info div h4 {
    text-align: center;
}

.info div p {
    margin-left: 1rem;
}

.info div span {
    float: right;
    margin-right: 1rem;
}

.line-action {
    margin: 0%;
}

.action-change-pass:hover {
    background-color: #c7c1c3 !important;
}

.action-change-info:hover {
    background-color: #778480;
}

.list-action div {
    padding: 0.6rem;
    user-select: none;
}

.group-change-password form input {
    /* margin-bottom: 1rem; */
    width: 70%;
    padding: 0.5rem 1px 0.5rem 1rem;
    border-radius: 9px;
    border: 1px solid black;
    outline: none;
    box-sizing: border-box;
    /* float: inline-end; */
}

.group-change-password form span {
    margin-bottom: 1rem;
}

.group-change-password form div {
    display: flow-root;
}

.group-change-password form input:hover {
    border: 1px solid rgb(61, 244, 15);
    width: 70%;
    padding: 0.5rem 1px 0.5rem 1rem;
    outline: none;
    box-sizing: border-box;
}

.group-change-password form input[type="password"]:focus {
    border: 1px solid rgb(61, 244, 15);
    width: 70%;
    padding: 0.5rem 1px 0.5rem 1rem;
    outline: none;
    box-sizing: border-box;
}

.edit-info strong {
    padding-right: 3rem;
}

.edit-info {
    justify-content: space-evenly;
}

.edit-address {
    padding: 2px 12px;
    outline: none;
    box-sizing: border-box;
    font-size: 16px;
    width: 50%;
    margin-top: 1rem;
}



.action-change-bg {
    font-size: 20px;
    position: absolute;
    right: 15px;
    bottom: 5px;
}

.from-change-password>p {
    color: red;
    font-weight: 600;
}

@media (max-width: 990px) {
    .col-info-staff {
        border-right: none;
    }
}

@media (max-width: 800px) {
    .avatar-staff {
        /* width: 0px; */
        /* position: absolute; */
        /* top: 170px; */
        left: 3rem;
        border: 2px solid white;
        transition: transform 0.5s ease;
        left: 38%;
        top: 69%;
        position: absolute;
    }

    .basic-information {
        text-align: center;
        position: relative;
    }

    .staff-name {
        padding-top: 6rem;
        display: block;
        margin-left: 0;
        margin-top: 0;
    }

    .action-page[data-v-e9f42f82] {
        float: right;
        margin: 0;
        display: block;
        margin-right: 0;
        position: absolute;
        top: 10px;
        right: 8px;
    }

    .action-change-pass {
        display: -webkit-box;
    }

    .from-change-password p {
        display: grid;
    }

    .group-change-password form div {
        display: grid;
    }

    .dialog-footer {
        padding: 0;
        padding-top: 0;
        display: flex;
        text-align: center;
        padding-bottom: 1rem;
    }
}
</style>
