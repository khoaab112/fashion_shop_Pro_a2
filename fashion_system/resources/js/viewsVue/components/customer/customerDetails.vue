<template>
    <div class="container msg-error pt-5 text-center" v-if="this.messageError">
        <span class="content error-msg fw-bold">
            {{ this.messageError }}
        </span>
    </div>
    <div class="container pt-5" v-else>
        <div class="box-main">
            <div class="title text-center pt-2">
                <h3>Thông tin khách hàng</h3>
            </div>
            <!-- <div class="info-customer"> -->
            <div class="row">
                <!-- <div class="text-center">
                    <h4>Thông tin khách</h4>
                </div> -->
                <div class="col-6">
                    <div class="imgs container mt-2 mb-3">
                        <div class="avatar">
                            <img :src="customer.img ?? urlAvatarDefault" class="rounded" alt="anh-gai-xinh" />
                        </div>
                        <div class="rank-img">
                            <img src="https://i.pinimg.com/236x/d4/cd/7c/d4cd7c0b3ad748fb4d17fe422e4d932c.jpg"
                                class="rounded" alt="anh-gai-xinh" />
                        </div>
                    </div>
                    <div class="contact">
                        <div class="text-center container box-child">
                            <h6>Thông tin liên lạc</h6>
                            <div class="form-floating mb-3 mt-3">
                                <input type="text" class="form-control" id="address" placeholder="Địa chỉ"
                                    v-model="customer.address" :disabled="!isEdit" />
                                <label for="address">Địa chỉ</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="phone_number" placeholder="Số điện thoại"
                                    v-model="customer.phone_number" :disabled="!isEdit" />
                                <label for="phone_number">Số điện thoại</label>
                                <span class="error-msg" v-if="msgValidationError && msgValidationError.phone_number">
                                    {{ msgValidationError.phone_number }}
                                </span>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="email" placeholder="Email"
                                    v-model="customer.email" :disabled="!isEdit" />
                                <label for="email">Email</label>
                                <span class="error-msg" v-if="msgValidationError && msgValidationError.email">
                                    {{ msgValidationError.email }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6 mt-5">
                    <div class="info-customer">
                        <div class="full-name container box-child">
                            <h6>Khách hàng</h6>
                            <div class="form-floating mb-3 mt-4">
                                <input type="text" class="form-control" id="first_name" placeholder="Tên"
                                    v-model="customer.first_name" :disabled="!isEdit" />
                                <label for="first_name">Tên</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="last_name" placeholder="Họ"
                                    v-model="customer.last_name" :disabled="!isEdit" />
                                <label for="last_name">Họ</label>
                            </div>
                            <div class="form-floating mb-3 date">
                                <span>Ngày sinh</span>
                                <el-date-picker v-model="customer.birthday" type="date" placeholder="Ngày sinh"
                                    size="large" :disabled="!isEdit" />
                            </div>
                            <div class="form-floating mb-3 fl-sex">
                                <span>Giới tính</span>
                                <div class="ms-5">
                                    <input type="radio" id="male" value="true" class="me-1" v-model="customer.sex"
                                        :disabled="!isEdit" />
                                    <label for="male">Nam</label>

                                    <input type="radio" id="female" value="false" class="ms-4 me-1"
                                        v-model="customer.sex" :disabled="!isEdit" />
                                    <label for="female">Nữ</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-action me-3">
                        <div class="default" v-if="!isEdit">
                            <button type="button" class="btn-remove btn" @click="isEdit = true">
                                Thay đổi
                            </button>
                        </div>
                        <div class="edit" v-else>
                            <button class="btn-clear btn me-2" @click="isEdit = false">Hủy</button>
                            <button type="button" class="btn-save btn" @click="save()">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5"></div>
        <div class="box-cs">
            <div class="title text-center pt-2">
                <h4>Thôn tin tài khoản</h4>
            </div>
            <div class="row mt-4">
                <div class="col-6 mb-2">
                    <div class="container">
                        <div class="form-floating mb-3">
                            <select class="form-select" id="rank" aria-label="rank" :disabled="!isEdit">
                                <option selected>Chọn</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <label for="rank">Rank</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="accumulated_points" placeholder="Số điểm"
                                v-model="customer.accumulated_point" :disabled="!isEdit" />
                            <label for="accumulated_points">Điểm</label>
                        </div>
                        <span><strong>Số điểm cần để thăng hạng : 22</strong></span>
                    </div>
                </div>
                <div class="col-6 mb-2">
                    <div class="container">
                        <div class="form-floating mb-3">
                            <select class="form-select" id="potential" aria-label="rank" v-model="customer.potential"
                                :disabled="!isEdit">
                                <option value="true">Tiềm năng</option>
                                <option value="false">Thân quen</option>
                            </select>
                            <label for="potential">Khách hàng</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="status" aria-label="rank" v-model="customer.status"
                                :class="[customer.status ? 'active' : 'block']" :disabled="!isEdit">
                                <option value="false">Khóa</option>
                                <option value="true">Hoạt động</option>
                            </select>
                            <label for="status">Trạng thái</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="active" aria-label="rank" v-model="customer.active"
                                :class="[customer.status ? 'active' : 'block']" :disabled="!isEdit">
                                <option value="true">Đã kích hoạt</option>
                                <option value="false">Chưa kích hoạt</option>
                            </select>
                            <label for="active">Kích hoạt</label>
                        </div>
                        <span><strong>Số lần bị khóa : {{ customer.number_band }}</strong></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5 space"></div>
        <!-- </div> -->
    </div>
</template>

<script>
import apiCustomer from "@/js/api/admin/apiCustomer.js";
import { ElNotification } from "element-plus";
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";
import methodDefine from "@/js/mixins/methodDefine.js";


export default {
    name: "customerDetails",
    components: {},
    setup() { },
    directives: {},
    mixins: [methodDefine],
    data() {
        return {
            isEdit: false,
            params_id: this.$route.params.id,
            customer: {
                rank: "",
                first_name: "",
                last_name: "",
                address: "",
                phone_number: "",
                email: "",
                birthday: "",
                sex: false,
                accumulated_points: "",
                number_band: "",
                potential: "",
                status: "",
                active: "",
                img: "",
                urlAvatarDefault: "",
            },
            messageError: "",
            msgValidationError: {
                phone_number: "",
                email: "",
            },
        };
    },
    created() {
        this.getCustomerById(this.params_id);
        this.urlAvatarDefault = new URL(avatarAdminDefault, import.meta.url).href;
    },
    watch: {
        isEdit(val) {

        },
    },
    mounted() {
        // Logic sau khi component được gắn kết (render) vào DOM
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        getCustomerById(id) {
            apiCustomer
                .getCustomer(id)
                .then((res) => {
                    var dataResponse = res.data;
                    this.messageError = "Đang tải";
                    if (dataResponse.result_code == 200) {
                        this.customer = dataResponse.results;
                        console.log(this.customer);
                        this.messageError = "";
                    } else if (dataResponse.result_code == 204) {
                        this.messageError = dataResponse.results;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    console.log(error);
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        },
        save() {
            const data = this.customer;
            this.msgValidationError = {};
            let flag =false;
            if (!this.isVietnamesePhoneNumberValid(data.phone_number)) {
                 this.msgValidationError.phone_number = "Số điện thoại không hợp lệ"
            }
            if(!this.isValidateEmail(data.email)) {
                 this.msgValidationError.email = "Email không hợp lệ"
                 flag = true;
            }
            if(!flag) return;
            console.log(this.customer);
        }
    },
};
</script>

<style scoped>
.avatar {
    width: 10rem;
    height: 10rem;
}

.rank-img {
    width: 5rem;
    height: 5rem;
    margin-left: 2rem;
}

div.imgs {
    display: flex;
    align-items: center;
}

.imgs img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.box-main,
.box-cs {
    border: 2px solid #d9d9d9;
    position: relative;
}

.contact,
.info-customer {
    padding: 1rem;
}

.box-child {
    position: relative;
    border: 1px solid #d9d9d9;
}

.box-child h6 {
    position: absolute;
    top: -12px;
    z-index: 0;
    background: white;
}

.box-main .title {
    position: absolute;
    top: -27px;
    right: 35%;
    background: white;
}

.box-cs .title {
    position: absolute;
    top: -27px;
    right: 40%;
    background: white;
}

.date {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.space {
    height: 1rem;
}

button {
    min-width: 6rem;
}

.list-action {
    float: right;
}

.fl-sex {
    display: flex;
    align-items: center;
}

.fl-sex input[type="radio"] {
    accent-color: var(--popper-theme-background-color);
}

.active {
    color: #198754;
    font-weight: bold;
}

.block {
    color: red;
    font-weight: bold;
}
</style>
