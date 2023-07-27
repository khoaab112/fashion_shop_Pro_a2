<template>
  <div class="flex flex-wrap items-center">
    <el-dropdown>
      <el-avatar :src=srcAvatar />
      <template #dropdown>
        <el-dropdown-menu v-for="value in listDropdown " :key="value.key">
          <el-dropdown-item @click="handleDropdownClick(value.key)"> <font-awesome-icon :icon="value.icon" />&ensp;{{
            value.name }}</el-dropdown-item>
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

export default {
  name: 'dropdownAvatar',
  components: {
  },
  mixins: [
    logout,
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
    handleDropdownClick(key) {

      if (key == 'logout') {
        const response = this.logoutAdmin();
        if (11,response) {

          console.log(response);
          ElNotification({
            title: 'Error',
            message: 'Có lỗi trong quá trình đăng nhập',
            type: 'error',
          });
        }
        else
        {
          ElNotification({
            title: 'Error',
            message: 'Có lỗi trong quá trình đăng xuất',
            type: 'error',
          });
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