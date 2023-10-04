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
      // Dữ liệu của component
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

<style>
/* CSS cho component */
</style>
