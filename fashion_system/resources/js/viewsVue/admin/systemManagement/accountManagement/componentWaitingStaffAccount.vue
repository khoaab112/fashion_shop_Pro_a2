<template>
  <!-- Nội dung giao diện người dùng -->
  <div>
    <button class="btn-add">Thêm</button>
    <div class="text-center"><h4>Danh sách tài khoản chưa được xác thực</h4></div>
    <table-admin
      :titles="titlesTable"
      :items="itemsTable"
      :loading="loadingTable"
      class="p-2"
    >
    </table-admin>
  </div>
</template>

<script>
import tableAdmin from "../../../components/tableAdmin.vue";
export default {
  name: "waitingStaffAccount",
  components: {
    tableAdmin,
  },
  setup() {},
  directives: {},
  data() {
    return {
      titlesTable: [
        { key: "index", label: "STT", text: "center" },
        { key: "staff_id", label: "Nhân viên", text: "start" },
        { key: "email", label: "Email", text: "start" },
        { key: "phone_number", label: "Số điện thoại", text: "start" },
        { key: "administration", label: "Quyền", text: "start", color: "black" },
        { key: "user_name", label: "Tài khoản", text: "start" },
        { key: "actions", label: "Thao tác", text: "center" },
      ],
      itemsTable: [],
      loadingTable: true,
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
    // Các phương thức xử lý sự kiện hoặc logic khác
  },
};
</script>

<style scoped>
.btn-add {
  float: right;
  border-radius: 5px;
  border: none;
  margin: 5px 1rem 1rem 0;
  width: 4rem;
  height: 2rem;
  background-color: #409eff;
  position: relative;
  z-index: 999;
}

.btn-add:hover {
  background-color: #40a0ffa1 !important;
}
.btn-add:active {
  box-shadow: 0 0 20px #ccc;
  transform: scale(1.1);
}
</style>
