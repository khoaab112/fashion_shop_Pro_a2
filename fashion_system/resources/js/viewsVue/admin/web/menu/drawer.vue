<template>
  <el-drawer v-model="visible" :show-close="false" @close="closeSide()">
    <template #header="{ close, titleId, titleClass }">
      <h4 v-if="typeShow == 'add' && dataShow.length == 0">Tạo menu</h4>
      <h4 v-else-if="typeShow == 'add' && dataShow.length != 0">Tạo menu con</h4>
      <h4 v-else-if="typeShow == 'edit' && dataShow.id_main">Chỉnh sửa menu</h4>
      <h4 v-else>Chỉnh sửa menu con</h4>
      <el-button type="danger" @click="closeSide">
        <font-awesome-icon icon="fa-regular fa-circle-xmark" class="me-2" />
        Close
      </el-button>
    </template>
    <strong class="mb-2" v-if="dataShow.main && dataShow.length != 0"
      >thuộc menu cha :
      <span class="text-danger">{{
        dataShow.sub ? dataShow.main.main : dataShow.main
      }}</span>
    </strong>
    <form action="">
      <div class="form-floating mb-3">
        <input
          type="text"
          class="form-control"
          id="nameInput"
          placeholder="Tên menu"
          v-model="dataMenu.name"
        />
        <label for="nameInput">Tên</label>
      </div>
      <!-- <div class="mb-3 group-input"> -->
      <label for="priorityInput">Vị trí ưu tiên</label>
      <input
        type="number"
        class="form-control"
        id="priorityInput"
        placeholder="1"
        v-model="dataMenu.order"
      />
      <div class="group-input">
        <label for="colorInput">Màu hiển thị</label>
        <input
          type="color"
          class="form-control"
          id="colorInput"
          placeholder="Màu"
          v-model="dataMenu.color"
        />
        <input
          type="text"
          class="form-control"
          id="colorInputText"
          placeholder="Màu"
          v-model="dataMenu.color"
          :style="{ color: dataMenu.color }"
          style="font-weight: bold"
        />
      </div>
      <!-- </div> -->
      <div class="list-btn">
        <button class="btn btn-save">
          <font-awesome-icon icon="fa-regular fa-floppy-disk" />
        </button>
        <button class="btn btn-clear" type="reset" @click="closeSide">
          <font-awesome-icon icon="fa-solid fa-xmark" />
        </button>
      </div>
    </form>
  </el-drawer>
</template>

<script>
import { ElButton, ElDrawer } from "element-plus";
export default {
  name: "Drawer-menu",
  components: {},
  props: ["data", "type", "isShow"],
  setup() {},
  directives: {},
  data() {
    return {
      visible: false,
      dataShow: "",
      typeShow: "",
      dataMenu: {
        name: "",
        color: "",
        order: "",
      },
    };
  },
  watch: {
    isShow(value) {
      this.visible = value ?? false;
    },
    type(value) {
      this.typeShow = value ?? "";
    },
    data(value) {
      console.log(value);
      this.dataShow = value ?? "";
      if (value == "") {
        return (this.dataMenu = {
          name: "",
          color: "",
          order: "",
        });
      }
      if (value.sub.id_sub) {
        this.dataMenu = {
          id_main: value.main.id_main,
          id_sub: value.sub.id_sub,
          name: value.sub.sub,
          color: value.sub.sub_color,
          order: value.sub.sub_order,
        };
      } else {
        this.dataMenu = {
          id_main: value.id_main,
          name: value.main,
          color: value.color,
          order: value.main_order,
        };
      }
    },
  },
  created() {
    // Logic khi component được khởi tạo
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
    closeSide() {
      this.visible = false;
      this.$emit("clone", true);
    },
  },
};
</script>

<style scoped>
.list-btn {
  display: flex;
  justify-content: flex-start;
  flex-direction: row-reverse;
  align-items: center;
  margin-top: 3rem;
  /* align-content: center; */
}
button.btn.btn-clear {
  margin-right: 20px;
}
input#colorInput,
input#priorityInput {
  width: 4rem;
  height: 3rem;
  padding: 2px;
  border: 2px solid #d9d9d9;
}
.group-input {
  display: flex;
  flex-wrap: nowrap;
  align-items: center;
  justify-content: space-between;
}
.btn {
  height: 3rem !important;
  width: 5rem !important;
  font-size: 25px !important;
}
input[type="number"] {
  text-align: center;
  font-weight: bold !important;
}
input#colorInputText {
  width: 7rem;
}
</style>
