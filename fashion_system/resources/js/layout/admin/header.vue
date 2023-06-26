<template>
  <div class="header-admin">
    <div class="info-staff">
    <el-avatar class="avatar-admin" :size="50" :src="circleUrl" />
    <span class="name-admin">Tên nhân viên</span>
    <br>
    <span class="level-admin">Level</span>
  </div>
    <button type="button" class="btn-sliders btn-header-admin"><font-awesome-icon :icon="['fas', 'sliders']" /></button>
    <button type="button" class="btn-bell btn-header-admin"> <font-awesome-icon :icon="['far', 'bell']" /></button>
  </div>
  <main>
    <div id="content-admin">
      <router-view></router-view>
    </div>
  </main>
</template>
  
<script>

export default {
  data() {
    return {
      circleUrl: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
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
  
<style>
/* CSS cho component */
.btn-header-admin {
  border: none;
    font-size: 24px;
    float: right;
    background: none;
    margin-right: 2rem;
    margin-top: -0.5rem;
}

.avatar-admin {
  margin-left: 0.5rem;
  margin-top: 0.3rem;
}
.header-admin{
  position: relative;
}
/* .header-admin>div.info-staff>span{
  position: absolute;

} */
span{
  position: absolute;
  margin-left: 4.8rem;
  margin-top: 0.4rem;
}
</style>