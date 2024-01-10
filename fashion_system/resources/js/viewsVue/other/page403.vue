<template>
  <section id="page-403">
    <div id="bg-page-403" :style="`background-image: url(${background})`">
      <div class="content-page-403">
        <h1>TÀI KHOẢN ĐÃ BỊ KHÓA</h1>
      </div>
      <div class="button-home-403">
        <router-link :to="{ name: 'home' }" class="style-tag-a">
          <button>Home</button></router-link
        >
      </div>
    </div>
  </section>
</template>

<script>
import svgBG from "@/public/images/svg/page_403/bg_403.gif";

export default {
  name: "HtpShiftDetail",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {
      background: "",
    };
  },
  created() {
    this.background = svgBG;
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
#page-403 {
  width: 100%;
  height: 100vh;
  background-color: #fff;
  text-align: center;
  position: absolute;
}

#bg-page-403 {
  background-image: var(--svgBG);
  /* background-size: cover; */
  background-size: 78%;
  background-repeat: no-repeat;
  width: 80%;
  height: 100%;
  margin: 0 auto;
  background-position: center;
}

.content-page-403 {
  position: absolute;
  right: 0;
  left: 0;
}

.content-page-403 h1 {
  margin-top: 5rem;
  color: red;
  /* right: 0;
    left: 0;
    bottom: 0; */
}

.button-home-403 {
  position: absolute;
  bottom: 0;
  right: 0;
  left: 0;
  margin-bottom: 5rem;
}

.button-home-403 button {
  background-color: rgb(7 137 216);
  width: 6rem;
  height: 4rem;
  border-radius: 15px;
  border: none;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
}

.button-home-403 button:focus {
  background-color: #0edf12de;
  color: black;
}

.button-home-403 button:hover {
  background-color: #0edf12de;
  color: black;
}
</style>
