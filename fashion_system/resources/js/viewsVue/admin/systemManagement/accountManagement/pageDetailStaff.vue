<template>
  <strong>khoa</strong>
</template>

<script>
export default {
  name: "detailStaff",
  components: {},
//   props: ['dataa'],
  setup() {},
  directives: {},
  data() {
    return {
        dataStaff:null,
    };
  },
  created() {
    this.dataStaff=JSON.parse(this.$route.query.child);
    console.log(this.dataStaff);

    // Logic khi component được khởi tạo
  },
  mounted() {
  },
  computed() {
    // được sử dụng để định nghĩa các thuộc tính tính toán
  },
  updated() {},
  destroyed() {},
  methods: {
  },
};
</script>

<style>

</style>
