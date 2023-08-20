<template>
   <router-view name="auth" />
   <router-view name="sidebar" />
   <router-view name="header" />
   <router-view />
   <router-view name="footer" />
   <router-view name="home"></router-view>
   <router-view name="error"></router-view>
</template>
<script>
export default {
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
   updated() {

   },
   destroyed() {

   },
   methods: {
      // Các phương thức xử lý sự kiện hoặc logic khác
   },
};
</script>
<style >

</style>
