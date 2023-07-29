<template>
    <section id="background-info-staff" style="background-image: url('https://wallpapers.com/images/hd/abstract-background-6m6cjbifu3zpfv84.jpg');">
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
            <div class="action-page">
                <font-awesome-icon icon="fa-solid fa-gears" />
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
                .popup : sửa mật khẩu đăng nhập
                .sidebar : sửa thông tin , địa chỉ, ngày sinh , giới tính , ảnh
            </div>
        </div>
    </section>
</template>

<script>
import avatar from '../../components/avatar.vue';
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
        // Các phương thức xử lý sự kiện hoặc logic khác
    },
};
</script>

<style scoped>
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
.action-page{
    float: right;
    margin: 2rem;
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

@media (max-width:990px) {
    .col-info-staff {
        border-right: none;
    }
}</style>
