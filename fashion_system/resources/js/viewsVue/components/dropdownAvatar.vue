<template>
    <div class="flex flex-wrap items-center">
      <el-dropdown>
        <el-avatar 
        :src=srcAvatar
      />
        <template #dropdown>
          <el-dropdown-menu v-for="value in listDropdown " :key="value.key">
            <el-dropdown-item> <font-awesome-icon :icon="value.icon" />&ensp;{{ value.name }}</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </template>
    
  <script>
  import listDropdown from '@/js/generalSetting/dropdownAvatarAdmin.js';
  export default {
    name: 'dropdownAvatar',
    components: {
    },
    props:['avatar'],
    setup() {
    },
    directives: {
    },
    data() {
      return {
        listDropdown:null,
        srcAvatar:this.avatar,
      };
    },
    created() {
      this.listDropdown=listDropdown;
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