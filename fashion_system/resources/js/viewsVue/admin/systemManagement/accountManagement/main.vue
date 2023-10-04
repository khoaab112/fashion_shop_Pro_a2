<template>
  <!-- Nội dung giao diện người dùng -->
  <div>
    <code>
      Quản lí tài khoản staff/admin (thêm ,sửa , khóa)
      <br />
      Quản lí tài khoản customer (thêm , sửa , khóa)<br />
      Danh sách tài khoản đang trong hàng chờ xét duyệt để tạo tài khoản liên kết với
      gmail .<br />
      gửi mail thành công hoặc không thành công cho staff<br />
      filter thêm thời gian tạo , trạng thái hoạt động
    </code>
    <section id="list-btn">
      <div class="row">
        <div class="col-6 text-center">
          <button class="btn-show btn-staff" @click="useSwitch">Nhân viên</button>
        </div>
        <div class="col-6 text-center">
          <button class="btn-show btn-customer" @click="useSwitch">Khách hàng</button>
        </div>
      </div>
    </section>
    <section id="staff-show" v-show="switchShow">ma</section>
    <section id="customer-show" v-show="!switchShow">al</section>
  </div>
</template>

<script>
export default {
  name: "mainAccountManagement",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {
      switchShow: true,
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
  updated() {},
  destroyed() {},
  methods: {
    useSwitch() {
      this.switchShow = !this.switchShow;
    },
  },
};
</script>

<style scoped>
.btn-show {
  width: 90%;
  height: 100%;
  border: none;
  padding: 0.5rem 0;
  border-radius: 5px;
}

.btn-show:hover {
  background-color: #9fa5aa;
  color: white;
}

.btn-show:active {
  transform: scale(0.9);
}

.btn-staff {
  background-color: #3edd4b;
}

.btn-customer {
  background-color: #0b89f0;
}

section#list-btn {
  margin-top: 1rem;
}
</style>
