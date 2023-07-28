<template>
<img :src=src class="rounded-circle shadow-4"
  style="width: 150px;" alt="Avatar" />
  </template>

  <script>
  export default {
    name: 'avatar',
  props: ['srcImg'],
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
      return {
        src:this.srcImg
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
