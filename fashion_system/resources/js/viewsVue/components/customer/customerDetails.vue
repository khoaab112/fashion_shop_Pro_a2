<template>
    <div class="container pt-5">
        <div class="box-main">
            <div class="title text-center pt-2">
                <h3>Thông tin khách hàng</h3>
            </div>
            <!-- <div class="info-customer"> -->
            <div class="row">
                <!-- <div class="text-center">
                    <h4>Thông tin khách</h4>
                </div> -->
                <div class="col-6 ">
                    <div class="imgs container mt-2 mb-3">
                        <div class="avatar">
                            <img src="https://i.pinimg.com/236x/d4/cd/7c/d4cd7c0b3ad748fb4d17fe422e4d932c.jpg"
                                class="rounded" alt="anh-gai-xinh">
                        </div>
                        <div class="rank-img">
                            <img src="https://i.pinimg.com/236x/d4/cd/7c/d4cd7c0b3ad748fb4d17fe422e4d932c.jpg"
                                class="rounded" alt="anh-gai-xinh">
                        </div>
                    </div>
                    <div class="contact">
                        <div class="text-center container box-child">
                            <h6>Thông tin liên lạc</h6>
                            <div class="form-floating mb-3 mt-3">
                                <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                                <label for="address">Địa chỉ</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="phone_number" placeholder="Số điện thoại">
                                <label for="phone_number">Số điện thoại</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="email" placeholder="Email">
                                <label for="email">Email</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6 mt-5">
                    <div class="info-customer">
                        <div class="full-name container box-child">
                            <h6>Khách hàng</h6>
                            <div class="form-floating mb-3 mt-4">
                                <input type="text" class="form-control" id="first_name" placeholder="Tên">
                                <label for="first_name">Tên</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="last_name" placeholder="Họ">
                                <label for="last_name">Họ</label>
                            </div>
                            <div class="form-floating mb-3 date">
                                <span>Ngày sinh</span>
                                <el-date-picker v-model="customer.birthday" type="date" placeholder="Ngày sinh"
                                    size="large" />
                            </div>
                            <div class="form-floating mb-3">
                                <span>Giới tính</span>
                                <el-radio-group v-model="customer.sex" class="ml-4 ms-5">
                                    <el-radio value="1" size="large">Nam</el-radio>
                                    <el-radio value="2" size="large">Nữ</el-radio>
                                </el-radio-group>
                            </div>

                        </div>
                    </div>
                    <div class="list-action me-3">
                        <div class="default" v-if="!isEdit">
                            <button type="button" class="btn-remove  btn" @click="isEdit = true">Thay đổi</button>
                        </div>
                        <div class="edit" v-else>
                            <button class="btn-clear btn me-2" @click="isEdit = false">Hủy</button>
                            <button type="button" class="btn-save btn">Lưu</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="mt-5"></div>
        <div class="box-cs">
            <div class="title text-center pt-2">
                <h4> Thôn tin tài khoản</h4>
            </div>
            <div class="row mt-4">
                <div class="col-6 mb-2">
                    <div class="container">
                        <div class="form-floating mb-3">
                            <select class="form-select" id="rank" aria-label="rank">
                                <option selected>Chọn</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <label for="rank">Rank</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" id="accumulated_points" placeholder="Số điểm">
                            <label for="accumulated_points">Điểm</label>
                        </div>
                        <span><strong>Số điểm cần để thăng hạng : 22</strong></span>
                    </div>
                </div>
                <div class="col-6 mb-2">
                    <div class="container">

                        <div class="form-floating mb-3">
                            <select class="form-select" id="potential" aria-label="rank">
                                <option value="1">Tiềm năng</option>
                                <option value="2">Thân quen</option>
                            </select>
                            <label for="potential">Khách hàng</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="status" aria-label="rank">
                                <option value="1">Khóa</option>
                                <option value="2">Hoạt động</option>
                            </select>
                            <label for="status">Trạng thái</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" id="active" aria-label="rank">
                                <option value="1">Đã kích hoạt</option>
                                <option value="2">Chưa kích hoạt</option>
                            </select>
                            <label for="active">Kích hoạt</label>
                        </div>
                        <span><strong>Số lần bị khóa : 22</strong></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5 space">
        </div>
        <!-- </div> -->
    </div>
</template>

<script>
export default {
    name: 'customerDetails',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            isEdit: false,
            params_id: this.$route.params.id,
            customer: {
                rank: '',
                first_name: '',
                last_name: '',
                address: '',
                phone_number: '',
                email: '',
                birthday: '',
                sex: '',
                accumulated_points: '',
                number_band: '',
                potential: '',
                status: '',
                active: '',
                img: '',
            }
        };
    },
    created() {
        console.log(this.params_id);
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
    updated() {

    },
    destroyed() {

    },
    methods: {
        // Các phương thức xử lý sự kiện hoặc logic khác
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
    z-index: 1;
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
</style>
