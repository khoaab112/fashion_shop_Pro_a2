<template>
  <!-- Nội dung giao diện người dùng -->
  <table>
    <thead>
      <tr>
        <th rowspan="2">Menu cha</th>
        <th rowspan="2">Thông tin</th>
        <th colspan="5">Menu con</th>
      </tr>
      <tr>
        <th>Tên</th>
        <th>Vị trí</th>
        <th>Màu</th>
        <th>Trạng thái</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody>
      <div class="row-table" v-for="(item, key) in dataMenu">
        <tr>
          <td rowspan="3"><strong>Tên cha 1</strong><button>Sửa</button></td>
          <td rowspan="1">Vị trí</td>
          <td>Con_1</td>
          <td>Vị trí_1</td>
          <td>Màu_1</td>
          <td>Trạng thái_1</td>
          <td>Thao tác_1</td>
        </tr>
        <tr>
          <td rowspan="1">Màu</td>
          <td>Con_1</td>
          <td>Vị trí_1</td>
          <td>Màu_1</td>
          <td>Trạng thái_1</td>
          <td>Thao tác_1</td>
        </tr>
        <tr>
          <td rowspan="1">Hoạt động</td>
          <td>Con_1</td>
          <td>Vị trí_1</td>
          <td>Màu_1</td>
          <td>Trạng thái_1</td>
          <td>Thao tác_1</td>
        </tr>
      </div>
      <!-- <tr> -->
      <!-- min là 3 -->
      <!-- vị trí,màu , đang hoạt đông thì lấy tổng độ dài con / 3 , dư thì để cho hoạt đông -->
      <!-- min là 1 -->
      <!-- <td rowspan="3"><strong>Tên cha 1</strong><button>Sửa</button></td>
        <td rowspan="1">Vị trí</td>
        <td>Con_1</td>
        <td>Vị trí_1</td>
        <td>Màu_1</td>
        <td>Trạng thái_1</td>
        <td>Thao tác_1</td>
      </tr>
      <div>
        <tr>
          <td rowspan="1">Màu</td>
          <td>Con_1</td>
          <td>Vị trí_1</td>
          <td>Màu_1</td>
          <td>Trạng thái_1</td>
          <td>Thao tác_1</td>
        </tr>
        <tr>
          <td rowspan="1">Hoạt động</td>
          <td>Con_1</td>
          <td>Vị trí_1</td>
          <td>Màu_1</td>
          <td>Trạng thái_1</td>
          <td>Thao tác_1</td>
        </tr>
      </div> -->
    </tbody>
    <tfoot>
      <tr>
        khóa
      </tr>
    </tfoot>
  </table>
</template>

<script>
export default {
  name: "Menu-table",
  components: {},
  props: ["data"],
  setup() {},
  directives: {},
  data() {
    return {
      dataMenu: this.data,
    };
  },
  watch: {
    data(value) {
      console.log(value);
      this.dataMenu = value;
    },
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
  methods: {
    // Các phương thức xử lý sự kiện hoặc logic khác
  },
};
</script>

<style>
/* CSS cho component */
</style>
