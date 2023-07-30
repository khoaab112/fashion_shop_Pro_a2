<template >
    <div id="profile-staff">
        <section id="background-info-staff"
            style="background-image: url('https://wallpapers.com/images/hd/abstract-background-6m6cjbifu3zpfv84.jpg');">
            <avatar :src=src class="avatar-staff"></avatar>
        </section>
        <section id="avatar-staff">
            <div class="basic-information">
                <div class="staff-name">
                    <h3>Nguyễn Văn Khoa</h3>
                    <p><strong>Giới tính&emsp;:&emsp;</strong><span>Nam</span><font-awesome-icon
                            icon="fa-solid fa-mars" /><font-awesome-icon icon="fa-solid fa-venus" /></p>
                    <p><strong>Tuổi&emsp;:&emsp;</strong><span>22 tuổi</span></p>
                </div>
                <div class="action-page" :class="{ 'animate__animated animate__fadeInRight': isShowAction }">
                    <font-awesome-icon icon="fa-solid fa-gears" class="icon" @click="showAction()" />
                    <div class="list-action" v-if="isShowAction">
                        <div class="action-change-pass" @click="centerDialogVisible = true">
                            Đổi mật khẩu
                        </div>
                        <hr class="line-action">
                        <div class="action-change-info">Cập nhật thông tin</div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <hr class="line-hr">
        <br>
        <section id="content-staff">
            <div class="container">
                <div class="row info">
                    <div class="col-lg-6 col-sm-12 col-info-staff">
                        <h4>Thông tin nhân viên</h4>
                        <p><strong>Họ và tên :</strong><span>123123</span></p>
                        <p><strong>Giới tính :</strong><span>123123</span></p>
                        <p><strong>Ngày sinh :</strong><span>123123</span></p>
                        <p><strong>Địa chi:</strong><span>123123</span></p>
                        <p><strong>Số điện thoại:</strong><span>123123</span></p>
                        <p><strong>email cá nhân:</strong><span>123123</span></p>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-info-position">
                        <h4>Thông tin chức vụ</h4>
                        <p><strong>Chức vụ:</strong><span>123123</span></p>
                        <p><strong>Thuộc chi nhánh:</strong><span>123123</span></p>
                        <p><strong>Thời gian vào làm:</strong><span>123123</span></p>
                        <p><strong>Quyền tài khoản:</strong><span>123123</span></p>
                        <p><strong>Quyền tài khoản:</strong><span>123123</span></p>
                    </div>
                </div>
            </div>
        </section>
        <!-- box edit -->
        <section class="edit-info">
            <div>
                <strong>Giới tính</strong>
                <el-radio-group class="ml-4">
                    <el-radio size="large">Nam</el-radio>
                    <el-radio size="large">Nữ</el-radio>
                </el-radio-group>
            </div>
            <div>
                <strong>Ngày sinh</strong>
                <el-date-picker v-model="value1" type="date" placeholder="Chọn" />
            </div>
            <div>
                <strong>Địa chỉ</strong>
                <input type="text" class="edit-address" placeholder="Địa chỉ" autocomplete="on">
            </div>
        </section>
        <!-- dialog change password -->
        <el-dialog v-model="centerDialogVisible" title="Đổi mật khẩu" width="30%" align-center
            class="group-change-password">
            <form action="">
                <p><strong>Tài khoản : </strong><span>Nguyễn Văn A</span></p>
                <div>
                    <span>Mật khẩu cũ</span><input type="password" class="pass-old float-end" placeholder="Mật khẩu cũ"
                        autocomplete="off">
                </div>
                <br>
                <div>
                    <span>Mật khẩu mới</span> <input type="password" class="pass-new float-end" placeholder="Mật khẩu mới"
                        autocomplete="off">
                </div>
                <br>
                <div>
                    <span>Xác thực</span> <input type="password" class="pass-confirm float-end" placeholder="Xác nhận"
                        autocomplete="off">
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
</template>

<script>
import avatar from '../../components/avatar.vue';
import 'animate.css';
import { ref } from 'vue';


export default {
    name: 'staffProfile',
    components: {
        avatar,
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            src: 'https://mdbcdn.b-cdn.net/img/new/avatars/1.webp',
            isShowAction: false,
            centerDialogVisible: ref(false),
            value1: ref(''),
        };
    },
    created() {
        // Logic khi component được khởi tạo
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
        showAction() {
            console.log('asdas');
            this.isShowAction = !this.isShowAction
        }
    },
};
</script>

<style scoped>
#profile-staff {
    height: 100vh;
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
}

.group-change-password form input[type=password]:focus {
    border: 2px solid rgb(61, 244, 15);

}

@media (max-width:990px) {
    .col-info-staff {
        border-right: none;
    }
}
</style>
