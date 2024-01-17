<template>
  <div>
    <h4 class="pt-2 text-center">Quản lý Menu</h4>
    <code
      ><ul>
        <li>đổi màu</li>
        <li>đổi tên</li>
        <li>thêm</li>
        <li>sửa</li>
        <li>active</li>
        <li>đổi index</li>
        <li>Thêm icon</li>
      </ul></code
    >
    <details class="ps-4" v-for="(item, key) in dataMenu" :key="key" open>
      <summary>
        <input
          type="checkbox"
          :id="`${item.id_main}_id`"
          class="me-2"
          :checked="item.checked"
          @change="checkAll(item)"
        />
        <label :for="`${item.id_main}_id`">{{ item.main }}</label>
      </summary>
      <strong v-for="(itemSub, keySub) in item.sub" :key="keySub" class="ms-5">
        <input
          type="checkbox"
          :id="`${itemSub.id_sub}_id`"
          class="me-2"
          :checked="itemSub.checked"
        />
        <label :for="`${itemSub.id_sub}_id`">{{ itemSub.sub }}</label
        ><br />
      </strong>
    </details>
  </div>
</template>

<script>
import apiWeb from "@/js/api/admin/apiWeb.js";
import { ElNotification } from "element-plus";

export default {
  name: "Menu-Vue",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {
      dataMenu: [],
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
                // Nếu nhóm đã tồn tại, thêm dữ liệu vào mảng con sub
                existingGroup.sub.push({
                  id_sub: item.id_sub,
                  sub: item.sub,
                  sub_color: item.sub_color,
                  sub_status: item.sub_status,
                  sub_order: item.sub_order,
                  checked: false,
                });
              } else {
                // Nếu nhóm chưa tồn tại, tạo một nhóm mới và thêm vào mảng kết quả
                acc.push({
                  id_main: item.id_main,
                  main: item.main,
                  color: item.color,
                  main_status: item.main_status,
                  main_order: item.main_order,
                  checked: false,
                  sub: [
                    {
                      id_sub: item.id_sub,
                      sub: item.sub,
                      sub_color: item.sub_color,
                      sub_status: item.sub_status,
                      sub_order: item.sub_order,
                      checked: false,
                    },
                  ],
                });
              }
              return acc;
            }, []);
            console.log(this.dataMenu);
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
    checkAll(data) {
      data.checked = !data.checked;
      data.sub.forEach((value) => {
        value.checked = !value.checked;
      });
    },
  },
};
</script>

<style>
/* CSS cho component */
</style>
