<template>
   <router-view name="sidebar" />
   <section class="home">
      <!-- <div class="text">Dashboard Sidebar</div> -->
      <router-view name="header" />"
   </section>
   <router-view name="footer" />
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
.home {
    position: absolute;
    top: 0;
    left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    background-color: var(--body-color);
    transition: var(--tran-05);
}

.home .text {
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 12px 60px;
}

.sidebar.close~.home {
    left: 78px;
    height: 100vh;
    width: calc(100% - 78px);
}

body.dark .home .text {
    color: var(--text-color);
}
</style>