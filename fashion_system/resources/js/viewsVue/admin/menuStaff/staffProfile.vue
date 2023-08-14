<template>
    <div id="profile-staff">
        <section id="background-info-staff" style="
        background-image: url('https://wallpapers.com/images/hd/abstract-background-6m6cjbifu3zpfv84.jpg');
      ">
            <avatar :src="src" class="avatar-staff" @click="UploadAvatar('AVT')"></avatar>
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
                        <div class="action-change-pass" @click="centerDialogVisible = true">
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
        <el-dialog v-model="centerDialogVisible" title="Đổi mật khẩu" width="30%" align-center
            class="group-change-password">
            <form action="" class="from-change-password">
                <p class="text-center">
                    <strong>Tài khoản : </strong><span>{{ staffName }}</span>
                </p>
                <div>
                    <span>Mật khẩu cũ</span><input type="password" class="pass-old float-end" placeholder="Mật khẩu cũ"
                        autocomplete="off" />
                </div>
                <br />
                <div>
                    <span>Mật khẩu mới</span>
                    <input type="password" class="pass-new float-end" placeholder="Mật khẩu mới" autocomplete="off" />
                </div>
                <br />
                <div>
                    <span>Xác thực</span>
                    <input type="password" class="pass-confirm float-end" placeholder="Xác nhận" autocomplete="off" />
                </div>
            </form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="centerDialogVisible = false">Đóng</el-button>
                    <el-button type="primary" @click="centerDialogVisible = false">
                        Xác nhận
                    </el-button>
                </span>
            </template>
        </el-dialog>
    </div>

    <upload-avatar :type="typeImg" :show="showUploadFile" @hide-upload="emitUpload"></upload-avatar>
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
import { ElNotification } from 'element-plus'


export default {
    name: "staffProfile",
    components: {
        avatar,
        UploadAvatar,
        loadingSpinner,
        InfoStaff,
        twoColumnsOfData,
    },
    setup() { },
    directives: {},
    data() {
        return {
            src: "https://mdbcdn.b-cdn.net/img/new/avatars/1.webp",
            img: null,
            isShowAction: false,
            centerDialogVisible: false,
            value1: "",
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
            branch: {
                name: "",
            },
            isShowInfoBase: false,
            isShowDetails: false,
            // emitUpload:null,
        };
    },
    watch: {},
    async created() {
        this.startPolling();
    },
    mounted() { },
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
            // this.showUploadFile = !this.showUploadFile
            this.showUploadFile = !this.showUploadFile;
            this.typeImg = value;
        },
        //theo dõi sự kiện thoát upload file
        emitUpload(value) {
            this.showUploadFile = value;
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
                        this.isShowInfoBase = true;
                        this.staffName = this.staff.name;
                        this.sex = this.staff.sex;
                        this.yearOld = this.currentAge(this.staff.birthday);
                        this.birthDay = this.staff.birthday;
                        this.address = this.staff.address;
                        this.phoneNumber = this.staff.phone_number;
                        this.email = this.staff.email;
                        this.position_id = this.staff.position_id;
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
                        this.isShowDetails=true;
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
            this.isShowDetails=false;
        }
    },
};
</script>

<style scoped>
#profile-staff {
    height: 100vh;
}

.submit {
    width: 60%;
    text-align: end;
    margin-top: 2rem;
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
    border: 2px solid rgb(61, 244, 15);
    width: 70%;
    padding: 0.5rem 1px 0.5rem 1rem;
    outline: none;
    box-sizing: border-box;
}

.group-change-password form input[type="password"]:focus {
    border: 2px solid rgb(61, 244, 15);
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
