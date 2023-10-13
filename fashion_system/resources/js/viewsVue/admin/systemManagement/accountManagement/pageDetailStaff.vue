<template>
  <div class="text-center pt-4" v-if="!dataStaff">
    <loadingStyleTwirl></loadingStyleTwirl>
    <br />
    <loadingText></loadingText>
    <div class="cushion-loading"></div>
  </div>
  <main id="page-detai-staff" v-else>
    <div class="row ps-3 pe-3">
      <div class="mt-3"></div>
      <div class="col-4">
        <section class="card-row-1 card text-center staff-base">
          <div class="mt-2">
            <avatar :src="urlAvatar" class="avatar-staff"> </avatar>
          </div>
          <strong>
            {{ this.dataStaff.staff_name }}
          </strong>
          <strong>
            {{ this.dataStaff.sex ? "Nam" : "Nữ" }}
            {{ getYearOld(this.dataStaff.birthday) }}&nbsp;tuổi<br />{{
              this.dataStaff.birthday
            }}
            &nbsp;<font-awesome-icon
              icon="fa-solid fa-cake-candles"
              style="color: #16d1e9"
            />
          </strong>
        </section>
      </div>
      <div class="col-8">
        <section class="card-row-1 card">
          <div class="mt-2 row">
            <strong class="ps-5 col-5"> Họ tên : </strong>
            <p class="col-7">{{ this.dataStaff.staff_name }}</p>
          </div>
          <div class="row">
            <strong class="ps-5 col-5"> Sinh ngày : </strong>
            <p class="col-7">
              <input class="input-edit" :class="[{ 'hide-input': !showBtnEdit }]" />{{
                this.dataStaff.birthday
              }}
            </p>
          </div>
          <div class="row">
            <strong class="ps-5 col-5"> Giới tính : </strong>
            <p class="col-7">
              {{ this.dataStaff.sex ? "Nam" : "Nữ" }}
              <font-awesome-icon
                icon="fa-solid fa-mars"
                style="color: #0ed3e1"
                v-if="this.dataStaff.sex"
              />
              <font-awesome-icon icon="fa-solid fa-venus" style="color: #e8179b" v-else />
            </p>
          </div>
          <div class="row">
            <strong class="ps-5 col-5"> Địa chỉ : </strong>
            <p class="col-7">
              {{ this.dataStaff.staff_address }}
            </p>
          </div>
          <div class="row">
            <strong class="ps-5 col-5"> Số điện thoại: </strong>
            <p class="col-7">
              {{ this.dataStaff.phone_number }}
            </p>
          </div>
          <div class="row">
            <strong class="ps-5 col-5"> email: </strong>
            <p class="col-7">
              {{ this.dataStaff.email }}
            </p>
          </div>
          <strong class="ps-5" :class="[this.dataStaff.active ? 'check' : 'question']">
            <font-awesome-icon
              class="status-staff"
              icon="fa-regular fa-circle-check"
              style="color: #4bff0a"
              v-if="this.dataStaff.active"
            />
            <font-awesome-icon
              class="status-staff"
              icon="fa-solid fa-question"
              style="color: #ff0a0a"
              v-else
            />
            {{ this.dataStaff.active ? "Đã xác thực" : "Chưa xác thức" }}</strong
          >
        </section>
      </div>
    </div>
    <div class="row ps-3 pe-3 mt-4">
      <section class="col-8">
        <div class="card row-2">
          <div class="row mt-2 ms-2">
            <strong class="col-4">Chức vụ :</strong>
            <p class="col-8">{{ this.dataStaff.position_name }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Mã nhân viên :</strong>
            <p class="col-8">{{ this.dataStaff.code_staff }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Thuộc chi nhánh :</strong>
            <p class="col-8">{{ this.dataStaff.branch_name }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Địa chỉ chi nhánh :</strong>
            <p class="col-8">{{ this.dataStaff.branch_address }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Hotline :</strong>
            <p class="col-8">{{ this.dataStaff.hotline }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Quản lí chi nhánh :</strong>
            <p class="col-8">{{ this.dataStaff.manage }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-4">Thời gian làm việc :</strong>
            <p class="col-8">{{ this.dataStaff.working_time }}</p>
          </div>
        </div>
      </section>
      <section class="col-4">
        <div class="card row-2">
          <div class="row mt-2 ms-2">
            <strong class="col-5">Tài khoản</strong>
            <p class="col-7">{{ this.dataStaff.user_name }}</p>
          </div>
          <div class="row mt-2 ms-2">
            <strong class="col-5">Cấp độ</strong>
            <p class="col-7">{{ this.dataStaff.administration }}</p>
          </div>
          <div class="row ms-2">
            <strong class="col-5">Trạng thái</strong>
            <p class="col-7" :class="[this.dataStaff.status ? 'check' : 'question']">
              {{ this.dataStaff.status ? "Kích hoạt" : "Khóa" }}
            </p>
          </div>
          <div class="list-btn" v-if="!showBtnEdit">
            <button class="action action-block mt-1" @click="lockAccount()">
              {{ this.dataStaff.status ? "Khóa" : "Kích hoạt"
              }}<font-awesome-icon icon="fa-solid fa-lock" class="float-end pt-1" />
            </button>
            <button class="action action-log-out mt-2" @click="indirectlyDisconnect()">
              Đăng xuất cưỡng bức
              <font-awesome-icon
                icon="fa-solid fa-right-from-bracket"
                class="float-end pt-1"
              />
            </button>
            <button class="action action-reset mt-2">
              Reset mật khẩu
              <font-awesome-icon icon="fa-solid fa-retweet" class="float-end pt-1" />
            </button>
            <button class="action action-request mt-2" @click="dialogVisible = true">
              Yêu cầu chỉnh sửa thông tin
              <font-awesome-icon
                icon="fa-solid fa-plane-departure"
                class="float-end pt-1"
              />
            </button>
            <button class="action action-edit mt-2" @click="showBtnEdit = true">
              Can thiệp trực tiếp
              <font-awesome-icon
                icon="fa-regular fa-pen-to-square"
                class="float-end pt-1"
              />
            </button>
          </div>
          <div class="list-btn-edit" v-else>
            <strong class="text-edit">Chỉnh sửa</strong>
            <button class="btn edit-submit mt-2">Lưu</button>
            <button class="btn edit-clone mt-2" @click="showBtnEdit = false">Đóng</button>
          </div>
        </div>
      </section>
    </div>
    <!-- <div class="row">
      <div class="card">Tài khoản đã liên kết</div>
    </div> -->
    <div class="cushion"></div>
  </main>
  <el-dialog
    v-model="dialogVisible"
    title="Yêu cầu chỉnh sửa"
    width="50%"
    :before-close="handleClose"
  >
    <el-date-picker
      v-model="dataEditRequest.time"
      type="date"
      placeholder="Thời gian yêu cầu"
      :size="sizeElInput"
    />
    <el-input
      v-model="dataEditRequest.content"
      :rows="2"
      type="textarea"
      placeholder="Nội dung ghi chú"
      class="mt-2"
    />
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="clearEditRequest()">Đóng</el-button>
        <el-button type="primary" @click="editRequest()"> Gửi </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script>
import avatar from "../../../components/avatar.vue";
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";
import apiStaffAccount from "@/js/api/admin/apiStaffAccounts.js";
import { ElNotification } from "element-plus";
import loadingStyleTwirl from "../../../components/loading/loadingStyleTwirl.vue";
import loadingText from "../../../components/loading/loadingText.vue";

export default {
  name: "detailStaff",
  components: {
    avatar,
    loadingStyleTwirl,
    loadingText,
  },
  //   props: ['dataa'],
  setup() {},
  directives: {},
  data() {
    return {
      dataStaff: null,
      urlAvatar: null,
      dialogVisible: false,
      dataEditRequest: {
        time: null,
        content: null,
      },
      sizeElInput: "default",
      showBtnEdit: true,
    };
  },
  created() {
    this.getStaffDetail(this.decodeURL(this.$route.query.child));
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
    decodeURL(data) {
      return JSON.parse(decodeURIComponent(data));
    },
    getYearOld(date) {
      var today = new Date();
      var birthDate = new Date(date);
      var age = today.getFullYear() - birthDate.getFullYear();
      var m = today.getMonth() - birthDate.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      return age;
    },
    getStaffDetail(id) {
      apiStaffAccount
        .getStaffDetail(id)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.dataStaff = dataResponse.results;
            this.checkImageAdmin(this.dataStaff.img);
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
        });
    },
    lockAccount() {
      const data = {
        idAccount: this.dataStaff.account_id,
        status: !this.dataStaff.status,
        idStaff: this.dataStaff.staff_id,
      };
      apiStaffAccount
        .lockAccount(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.getStaffDetail(this.dataStaff.account_id);
            ElNotification({
              title: "Success",
              message: "Thay đổi thành công",
              type: "success",
            });
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
        });
    },
    indirectlyDisconnect() {
      apiStaffAccount
        .indirectlyDisconnect(this.dataStaff.staff_id)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: "Thành công",
              type: "success",
            });
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
        });
    },
    handleClose() {
      this.dialogVisible = !this.dialogVisible;
      this.dataEditRequest = {
        time: null,
        content: null,
      };
    },
    clearEditRequest() {
      this.dialogVisible = false;
      this.dataEditRequest = {
        time: null,
        content: null,
      };
    },
    editRequest() {
      if (!this.dataEditRequest.time) {
        return ElNotification({
          title: "Error",
          message: "Thời gian không được bỏ trống",
          type: "error",
        });
      }
      apiStaffAccount
        .editRequest(this.dataEditRequest, this.dataStaff.staff_id)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.dialogVisible = false;
            this.dataEditRequest = {
              time: null,
              content: null,
            };
            return ElNotification({
              title: "Success",
              message: "Thành công",
              type: "success",
            });
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
        });
    },
  },
};
</script>

<style scoped>
.input-edit {
  border-radius: 5px;
  border: 1px solid;
  padding: 0px 0.5rem;
}

.hide-input {
  outline: none;
  border: none;
}

.input-edit:focus {
  border-color: #5fa0a9 !important;
  outline: none;
  box-sizing: border-box;
}

.text-edit {
  position: absolute;
  top: -52px;
  font-size: 120%;
  color: red;
}

.edit-submit {
  background-color: #409eff;
}

.edit-clone {
  background-color: #909399;
}

.btn:hover {
  color: #000;
}

.btn {
  margin-bottom: 1rem;
}

.list-btn-edit {
  display: flex;
  justify-content: space-around;
  position: absolute;
  bottom: 0;
  right: 0;
  left: 0;
}

.list-btn {
  display: contents;
}

.cushion-loading {
  min-height: 35rem;
}

.cushion {
  height: 2rem;
}

.action-edit {
  background-color: aquamarine;
}

.action-block {
  background-color: red;
}

.action-log-out {
  background-color: yellow;
}

.action-reset {
  background-color: rgb(124, 233, 23);
}

.action-request {
  background-color: rgb(7, 137, 224);
}

button.action {
  font-size: 80%;
  margin: 0.2rem;
  padding: 0.2rem 0.5rem;
  border: none;
  border-radius: 15px;
  user-select: none;
  color: black;
}

button.action:hover {
  background-color: #0000001a;
}

.row-2 {
  min-height: 21rem;
}

.check {
  color: #4bff0a;
}

.question {
  color: #ff0a0a;
}

.status-staff {
  font-size: 2rem;
  padding-right: 1rem;
}

.line {
  border-top: 0.2px solid #00000059;
}

.staff-base {
  line-height: 2;
}

.card-row-1 {
  min-height: 18rem;
}

.card {
  background-color: #fffaeb;
  border: none;
  box-shadow: -1px 4px 8px 2px #88888863;
  color: cadetblue;
}
</style>
