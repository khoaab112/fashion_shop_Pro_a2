<template>
  <div class="flex flex-wrap items-center">
    <el-dropdown>
      <el-avatar :src=srcAvatar />
      <template #dropdown>
        <el-dropdown-menu v-for="value in listDropdown " :key="value.key">
          <el-dropdown-item >
            <router-link :to=value.path class="style-tag-a" @click="handleDropdownClick(value.key)" >
              <font-awesome-icon :icon="value.icon" />
              &ensp;{{ value.name }}
            </router-link>
          </el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>
</template>
<!-- <el-button plain> Error </el-button> -->
<script>
import listDropdown from '@/js/generalSetting/dropdownAvatarAdmin.js';
import logout from '@/js/auth/logout';
import { ElNotification } from 'element-plus'
import methodDefine from '@/js/mixins/methodDefine.js';
import paths from '@/js/mixins/getAddressFromRouter.js';

export default {
  name: 'dropdownAvatar',
  components: {
  },
  mixins: [
    logout,
    methodDefine,
  ],
  props: ['avatar'],
  setup() {
  },
  directives: {
  },
  data() {
    return {
      listDropdown: null,
      srcAvatar: this.avatar,
    };
  },
  created() {
    this.listDropdown = listDropdown;
  },
  mounted() {
  },
  computed() {
  },
  updated() {

  },
  destroyed() {

  },
  methods: {
    async handleDropdownClick(key) {
      if (key == 'logout') {
        const response = await this.logoutAdmin();
        if (response) {
          ElNotification({
            title: 'Success',
            message: 'Đăng xuất',
            type: 'success',
          });
          this.goToPage(paths.login);
        }
        else {
          ElNotification({
            title: 'Error',
            message: 'Có lỗi trong quá trình đăng xuất',
            type: 'error',
          });
          this.goToPage(paths.login);
        }
      }
    }
  },
};
</script>
    
<style scoped>
.example-showcase .el-dropdown+.el-dropdown {
  margin-left: 15px;
}

.example-showcase .el-dropdown-link {
  cursor: pointer;
  color: var(--el-color-primary);
  display: flex;
  align-items: center;
}
</style>