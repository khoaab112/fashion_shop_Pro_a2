<template>
    <div class="container">
      <!-- <circle-Menu :circleMenu="circleMenuAdmin"></circle-Menu> -->
     box : thời tiết
     <br>
     box : thông tin cơ bản nhân viên
     <br>
     box : thông báo
     <br>
     box : người đang on
     <br>
     box : sự kiện
     <br>
     <button><router-link to="/error403" class="style-tag-a ">Giới thiệu</router-link></button>
    </div>
  </template>

  <script>
  import circleMenuAdmin from "@/js/generalSetting/circleMenuAdmin.js";
  import circleMenu from "@/js/viewsVue/components/circleMenu.vue";
  export default {
    name:"homeAdmin",
        components: {
      circleMenu,
    },
    data() {
      return {
        circleMenuAdmin: circleMenuAdmin.menu,
      };
    },
    created() {
    },
    mounted() {

    },
    computed: {
    },
    methods: {

    },
  };
  </script>
  <style></style>
