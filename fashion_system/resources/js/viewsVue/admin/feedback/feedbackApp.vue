<template>
    <div class="p-3">
          <el-tabs :tab-position="tabPosition" >
            <el-tab-pane label="Quản lý">Thêm sửa xóa các loại phản hồi</el-tab-pane>
            <el-tab-pane label="Danh sách ">danh sách phản hồi , thêm , sửa , xóa , trả lời phản hồi </el-tab-pane>
            <el-tab-pane label="Trả lời">Phản hồi đã trả lời</el-tab-pane>
          </el-tabs>
      </div>
  </template>

  <script>
  export default {
    name: 'feedbackApp',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
      return {
        tabPosition: 'left'      };
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
