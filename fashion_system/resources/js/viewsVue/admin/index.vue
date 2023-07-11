<template>
  <div class="container">
    <!-- <circle-Menu :circleMenu="circleMenuAdmin"></circle-Menu> -->
  </div>
</template>
  
<script>
import circleMenuAdmin from "@/js/generalSetting/circleMenuAdmin.js";
import circleMenu from "@/js/viewsVue/components/circleMenu.vue";
export default {
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