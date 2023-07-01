<template>
   <router-view name="sidebar" />
   <section class="home">
      <div class="text">Dashboard Sidebar</div>
   </section>
   <!-- <router-view name="footer" /> -->
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
<style ></style>