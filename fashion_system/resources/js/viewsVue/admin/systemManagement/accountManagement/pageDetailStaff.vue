<template>
    <div class="text-center pt-4" v-if="!dataStaff">
        <loadingStyleTwirl></loadingStyleTwirl>
        <br />
        <loadingText></loadingText>
        <div class="cushion-loading"></div>
    </div>
    <main id="page-detai-staff" v-else>
        <div class="row ps-3 pe-3">
            <div class="mt-3"></div>
            <div class="col-4">
                <section class="card-row-1 card text-center staff-base">
                    <div class="mt-2">
                        <avatar :src="urlAvatar" class="avatar-staff"> </avatar>
                    </div>
                    <!-- v-once không cho copy lại địa chỉ biêns -->
                    <strong v-once>
                        {{ this.dataStaff.staff_name }}
                    </strong>
                    <strong v-once>
                        {{ this.dataStaff.sex ? "Nam" : "Nữ" }}
                        {{ getYearOld(this.dataStaff.birthday) }}&nbsp;tuổi<br />{{
                            this.dataStaff.birthday
                        }}
                        &nbsp;<font-awesome-icon icon="fa-solid fa-cake-candles" style="color: #16d1e9" />
                    </strong>
                </section>
            </div>
            <div class="col-8">
                <section class="card-row-1 card">
                    <div class="mt-2 row">
                        <strong class="ps-5 col-5"> Họ tên : </strong>
                        <p class="col-7">
                            <input type="text" class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]"
                                v-model="this.dataStaff.staff_name" />
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5"> Sinh ngày : </strong>
                        <p class="col-7">
                            <el-date-picker v-model="this.dataStaff.birthday" type="date" placeholder="Ngày sinh"
                                :size="sizeElInput" v-if="showBtnEdit" />
                            <input type="text" class="input-edit hide-input" v-model="this.dataStaff.birthday" v-else />
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5"> Giới tính : </strong>
                        <p class="col-7" v-if="!showBtnEdit">
                            <span v-once>{{ this.dataStaff.sex ? "Nam" : "Nữ" }}</span>
                            &nbsp;
                            <font-awesome-icon icon="fa-solid fa-mars" style="color: #0ed3e1" v-if="this.dataStaff.sex" />
                            <font-awesome-icon icon="fa-solid fa-venus" style="color: #e8179b" v-else />
                        </p>
                        <el-radio-group v-model="this.dataStaff.sex" class="col-7 pb-3" v-else>
                            <el-radio :label="true" size="small">Nam</el-radio>
                            <el-radio :label="false" size="small">Nữ</el-radio>
                        </el-radio-group>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5"> Địa chỉ : </strong>
                        <p class="col-7">
                            <input type="text" class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]"
                                v-model="this.dataStaff.staff_address" />
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5"> Số điện thoại: </strong>
                        <p class="col-7">
                            <input type="text" class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]"
                                v-model="this.dataStaff.phone_number" />
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5"> email: </strong>
                        <p class="col-7">
                            <input type="text" class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]"
                                v-model="this.dataStaff.email" />
                        </p>
                    </div>
                    <strong class="ps-5" :class="[this.dataStaff.active ? 'check' : 'question']">
                        <font-awesome-icon class="status-staff" icon="fa-regular fa-circle-check" style="color: #4bff0a"
                            v-if="this.dataStaff.active" />
                        <font-awesome-icon class="status-staff" icon="fa-solid fa-question" style="color: #ff0a0a" v-else />
                        {{ this.dataStaff.active ? "Đã xác thực" : "Chưa xác thức" }}</strong>
                </section>
            </div>
        </div>
        <div class="row ps-3 pe-3 mt-4">
            <section class="col-8">
                <div class="card row-2">
                    <div class="row mt-2 ms-2">
                        <strong class="col-4">Chức vụ :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                        <p v-once>{{ this.dataStaff.position_name }}</p>
                        </p>
                        <el-select v-model="this.dataStaff.position_name" placeholder="Chọn"
                            class="options-level-accout mb-2 col-8" v-else>
                            <el-option v-for="item in optionPosition" :key="item.id" :label="item.name" :value="item.id"
                                v-model="this.dataStaff.position_name" :disabled="item.disabled" />
                        </el-select>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4" v-once>Mã nhân viên :</strong>
                        <p class="col-8">
                            <input type="text" class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]"
                                v-model="this.dataStaff.code_staff" />
                        </p>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4" v-once>Thuộc chi nhánh :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                        <p v-once> {{ this.dataStaff.branch_name }}</p>
                        </p>
                        <el-select v-model="this.dataStaff.branch_name" placeholder="Chọn"
                            class="options-level-accout mb-2 col-8" v-else>
                            <el-option v-for="item in optionBranches" :key="item.id" :label="item.name" :value="item.id"
                                v-model="this.dataStaff.branch_name" />
                        </el-select>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4">Địa chỉ chi nhánh :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                            <span v-once> {{ this.dataStaff.branch_address }}</span>
                        </p>
                        <p class="col-8" v-else>
                            <span> {{ getElementById(optionBranches,
                                this.dataStaff.branch_name) ? getElementById(optionBranches,
                                    this.dataStaff.branch_name).address : this.dataStaff.branch_address }}</span>
                        </p>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4" v-once>Hotline :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                            <span>{{ this.dataStaff.hotline }}</span>
                        </p>
                        <p class="col-8" v-else>
                            <span> {{ getElementById(optionBranches,
                                this.dataStaff.branch_name) ? getElementById(optionBranches,
                                    this.dataStaff.branch_name).hotline : this.dataStaff.hotline }}</span>
                        </p>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4" v-once>Quản lí chi nhánh :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                            <span>{{ this.dataStaff.manage }}</span>
                        </p>
                        <p class="col-8" v-else>
                            <span> {{ getElementById(optionBranches,
                                this.dataStaff.branch_name) ? getElementById(optionBranches,
                                    this.dataStaff.branch_name).manage : this.dataStaff.manage }}</span>
                        </p>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-4" v-once>Thời gian làm việc :</strong>
                        <p class="col-8" v-if="!showBtnEdit">
                            <span>{{ this.dataStaff.working_time }}</span>
                        </p>
                        <p class="col-8" v-else>
                            <span> {{ getElementById(optionBranches,
                                this.dataStaff.branch_name) ? getElementById(optionBranches,
                                    this.dataStaff.branch_name).working_time : this.dataStaff.working_time }}</span>
                        </p>
                    </div>
                </div>
            </section>
            <section class="col-4">
                <div class="card row-2">
                    <div class="row mt-2 ms-2">
                        <strong class="col-5">Tài khoản</strong>
                        <p class="col-7">{{ this.dataStaff.user_name }}</p>
                    </div>
                    <div class="row mt-2 ms-2">
                        <strong class="col-5">Cấp độ</strong>
                        <p class="col-7" v-if="!showBtnEdit">
                        <p v-once>{{ this.dataStaff.administration }}</p>
                        </p>
                        <el-select v-model="this.dataStaff.administration" placeholder="Chọn"
                            class="options-level-accout mb-2 col-7" v-else>
                            <el-option v-for="item in optionsLevelAccout" :key="item.id" :label="item.name" :value="item.id"
                                v-model="this.dataStaff.administration" />
                        </el-select>
                    </div>
                    <div class="row ms-2">
                        <strong class="col-5">Trạng thái</strong>
                        <p class="col-7" :class="[this.dataStaff.status ? 'check' : 'question']" v-if="!showBtnEdit">
                            {{ this.dataStaff.status ? "Kích hoạt" : "Khóa" }}
                        </p>
                        <el-select v-model="this.dataStaff.statusChange" placeholder="Chọn"
                            class="options-level-accout mb-2 col-7" v-else>
                            <el-option v-for="item in optionStatus" :key="item.id" :label="item.name" :value="item.id"
                                v-model="this.dataStaff.statusChange" />
                        </el-select>
                    </div>
                    <div class="list-btn" v-if="!showBtnEdit">
                        <button class="action action-block mt-1" @click="lockAccount()">
                            {{ this.dataStaff.status ? "Khóa" : "Kích hoạt"
                            }}<font-awesome-icon icon="fa-solid fa-lock" class="float-end pt-1" />
                        </button>
                        <button class="action action-log-out mt-2" @click="indirectlyDisconnect()">
                            Đăng xuất cưỡng bức
                            <font-awesome-icon icon="fa-solid fa-right-from-bracket" class="float-end pt-1" />
                        </button>
                        <button class="action action-reset mt-2" @click="resetPassword()">
                            Reset mật khẩu
                            <font-awesome-icon icon="fa-solid fa-retweet" class="float-end pt-1" />
                        </button>
                        <button class="action action-request mt-2" @click="dialogVisible = true">
                            Yêu cầu chỉnh sửa thông tin
                            <font-awesome-icon icon="fa-solid fa-plane-departure" class="float-end pt-1" />
                        </button>
                        <button class="action action-edit mt-2" @click="activeUpdate()">
                            Can thiệp trực tiếp
                            <font-awesome-icon icon="fa-regular fa-pen-to-square" class="float-end pt-1" />
                        </button>
                    </div>
                    <div class="list-btn-edit" v-else>
                        <strong class="text-edit">Chỉnh sửa</strong>
                        <button class="btn edit-submit mt-2" @click="updateStaff">Lưu</button>
                        <button class="btn edit-clone mt-2" @click="offBtnEdit">Đóng</button>
                    </div>
                </div>
            </section>
        </div>
        <!-- <div class="row">
      <div class="card">Tài khoản đã liên kết</div>
    </div> -->
        <div class="cushion"></div>
    </main>
    <el-dialog v-model="dialogVisible" title="Yêu cầu chỉnh sửa" width="50%" :before-close="handleClose">
        <el-date-picker v-model="dataEditRequest.time" type="date" placeholder="Thời gian yêu cầu" :size="sizeElInput" />
        <el-input v-model="dataEditRequest.content" :rows="2" type="textarea" placeholder="Nội dung ghi chú" class="mt-2" />
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="clearEditRequest()">Đóng</el-button>
                <el-button type="primary" @click="editRequest()"> Gửi </el-button>
            </span>
        </template>
    </el-dialog>
    <el-dialog v-model="showPasswordNew" title="Mật khẩu mới : " width="30%" :before-close="showPasswordNewClose">
        <button class="btn-copy" @click="copyPass(passwordNew)"><font-awesome-icon icon="fa-regular fa-copy" /></button>
        <span>Tài khoản : {{ dataStaff.user_name }}</span><br>
        <span>Mật khẩu : {{ passwordNew }}</span>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="showPasswordNew = false">Cancel</el-button>
            </span>
        </template>
    </el-dialog>
</template>

<script>
import avatar from "../../../components/avatar.vue";
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";
import apiStaffAccount from "@/js/api/admin/apiStaffAccounts.js";
import apiStaff from "@/js/api/admin/apiStaff.js";
import apiBranch from "@/js/api/admin/apiBranch.js";
import apiPosition from "@/js/api/admin/apiPosition.js";
import apiAdmin from "@/js/api/admin/apiAdmin.js";
import apiAdministration from "@/js/api/admin/apiAdministration.js";
import methodDefine from "@/js/mixins/methodDefine.js";
import { ElNotification } from "element-plus";
import { ElMessage } from 'element-plus'
import loadingStyleTwirl from "../../../components/loading/loadingStyleTwirl.vue";
import loadingText from "../../../components/loading/loadingText.vue";

export default {
    name: "detailStaff",
    mixins: [methodDefine],
    components: {
        avatar,
        loadingStyleTwirl,
        loadingText,
    },
    //   props: ['dataa'],
    setup() { },
    directives: {},
    data() {
        return {
            dataStaff: null,
            urlAvatar: null,
            dialogVisible: false,
            dataEditRequest: {
                time: null,
                content: null,
            },
            sizeElInput: "default",
            showBtnEdit: false,
            optionsLevelAccout: [
                {
                    id: "default",
                    name: "default",
                },
            ],
            activatedFirst: false,
            optionBranches: [
                {
                    id: "default",
                    name: "default",
                },
            ],
            optionPosition: [
                {
                    id: "default",
                    name: "default",
                },
            ],
            optionStatus: [
                {
                    id: 1,
                    name: "Kích hoạt",
                },
                {
                    id: 0,
                    name: "Khóa",
                },
            ],
            originalData: null,
            showPasswordNew: false,
            passwordNew: null,
        };
    },
    created() {
        this.getStaffDetail(this.decodeURL(this.$route.query.child));
        // Logic khi component được khởi tạo
    },
    mounted() { },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        checkImageAdmin(img) {
            try {
                if (img) {
                    const publicPath = window.location.origin + "/public";
                    const imagePath = `data_client/${img}`;
                    // const urlImage = new URL(imagePath, publicPath).href
                    this.urlAvatar = new URL(imagePath, publicPath).href;
                    return;
                }
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href;
                return;
            } catch (e) {
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href;
                console.error(e);
                return;
            }
        },
        decodeURL(data) {
            return JSON.parse(decodeURIComponent(data));
        },
        getYearOld(date) {
            var today = new Date();
            var birthDate = new Date(date);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            return age;
        },
        getStaffDetail(id) {
            apiStaffAccount
                .getStaffDetail(id)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.dataStaff = dataResponse.results;
                        this.checkImageAdmin(this.dataStaff.img);
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        lockAccount() {
            const data = {
                idAccount: this.dataStaff.account_id,
                status: !this.dataStaff.status,
                idStaff: this.dataStaff.staff_id,
            };
            apiStaffAccount
                .lockAccount(data)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.getStaffDetail(this.dataStaff.account_id);
                        ElNotification({
                            title: "Success",
                            message: "Thay đổi thành công",
                            type: "success",
                        });
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        indirectlyDisconnect() {
            apiStaffAccount
                .indirectlyDisconnect(this.dataStaff.staff_id)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.activatedFirst = false;
                        ElNotification({
                            title: "Success",
                            message: "Thành công",
                            type: "success",
                        });
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        handleClose() {
            this.dialogVisible = !this.dialogVisible;
            this.dataEditRequest = {
                time: null,
                content: null,
            };
        },
        clearEditRequest() {
            this.dialogVisible = false;
            this.dataEditRequest = {
                time: null,
                content: null,
            };
        },
        editRequest() {
            if (!this.dataEditRequest.time) {
                return ElNotification({
                    title: "Error",
                    message: "Thời gian không được bỏ trống",
                    type: "error",
                });
            }
            apiStaffAccount
                .editRequest(this.dataEditRequest, this.dataStaff.staff_id)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.dialogVisible = false;
                        this.dataEditRequest = {
                            time: null,
                            content: null,
                        };
                        return ElNotification({
                            title: "Success",
                            message: "Thành công",
                            type: "success",
                        });
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        activeUpdate() {
            this.showBtnEdit = true;
            if (!this.activatedFirst) {
                this.originalData = { ...this.dataStaff };
                this.getBranches();
                this.getPositions();
                this.getAdministrations();
                this.activatedFirst = true;
            }
        },
        getBranches() {
            apiBranch
                .getBranches()
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.optionBranches = dataResponse.results;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        getPositions() {
            apiPosition
                .getPositions()
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.optionPosition = dataResponse.results;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        getAdministrations() {
            apiAdministration
                .getAdministrations()
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.optionsLevelAccout = dataResponse.results;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        getElementById(arr, id) {
            return arr.find(item => item.id === id);
        },
        offBtnEdit() {
            this.showBtnEdit = false;
            this.getStaffDetail(this.decodeURL(this.$route.query.child));
        },
        updateStaff() {
            var dateConvert = new Date(this.dataStaff.birthday);
            var year = dateConvert.getFullYear();
            var month = ('0' + (dateConvert.getMonth() + 1)).slice(-2);
            var day = ('0' + dateConvert.getDate()).slice(-2);
            this.dataStaff.birthday = year + '-' + month + '-' + day;
            console.log(this.dataStaff);
            if (!(JSON.stringify(this.dataStaff) === JSON.stringify(this.originalData))) {
                apiStaff
                    .editCarefully(this.dataStaff)
                    .then((res) => {
                        var dataResponse = res.data;
                        if (dataResponse.result_code == 200) {
                            this.showBtnEdit = false;
                            // this.getStaffDetail(this.decodeURL(this.$route.query.child));
                            ElNotification({
                                title: "Success",
                                message: dataResponse.results,
                                type: "success",
                            });
                            return location.reload();
                        } else throw new Error(dataResponse.results);
                    })
                    .catch((error) => {
                        ElNotification({
                            title: "Error",
                            message: error,
                            type: "error",
                        });
                    });
            }
            else {
                this.showBtnEdit = false;
                return ElMessage({
                    message: 'Không có dữ liệu bị chỉnh sửa',
                    type: 'success',
                })
            }
        },
        resetPassword: function () {
            const pass = this.generateRandomCharacters(9);
            const user = {
                'staff_id': this.dataStaff.staff_id,
                'user_name': this.dataStaff.user_name,
                'password': pass
            }
            apiAdmin
                .resetPassword(user)
                .then((res) => {
                    var dataResponse = res.data;
                    console.log(dataResponse);
                    if (dataResponse.result_code == 200) {
                        ElNotification({
                            title: "Success",
                            message: dataResponse.results,
                            type: "success",
                        });
                        this.passwordNew = user.password;
                        this.showPasswordNew = true;
                    } else {
                        if (dataResponse.result_code.staff_id !== undefined) {
                            throw new Error(dataResponse.results.staff_id[0]);
                        }
                        else if (dataResponse.result_code.user_name !== undefined) {
                            throw new Error(dataResponse.results.user_name[0]);
                        }
                    }
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        showPasswordNewClose() {
            this.showPasswordNew = false;
        },
        copyPass() {
            var data = "Tài khoản : " + this.dataStaff.user_name +"\nMật khẩu : "+this.passwordNew;
                navigator.clipboard.writeText(data);
                return ElNotification({
                    title: "Success",
                message: 'Sao chép thành công',
                type: "success",
            });

        }
    },
};
</script>

<style scoped>
.btn-copy:active {
    background-color: rgba(148, 141, 141, 0.288);
    transform: scale(1);


}

.btn-copy {
    float: right;
    width: 2rem;
    height: 2rem;
    font-size: 20px;
    background: white;
    float: right;
    border: 2px solid #b2a0a0;
    border-radius: 5px;
}

.options-level-accout {
    width: 50%;
}

.input-edit {
    border-radius: 5px;
    border: 1px solid;
    padding: 0px 0.5rem;
    widows: 90%;
    background: white;
}

.hide-input {
    outline: none;
    border: none;
    pointer-events: none;
    background: #fffaeb;
}

.input-edit:focus {
    border-color: #5fa0a9 !important;
    outline: none;
    box-sizing: border-box;
}

.text-edit {
    position: absolute;
    top: -52px;
    font-size: 120%;
    color: red;
}

.edit-submit {
    background-color: #409eff;
}

.edit-clone {
    background-color: #909399;
}

.btn:hover {
    color: #000;
}

.btn {
    margin-bottom: 1rem;
}

.list-btn-edit {
    display: flex;
    justify-content: space-around;
    position: absolute;
    bottom: 0;
    right: 0;
    left: 0;
}

.list-btn {
    display: contents;
}

.cushion-loading {
    min-height: 35rem;
}

.cushion {
    height: 2rem;
}

.action-edit {
    background-color: aquamarine;
}

.action-block {
    background-color: red;
}

.action-log-out {
    background-color: yellow;
}

.action-reset {
    background-color: rgb(124, 233, 23);
}

.action-request {
    background-color: rgb(7, 137, 224);
}

button.action {
    font-size: 80%;
    margin: 0.2rem;
    padding: 0.2rem 0.5rem;
    border: none;
    border-radius: 15px;
    user-select: none;
    color: black;
}

button.action:hover {
    background-color: #0000001a;
}

.row-2 {
    min-height: 23rem;
}

.check {
    color: #4bff0a;
}

.question {
    color: #ff0a0a;
}

.status-staff {
    font-size: 2rem;
    padding-right: 1rem;
}

.line {
    border-top: 0.2px solid #00000059;
}

.staff-base {
    line-height: 2;
}

.card-row-1 {
    min-height: 18rem;
}

.card {
    background-color: #fffaeb;
    border: none;
    box-shadow: -1px 4px 8px 2px #88888863;
    color: cadetblue;
}
</style>
