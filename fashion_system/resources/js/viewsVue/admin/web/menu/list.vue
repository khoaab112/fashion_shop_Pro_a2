<template>
  <div class="card">
    <div>
      <label for="">Đang hoạt động</label
      ><input type="checkbox" class="ms-2 form-check-input" checked disabled />
    </div>
    <div>
      <label for="">Dừng hoạt động</label
      ><input type="checkbox" class="ms-2 form-check-input" disabled />
    </div>
    <div>
      <Popper content="lưu" :hover="true">
        <button class="btn btn-save">
          <font-awesome-icon icon="fa-regular fa-floppy-disk" />
        </button>
      </Popper>

      <Popper content="Khóa / Dừng hoạt động" :hover="true">
        <button class="btn btn-block">
          <font-awesome-icon icon="fa-solid fa-ban" />
        </button>
      </Popper>

      <Popper content="Thay đổi độ ưu tiên" :hover="true">
        <button class="btn btn-change">
          <font-awesome-icon icon="fa-solid fa-list-ol" />
        </button>
      </Popper>

      <Popper content="Chỉnh sửa" :hover="true">
        <button class="btn btn-rename">
          <font-awesome-icon icon="fa-regular fa-pen-to-square" />
        </button>
      </Popper>
    </div>
    <div style="display: flex; align-items: center">
      <label for="" class="ms-2">Màu chữ:</label
      ><input type="color" class="form-control frm-custom_color-input" />
    </div>
    <div>
      <span><strong>Vị trí : </strong>độ ưu tiên hiển thị</span>
    </div>
  </div>
  <div v-if="dataMenu.length">
    <div class="block-content">
      <button class="btn btn-add me-3" @click="showDrawer('', 'add')">
        <font-awesome-icon icon="fa-solid fa-plus" />
      </button>
      <button class="btn-status">Thay đổi trạng thái</button>
    </div>
    <div v-for="(item, key) in dataMenu" :key="key" style="position: relative">
      <input type="checkbox" class="check-details" v-model="item.show" />
      <p class="check-details"><font-awesome-icon icon="fa-solid fa-play" /></p>
      <details class="ps-4 pb-5" :open="item.show">
        <summary>
          <input
            type="checkbox"
            :id="`${item.id_main}_id`"
            class="me-2 form-check-input"
            :checked="item.main_status"
            @change="checkAll(item)"
          />

          <span><strong>Vị trí : </strong>{{ item.main_order }}</span>
          <span><strong>Tên : </strong>{{ item.main }}</span>
          <span
            ><strong>Màu : </strong>{{ item.color }}
            <input type="color" class="input-view" :value="item.color" disabled />
          </span>
          <span>{{ item.color ?? "trống" }}</span>
          <button class="btn btn-rename ms-5" @click="showDrawer(item, 'edit')">
            <font-awesome-icon icon="fa-regular fa-pen-to-square" />
          </button>
          <button
            class="btn-add add-child"
            @click="showDrawer(item, 'add')"
            v-if="!item.is_created"
          >
            <font-awesome-icon icon="fa-solid fa-plus" />
          </button>
          <button class="btn-remove add-child" @click="showDrawer(item, 'add')" v-else>
            <font-awesome-icon icon="fa-solid fa-minus" />
          </button>
        </summary>
        <strong
          v-for="(itemSub, keySub) in item.sub"
          :key="keySub"
          v-if="item.sub.length > 0"
          class="ms-5 row"
        >
          <div class="col-7 custom-sub">
            <input
              type="checkbox"
              :id="`${itemSub.id_sub}_id`"
              class="me-2 form-check-input"
              :checked="item.main_status ? itemSub.sub_status : false"
            />
            <span><strong>Vị trí </strong>{{ itemSub.sub_order }}</span>
            <span><strong>Tên </strong>{{ itemSub.sub }}</span>
            <span
              ><strong>Màu </strong
              >{{ isColorCode(itemSub.sub_color) ? itemSub.sub_color : "null" }}</span
            >
            <span
              class="view-color"
              :style="{
                background: isColorCode(itemSub.sub_color)
                  ? itemSub.sub_color
                  : colorDefault,
              }"
            >
            </span>
          </div>
          <div class="col-5">
            <button
              class="btn btn-rename btn-child"
              @click="showDrawer({ main: item, sub: itemSub }, 'edit')"
            >
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </strong>
      </details>
    </div>
  </div>
  <!-- Tạo menu đầu tiên -->
  <div v-else class="ps-4">
    {{ dataMenu }}
    <strong class="">Chưa có Menu nào đươc tạo</strong>
    <br />
    <form v-if="showFromCreate" @submit.prevent="SubmitFormCreate">
      <label for="newName">Tên Menu : </label
      ><input
        type="text"
        id="newName"
        class="form-control ms-2"
        placeholder="Nhập tên menu chính"
        name="newName"
        v-model="dataCreateNew.name"
      />
      <span class="error-message-danger ms-2">
        {{ messageErrorCreate }}
      </span>
      <br />
      <div class="mt-3"></div>
      <label for="newColor">Màu chữ :</label>
      <input type="color" id="newColor" class="form-control ms-2" />
      <input
        type="text"
        class="form-control ms-2"
        placeholder="Nhập hoặc chọn màu"
        id="textColor"
      />
      <br />
      <div class="mt-3"></div>
      <label for="indexMenu">Vị trí ưu tiên (mặc định 1) :</label
      ><input type="text" id="indexMenu" class="form-control ms-2" disabled />
      <div class="mt-3"></div>
      <label for="activeMenu" class="form-check-label">Cho phép hoạt động :</label
      ><input
        type="checkbox"
        id="activeMenu"
        class="form-check-input ms-2 form-check-input"
      /><strong class="ms-2" :class="[dataCreateNew.status ? 'active' : 'block']">{{
        dataCreateNew.status ? "Hoạt động" : "Khóa"
      }}</strong>
      <div class="mt-3"></div>
      <div class="ls-btn">
        <button class="btn-from btn-clear" type="reset">
          <font-awesome-icon icon="fa-solid fa-eraser" />
        </button>
        <button class="btn-from btn-save" type="submit">
          <font-awesome-icon icon="fa-regular fa-floppy-disk" />
        </button>
      </div>
    </form>
    <button class="btn-from btn-add" v-else @click="showFromCreate = !showFromCreate">
      <font-awesome-icon icon="fa-solid fa-plus" />
    </button>
    <button class="btn btn-add"><font-awesome-icon icon="fa-solid fa-plus" /></button>
    <button class="btn btn-remove">
      <font-awesome-icon icon="fa-solid fa-minus" />
    </button>
    <button class="btn btn-save">
      <font-awesome-icon icon="fa-regular fa-floppy-disk" />
    </button>
    <button class="btn btn-block"><font-awesome-icon icon="fa-solid fa-ban" /></button>
    <button class="btn btn-change">
      <font-awesome-icon icon="fa-solid fa-list-ol" />
    </button>
    <button class="btn btn-rename">
      <font-awesome-icon icon="fa-regular fa-pen-to-square" />
    </button>
  </div>
  <DrawerMenu
    :data="dataDrawer.data"
    :type="dataDrawer.type"
    :isShow="dataDrawer.show"
    @clone="cloneDrawer"
  ></DrawerMenu>
</template>

<script>
import DrawerMenu from "./drawer.vue";
import { ElNotification } from "element-plus";
import Popper from "vue3-popper";
import methodDefine from "@/js/mixins/methodDefine.js";
export default {
  name: "list-menu",
  components: { Popper, DrawerMenu },
  mixins: [methodDefine],
  props: ["data"],
  setup() {},
  directives: {},
  data() {
    return {
      dataMenu: this.data,
      colorDefault: "#000",
      dataCreateNew: {
        name: "",
        color: "#000000",
        status: true,
        order: null,
      },
      dataCreateSub: {
        main_id: "",
        name: "",
        color: "#000000",
        status: true,
        order: null,
      },
      showFromCreate: false,
      messageErrorCreate: "",
      isCreateMenuMain: false,
      dataDrawer: {
        data: null,
        type: "",
        show: false,
      },
    };
  },

  watch: {
    data(value) {
      this.dataMenu = value;
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
    checkAll(data) {
      data.main_status = !data.main_status;
      data.sub.forEach((value) => {
        value.sub_status = !value.sub_status;
      });
    },
    SubmitFormCreate() {
      this.messageErrorCreate = "";
      if (this.dataCreateNew.name.length <= 0) {
        return (this.messageErrorCreate = "Tên Không được bỏ trống");
      }
    },
    createSubMenu(data) {
      this.dataCreateSub.main_id = data.id_main;
    },
    showDrawer(data, type) {
      this.dataDrawer = {
        data: data,
        type: type,
        show: true,
      };
    },
    cloneDrawer(value) {
      this.dataDrawer.show = !value;
    },
  },
};
</script>

<style scoped>
span.view-color {
  width: 2rem;
  height: 2rem;
}
.total-menu {
  display: flex;
  align-items: center;
  justify-content: space-around;
  flex-wrap: nowrap;
  margin-top: 1rem;
  font-weight: bold;
}
.create-menu > button {
  margin-left: 2rem;
}
.create-menu > strong {
  color: red;
  font-weight: bold;
}
.create-menu {
  display: flex;
  align-items: center;
  margin: 2rem 0 2rem 4rem;
  border: 1px solid #d9d9d9;
  padding: 14px;
  width: 80%;
}
div.card {
  margin: 0 2rem;
  margin: 0 2rem;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  flex-wrap: wrap;
  align-items: center;
}

strong label {
  font-size: 80%;
}
details > summary span {
  display: flex;
  align-items: center;
  align-content: center;
  flex-direction: column;
  margin-left: 4rem;
}
.check-details {
  position: absolute;
  top: 0;
  left: 13px;
  font-size: 20px;
}

input.check-details {
  z-index: 2;
  opacity: 0;
  width: 3rem !important;
  height: 2rem !important;
  left: 0;
}

input[type="checkbox"].check-details:checked + .check-details {
  font-weight: bold;
  color: red;
  transform: rotate(90deg);
}

input[type="checkbox"].check-details:hover + .check-details {
  transform: scale(1.2);
  color: blue;
}

summary {
  margin-left: 2rem;
  display: flex;
  align-items: center;
  margin-bottom: 1.3rem;
}

.block-content {
  display: flex;
  flex-wrap: nowrap;
  margin-right: 3rem;
  margin-top: 1rem;
  justify-content: flex-end;
}

:deep(.popper) {
  background: #1890ff;
  padding: 7px;
  border-radius: 15px;
  color: #fff;
  font-weight: bold;
  font-size: 80%;
}

.active {
  color: #2c96ff;
}

.block {
  color: red;
}

.btn-child {
  padding: 1px;
  width: 2.2rem;
  height: 2.3rem;
  border-radius: 50px;
  color: #d9d9d9;
}
.add-child {
  border: none;
  border-radius: 50px;
  padding: 5px 10px;
  margin-left: 1rem;
  transform: ease 0.3s;
}
.add-child:hover {
  transform: var(--transform-scale);
}
.btn-from {
  border: 1px solid white;
  border-radius: 20px;
  width: 51px;
  height: 51px;
  font-size: 18px;
  margin-right: 1rem;
}

#newName {
  width: 20rem;
  display: inline-block;
}

#newColor,
#indexMenu {
  width: 3rem;
  display: inline-block;
  text-align: center;
}

#textColor {
  width: 15rem;
  display: inline-block;
}

.ls-btn {
  display: flex;
  justify-content: center;
}

input[type="checkbox"] {
  box-sizing: border-box;
  padding: 0;
  height: 1.3rem;
  width: 1.3rem;
}

input.form-control.frm-custom_order {
  width: 5rem;
  height: 2rem;
  text-align: center;
  padding: 0;
  display: inline-block;
}

input.form-control.frm-custom_name {
  width: 18rem;
  height: 2rem;
  padding: 6px;
  display: inline-block;
  border: 2px solid red;
}

input.form-control.frm-custom_color {
  width: 7rem;
  height: 2rem;
  padding: 2px;
  display: inline-block;
}

input.form-control.frm-custom_color-input {
  width: 3rem;
  height: 2rem;
  padding: 4px;
  display: inline-block;
}

input.form-control.frm-custom_sub_order {
  width: 3rem;
  padding: 0;
  text-align: center;
  height: 2rem;
  display: inline-block;
}

input.form-control.frm-custom_sub_name {
  width: 13rem;
  padding: 5px;
  height: 2rem;
  display: inline-block;
  border: 2px solid #faad14;
}

input.form-control.frm-custom_sub_color-input {
  width: 3rem;
  padding: 5px;
  height: 2rem;
  display: inline-block;
}

input.form-control.frm-custom_sub_color {
  width: 5rem;
  padding: 5px;
  height: 2rem;
  display: inline-block;
}

.custom-sub {
  display: flex;
  align-items: center;
  justify-content: space-around;
  padding-bottom: 0.8rem;
}
</style>
