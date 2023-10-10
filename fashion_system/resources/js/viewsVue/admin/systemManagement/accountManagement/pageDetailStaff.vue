<template>
  <main id="page-detai-staff">
    <div class="row ps-3 pe-3">
      <div class="mt-3"></div>
      <div class="col-4">
        <section class="card-row-1 card text-center">
          <div class="mt-2">
            <avatar :src="urlAvatar" class="avatar-staff"> </avatar>
          </div>
          avatar ,tuổi , tên , giới tính
        </section>
      </div>
      <div class="col-8">
        <section class="card-row-1 card">thôg tin cơ bản nhân viên</section>
      </div>
    </div>
  </main>
</template>

<script>
import avatar from "../../../components/avatar.vue";
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";

export default {
  name: "detailStaff",
  components: {
    avatar,
  },
  //   props: ['dataa'],
  setup() {},
  directives: {},
  data() {
    return {
      dataStaff: null,
      urlAvatar: null,
    };
  },
  created() {
    this.dataStaff = JSON.parse(this.$route.query.child);
    this.checkImageAdmin(this.dataStaff.data.value.img);
    // Logic khi component được khởi tạo
  },
  mounted() {},
  computed() {
    // được sử dụng để định nghĩa các thuộc tính tính toán
  },
  updated() {},
  destroyed() {},
  methods: {
    checkImageAdmin(img) {
      console.log(img);
      try {
        if (img) {
          const publicPath = window.location.origin + "/public";
          const imagePath = `data_client/${img}`;
          // const urlImage = new URL(imagePath, publicPath).href
          this.urlAvatar = new URL(imagePath, publicPath).href;
          return;
        }
        this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href;
        return;
      } catch (e) {
        this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href;
        console.error(e);
        return;
      }
    },
  },
};
</script>

<style scoped>
.card-row-1 {
  min-height: 18rem;
}

.card {
  background-color: #cecccd70;
  border: none;
  box-shadow: -1px 4px 8px 3px #888888;
}
</style>
