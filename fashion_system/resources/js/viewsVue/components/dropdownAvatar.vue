<template>
  <div class="flex flex-wrap items-center">
    <el-dropdown>
      <el-avatar class="avatar-admin" :src="srcAvatar" />
      <template #dropdown>
        <el-dropdown-menu v-for="value in listDropdown" :key="value.key">
          <router-link
            :to="value.path"
            class="style-tag-a"
            @click="handleDropdownClick(value.key)"
          >
            <el-dropdown-item>
              <font-awesome-icon :icon="value.icon" />
              &ensp;{{ value.name }}
            </el-dropdown-item>
          </router-link>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>
</template>
<!-- <el-button plain> Error </el-button> -->
<script>
import listDropdown from "@/js/generalSetting/dropdownAvatarAdmin.js";
import logout from "@/js/auth/logout";
import { ElNotification } from "element-plus";
import methodDefine from "@/js/mixins/methodDefine.js";
import paths from "@/js/mixins/getAddressFromRouter.js";
import sessionStorage from "@/js/auth/sessionStorage.js";

export default {
  name: "dropdownAvatar",
  components: {},
  mixins: [logout, methodDefine],
  props: ["avatar"],
  setup() {},
  directives: {},
  data() {
    return {
      listDropdown: null,
      srcAvatar: this.avatar,
    };
  },
  watch: {
    avatar(value) {
      this.srcAvatar = value;
    },
  },
  created() {
    this.listDropdown = listDropdown;
    console.log(this.srcAvatar);
  },
  mounted() {},
  computed() {},
  updated() {},
  destroyed() {},
  methods: {
    async handleDropdownClick(key) {
      if (key == "logout") {
        sessionStorage.clearSession();
        const response = await this.logoutAdmin();
        if (response) {
          ElNotification({
            title: "Success",
            message: "Đăng xuất",
            type: "success",
          });
          this.goToPage(paths.login);
        } else {
          ElNotification({
            title: "Error",
            message: "Có lỗi trong quá trình đăng xuất",
            type: "error",
          });
          this.goToPage(paths.login);
        }
      }
    },
  },
};
</script>

<style scoped>
.example-showcase .el-dropdown + .el-dropdown {
  margin-left: 15px;
}

.example-showcase .el-dropdown-link {
  cursor: pointer;
  color: var(--el-color-primary);
  display: flex;
  align-items: center;
}
</style>
