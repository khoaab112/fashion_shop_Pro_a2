<template>
  <div>
    <h4 class="pt-2 text-center">Quản lý Menu</h4>
    <button>Hiển thị dạng danh sách đóng mở</button>
    <button>Hiển thị danh sách dạng bảng</button>
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
        <button
          class="btn btn-add me-3"
          v-if="!isCreateMenuMain"
          @click="isCreateMenuMain = !isCreateMenuMain"
        >
          <font-awesome-icon icon="fa-solid fa-plus" />
        </button>
        <button
          class="btn btn-remove me-3"
          v-else
          @click="isCreateMenuMain = !isCreateMenuMain"
        >
          <font-awesome-icon icon="fa-solid fa-minus" />
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
            <button
              class="btn btn-rename ms-5"
              @click="item.disabled_edit = !item.disabled_edit"
            >
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
            <!-- <button class="btn btn-block">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-run">
              <font-awesome-icon icon="fa-solid fa-person-running" />
            </button>
            <button class="btn btn-save">
              <font-awesome-icon icon="fa-regular fa-floppy-disk" />
            </button> -->
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
                @click="itemSub.disabled_edit = !itemSub.disabled_edit"
              >
                <font-awesome-icon icon="fa-regular fa-pen-to-square" />
              </button>
              <!-- <button class="btn btn-block">
                <font-awesome-icon icon="fa-solid fa-ban" />
              </button>
              <button class="btn btn-run">
                <font-awesome-icon icon="fa-solid fa-person-running" />
              </button>
              <button class="btn btn-save">
                <font-awesome-icon icon="fa-regular fa-floppy-disk" />
              </button> -->
            </div>
          </strong>
          <div class="create-menu" v-show="item.is_created">
            <strong>Tạo mới</strong>
            <label for="" class="ms-2">Vị trí :</label
            ><input
              type="number"
              class="form-control frm-custom_sub_order"
              v-model="dataCreateSub.order"
            />
            <label for="" class="ms-2">Tên :</label
            ><input
              type="text"
              class="form-control frm-custom_sub_name"
              v-model="dataCreateSub.name"
            />
            <label for="" class="ms-2">Màu :</label
            ><input
              type="color"
              class="form-control frm-custom_sub_color-input"
              v-model="dataCreateSub.color"
            />
            <input
              type="text"
              class="form-control frm-custom_sub_color"
              v-model="dataCreateSub.color"
            />
            <button class="btn btn-save" @click="createSubMenu(item)">
              <font-awesome-icon icon="fa-regular fa-floppy-disk" />
            </button>
          </div>
          <button
            class="btn-add add-child"
            @click="item.is_created = !item.is_created"
            v-if="!item.is_created"
          >
            <font-awesome-icon icon="fa-solid fa-plus" />
          </button>
          <button
            class="btn-remove add-child"
            @click="item.is_created = !item.is_created"
            v-else
          >
            <font-awesome-icon icon="fa-solid fa-minus" />
          </button>
        </details>
      </div>
      <div class="create-menu" v-show="isCreateMenuMain">
        <strong>Tạo mới</strong>
        <label for="" class="ms-2">Vị trí :</label
        ><input
          type="number"
          class="form-control frm-custom_sub_order"
          v-model="dataCreateNew.order"
        />
        <label for="" class="ms-2">Tên :</label
        ><input
          type="text"
          class="form-control frm-custom_sub_name"
          v-model="dataCreateNew.name"
        />
        <span class="error-message-danger ms-2">
          {{ messageErrorCreate }}
        </span>
        <label for="" class="ms-2">Màu :</label
        ><input
          type="color"
          class="form-control frm-custom_sub_color-input"
          v-model="dataCreateNew.color"
        />
        <input
          type="text"
          class="form-control frm-custom_sub_color"
          v-model="dataCreateNew.color"
        />
        <!-- <button class="btn btn-save" @click="SubmitFormCreate()">
          <font-awesome-icon icon="fa-regular fa-floppy-disk" />
        </button> -->
      </div>
    </div>
    <!-- Tạo menu đầu tiên -->
    <div v-else class="ps-4">
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
  </div>
</template>

<script>
import apiWeb from "@/js/api/admin/apiWeb.js";
import { ElNotification } from "element-plus";
import Popper from "vue3-popper";
import methodDefine from "@/js/mixins/methodDefine.js";
export default {
  name: "Menu-Vue",
  components: {
    Popper,
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
                  disabled_edit: true,
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
                  disabled_edit: true,
                  is_created: false,

                  sub: [
                    {
                      id_sub: item.id_sub,
                      sub: item.sub,
                      sub_color: item.sub_color,
                      sub_status: item.sub_status,
                      sub_order: item.sub_order,
                      disabled_edit: true,
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
  },
};
</script>

<style scoped>
span.view-color {
  width: 2rem;
  height: 2rem;
}
.btn-run {
  color: white;
  background-color: #52c41a;
}
.btn-status {
  color: white;
  background-color: var(--btn-save-color);
  border: none;
  padding: 5px 7px;
  border-radius: 5px;
  transition: ease 0.3s;
}
.btn-status:hover {
  transform: scale(1.07);
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

.btn {
  border: 1px solid white;
  border-radius: 10px;
  width: 45px;
  height: 36px;
  font-size: 16px;
  transition: ease 0.4s;
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
  margin-left: 3.6rem;
}
.btn-from {
  border: 1px solid white;
  border-radius: 20px;
  width: 51px;
  height: 51px;
  font-size: 18px;
  margin-right: 1rem;
}

.btn:hover,
.btn-from:hover {
  transform: scale(1.07);
}

.btn-add {
  color: white;
  background-color: #44c767;
}

.btn-remove {
  color: white;
  background-color: red;
}

.btn-save {
  color: white;
  background-color: #2c96ff;
}

.btn-block {
  color: white;
  background-color: orange;
}

.btn-change {
  color: white;
  background-color: #8313f3;
}

.btn-rename {
  color: white;
  background-color: #3dd1e7;
}

.btn-clear {
  border: 1px solid #d9d9d9;
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
