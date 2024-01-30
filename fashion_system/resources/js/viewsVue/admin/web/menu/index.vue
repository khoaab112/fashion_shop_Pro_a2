<template>
  <div>
    <h4 class="pt-2 text-center">Quản lý Menu</h4>
  </div>
  <div>
    <el-tabs type="border-card" class="demo-tabs">
      <el-tab-pane>
        <template #label>
          <span class="custom-tabs-label">
            <font-awesome-icon icon="fa-solid fa-bars-staggered" class="me-2" />
            <span>Kiểu danh sách</span>
          </span>
        </template>
        <listMenu :data="dataMenu"></listMenu>
      </el-tab-pane>
      <el-tab-pane>
        <template #label>
          <span class="custom-tabs-label">
            <font-awesome-icon icon="fa-solid fa-table-list" class="me-2" />
            <span>Kiểu bảng</span>
          </span>
        </template>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import apiWeb from "@/js/api/admin/apiWeb.js";
import { ElNotification } from "element-plus";
import Popper from "vue3-popper";
import methodDefine from "@/js/mixins/methodDefine.js";
import listMenu from "./list.vue";
export default {
  name: "Menu-Vue",
  components: {
    Popper,
    listMenu,
  },
  mixins: [methodDefine],
  setup() {},
  directives: {},
  data() {
    return {
      dataMenu: [],
      totalMenu: {
        main: 0,
        sub: 0,
      },
    };
  },
  created() {
    this.getMenu();
  },
  mounted() {},
  computed() {},
  updated() {},
  methods: {
    getMenu() {
      apiWeb
        .menu()
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.dataMenu = dataResponse.results;
            this.dataMenu = dataResponse.results.reduce((acc, item) => {
              const existingGroup = acc.find((group) => group.id_main === item.id_main);
              if (existingGroup) {
                this.totalMenu.sub = this.totalMenu.sub + 1;
                // Nếu nhóm đã tồn tại, thêm dữ liệu vào mảng con sub
                existingGroup.sub.push({
                  id_sub: item.id_sub,
                  sub: item.sub,
                  sub_color: item.sub_color,
                  sub_status: item.sub_status,
                  sub_order: item.sub_order,
                });
              } else {
                // Nếu nhóm chưa tồn tại, tạo một nhóm mới và thêm vào mảng kết quả
                this.totalMenu.main = this.totalMenu.main + 1;
                this.totalMenu.sub = this.totalMenu.sub + 1;
                acc.push({
                  id_main: item.id_main,
                  main: item.main,
                  color: item.color,
                  main_status: item.main_status,
                  main_order: item.main_order,
                  show: true,
                  sub: [
                    {
                      id_sub: item.id_sub,
                      sub: item.sub,
                      sub_color: item.sub_color,
                      sub_status: item.sub_status,
                      sub_order: item.sub_order,
                    },
                  ],
                });
              }
              return acc;
            }, []);
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
  },
};
</script>

<style scoped></style>
