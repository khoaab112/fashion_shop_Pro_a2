<template>
    <!-- <div class="p-3">
        <el-tabs :tab-position="tabPosition" >
          <el-tab-pane label="Tố cáo">Thêm sửa xóa các loại phản hồi</el-tab-pane>
          <el-tab-pane label="Sản phẩm">danh sách phản hồi , thêm , sửa , xóa , trả lời phản hồi </el-tab-pane>
          <el-tab-pane label="Ứng dụng">Phản hồi đã trả lời</el-tab-pane>
        </el-tabs>
    </div> -->


    <table>
        <tr>
          <th>Company</th>
          <th>Contact</th>
          <th>Country</th>
        </tr>
        <tr>
          <td>Alfreds Futterkiste</td>
          <td>Maria Anders</td>
          <td>Germany</td>
        </tr>
        <tr>
          <td>Centro comercial Moctezuma</td>
          <td>Francisco Chang</td>
          <td>Mexico</td>
        </tr>
      </table>
  </template>

  <script>
  export default {
    name: 'HtpShiftDetail',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
      return {
        tabPosition: 'left'
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

  <style>
  /* CSS cho component */
  </style>
