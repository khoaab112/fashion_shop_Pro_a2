<template>
    <!-- Nội dung giao diện người dùng -->
<section id="background-info-staff">
  <avatar :src=src class="avatar-staff"></avatar>
</section>
<section id="avatar-staff">
  <!-- <avatar :src=src class="avatar-staff"></avatar> -->
  <div class="basic-information">
    <div class="staff-name">
    <h3>Nguyễn Văn Khoa</h3>
<p><strong>Giới tính&emsp;:&emsp;</strong><span>Nam</span><font-awesome-icon icon="fa-solid fa-mars" /><font-awesome-icon icon="fa-solid fa-venus" /></p>
<p><strong>Tuổi&emsp;:&emsp;</strong><span>22 tuổi</span></p>
</div>
  </div>
</section>
<br>
<hr class="line-hr">
<br>
<section id="content-staff">
    <div class="container">
        kasdasda
    </div>
</section>
<pre>
   <code>Khoa</code>
        .avartar

    .mã định danh nhân viên
    .chức vụ
    .thuộc chi nhánh
    .tên nhân viên
    .địa chỉ
    .email
    .ngày sinh
    .giới tính
    .popup : sửa mật khẩu đăng nhập
    .sidebar : sửa thông tin  , địa chỉ, ngày sinh , giới tính , ảnh
</pre>
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
        src:'https://mdbcdn.b-cdn.net/img/new/avatars/1.webp',
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
#background-info-staff{
    background-color: red;
    width: 100%;
    height: 16rem;
    position: relative;
}
.avatar-staff{
    width: 0px;
    position: absolute;
    top: 170px;
left: 3rem;
}
.basic-information{
/* position: relative; */

}
.staff-name{
    top:1rem;
    position: relative;
    left: 15rem;
}
.line-hr{
    width: 99%;
    margin:0 auto;
}

  </style>
