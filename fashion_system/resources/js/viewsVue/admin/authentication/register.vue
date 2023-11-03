<template>
  <div class="limiter">
    <div class="container-login100">
      <div class="wrap-login100">
        <h2 class="title-page-register">QUẢN TRỊ</h2>
        <form class="login100-form validate-form">
          <span class="login100-form-title"> Đăng ký tài khoản </span>
          <div class="wrap-input100 validate-input">
            <input
              class="input100"
              type="text"
              name="staffCode"
              placeholder="Mã nhân viên"
              v-model="dataFrom.code_staff"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-solid fa-hashtag" />
            </span>
            <button class="check-info" @click.prevent="searchCode(dataFrom.code_staff)">
              <font-awesome-icon icon="fa-solid fa-magnifying-glass" />
            </button>
          </div>
          <div class="wrap-input100 validate-input">
            <input
              class="input100 name"
              type="text"
              name="staffName"
              placeholder="Tên Nhân Viên"
              v-model="dataFrom.name"
              disabled
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-solid fa-pen-nib" />
            </span>
          </div>
          <div class="wrap-input100 validate-input">
            <input
              class="input100"
              type="text"
              name="phoneNumber"
              placeholder="Số điện thoại"
              v-model="dataFrom.phone_number"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-solid fa-phone" />
            </span>
          </div>
          <div class="wrap-input100 validate-input">
            <input
              class="input100"
              type="text"
              name="email"
              placeholder="Email"
              v-model="dataFrom.email"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-regular fa-envelope-open" />
            </span>
          </div>
          <!-- <div class="wrap-input100 validate-input">
            <input
              class="input100"
              type="text"
              name="userName"
              placeholder="Tài khoản"
              autocomplete="off"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-regular fa-user" />
            </span>
          </div> -->
          <div class="wrap-input100 validate-input">
            <input
              class="input100"
              :type="typePassword"
              name="password"
              placeholder="Mật khẩu"
              autocomplete="off"
              v-model="dataFrom.password"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-solid fa-key" />
            </span>
            <span class="icon-eye" @click="showPassword('password')">
              <font-awesome-icon icon="fa-regular fa-eye-slash" v-if="isShowPassword" />
              <font-awesome-icon icon="fa-regular fa-eye" v-else />
            </span>
          </div>
          <div class="wrap-input100 validate-input">
            <input
              class="input100"
              :type="typePasswordConfirm"
              name="passConfirm"
              placeholder="Xác thực lại mật khẩu"
              v-model="dataFrom.passwordConfirm"
              autocomplete="off"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <font-awesome-icon icon="fa-solid fa-key" />
            </span>
            <span class="icon-eye" @click="showPassword('confirm')">
              <font-awesome-icon
                icon="fa-regular fa-eye-slash"
                v-if="isShowPasswordConfirm"
              />
              <font-awesome-icon icon="fa-regular fa-eye" v-else />
            </span>
          </div>
          <span class="err">
            <ul v-for="item in listErrors">
              <li>{{ item }}</li>
            </ul>
            <ul class="notification" v-for="item in notification">
              <li>{{ item }}</li>
            </ul>
          </span>
        </form>
        <div class="container-login100-form-btn">
          <button class="login100-form-btn send" @click="checkFrom()">
            Gửi thông tin đăng ký
          </button>
        </div>

        <div class="p-t-12">
          <span class="note-create"
            >*Thông tin của bạn sẽ được gửi tới admin để xác thực và tạo tài khoản</span
          >
          <br />
          <span class="note-create"
            >* Thông tin tài khoản trả về sẽ được gửi qua mail</span
          >
          <br />
          <span class="note-create"
            >* Vui lòng liên hệ chủ quản để tạo tài khoản xác thực nhanh hơn</span
          >
          <br />
          <span class="note-create" style="color: blue !important"
            >*Lưu ý đây là bản thử nghiệm gmail chưa được xác thực nên bạn hãy kiểm tra
            tin nhắn spam</span
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiStaff from "@/js/api/admin/apiStaff.js";
import apiAdmin from "@/js/api/admin/apiAdmin.js";
import { ElNotification, ElMessageBox } from "element-plus";
import { ElMessage } from "element-plus";
import router from "@/js/routerVue/index.js";

export default {
  name: "registerAdmin",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {
      isShowPassword: false,
      isShowPasswordConfirm: false,
      typePassword: "password",
      typePasswordConfirm: "password",
      dataFrom: {
        code_staff: null,
        name: null,
        email: null,
        staff_id: null,
        administration_id: 1,
        phone_number: null,
        password: null,
        passwordConfirm: null,
      },
      systemData: null,
      listErrors: [],
      notification: [],
    };
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
    showPassword(code) {
      switch (code) {
        case "password":
          this.isShowPassword = !this.isShowPassword;
          this.typePassword = this.isShowPassword ? "text" : "password";
          break;
        case "confirm":
          this.isShowPasswordConfirm = !this.isShowPasswordConfirm;
          this.typePasswordConfirm = this.isShowPasswordConfirm ? "text" : "password";
          break;
        default:
          this.isShowPassword = !this.isShowPassword;
          this.typePassword = this.isShowPassword ? "text" : "password";
      }
    },
    async checkFrom() {
      this.isValidData = false;
      this.listErrors = [];
      if (!this.dataFrom.code_staff) {
        this.listErrors.push("Mã nhân viên đang trống");
      }
      var resultCheckCode = await this.checkCode(this.dataFrom.code_staff);
      if (!resultCheckCode) {
        return;
      }
      if (!this.dataFrom.email) {
        this.listErrors.push("Email đang bị bỏ trống");
      }
      if (!this.dataFrom.phone_number) {
        this.listErrors.push("Số điện thoại đang bị bỏ trống");
      }
      if (!this.dataFrom.password) {
        this.listErrors.push("Mật khẩu đang bị bỏ trống");
      } else if (!this.dataFrom.passwordConfirm) {
        this.listErrors.push("Mật khẩu xác thực đang bị bỏ trống");
      } else if (this.dataFrom.password != this.dataFrom.passwordConfirm) {
        this.listErrors.push("Mật khẩu đang nhập không hợp lệ");
      }
      //   if (this.listErrors.length > 0) return;
      if (this.dataFrom.email != this.systemData.email) {
        this.notification.push(
          "Mail bạn đã có trên hệ thống, tôi đã chuyên về email hệ thống"
        );
      }
      if (this.dataFrom.phone_number != this.systemData.phone_number) {
        this.notification.push(
          "Số điện thoại đã có trên hệ thống, tối đã chuyển về số điện thoại hệ thống"
        );
      }
      console.log(this.systemData);
      let { code_staff, name, email, phone_number } = this.systemData;
      let staff_id = this.systemData.id;
      this.dataFrom = Object.assign({}, this.dataFrom, {
        code_staff,
        name,
        email,
        staff_id,
        phone_number,
      });
      if (this.listErrors.length > 0) return;
      if (this.systemData.active) {
        return ElMessage.error("Tôi đã thấy tài khoản của bạn đã được kích hoạt");
      }
      this.isValidData = true;
      // gửi
      this.sendRequire();
    },
    async searchCode(code) {
      var result = await this.checkCode(code);
      if (result) {
        let { code_staff, name, email, staff_id, phone_number } = this.systemData;
        this.dataFrom = Object.assign({}, this.dataFrom, {
          code_staff,
          name,
          email,
          staff_id,
          phone_number,
        });
      }
      return;
    },
    async checkCode(staffCode) {
      if (!staffCode) {
        ElNotification({
          title: "Warning",
          message: "Hãy nhập mã",
          type: "warning",
        });
        return false;
      }
      let result = apiStaff
        .checkStaffCode(staffCode)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.systemData = dataResponse.results;
            if (this.systemData.active) {
              ElMessage.error("Tôi đã thấy tài khoản của bạn đã được kích hoạt");
            } else
              ElNotification({
                title: "Success",
                message: "Tìm thấy thông tin nhân viên trên hệ thống",
                type: "success",
              });
            return true;
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
          return false;
        });
      return result;
    },
    sendRequire() {
      this.listErrors = [];
      this.dataFrom.user_name = this.dataFrom.phone_number;
      let creator = "staff";
      apiAdmin
        .register(this.dataFrom, creator)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElMessageBox.confirm(
              "Bạn đã đăng kí thành công, một mail sẽ gửi đến mail của bạn nếu xác thực thành công",
              "Thông báo",
              {
                confirmButtonText: "OK",
                cancelButtonText: "Cancel",
                type: "success",
              }
            );
            router.push({ name: "login" });
          } else {
            for (const key in dataResponse.results) {
              if (dataResponse.results.hasOwnProperty(key)) {
                const errorMessages = dataResponse.results[key];
                errorMessages.forEach((errorMessage) => {
                  this.listErrors.push(errorMessage);
                });
              }
            }
          }
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
/*--------------------------------------------*/

button.check-info {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 15px;
}

button.check-info:active {
  color: red;
}

.send {
  background: #3872f7 !important;
}

span.err {
  line-height: 1.5;
  color: red;
  font-size: 80%;
}

.notification {
  color: blue;
}

span.err ul li {
  list-style-type: circle;
}

.btn-check {
  background-color: black;
}

.name {
  background-color: #00000057 !important;
}

.limiter input {
  outline: none;
  border: none;
}

textarea:focus,
input:focus {
  border-color: transparent !important;
}

input:focus::-webkit-input-placeholder {
  color: transparent;
}

input:focus:-moz-placeholder {
  color: transparent;
}

input:focus::-moz-placeholder {
  color: transparent;
}

input:focus:-ms-input-placeholder {
  color: transparent;
}

textarea:focus::-webkit-input-placeholder {
  color: transparent;
}

textarea:focus:-moz-placeholder {
  color: transparent;
}

textarea:focus::-moz-placeholder {
  color: transparent;
}

textarea:focus:-ms-input-placeholder {
  color: transparent;
}

input::-webkit-input-placeholder {
  color: #999999;
}

input:-moz-placeholder {
  color: #999999;
}

input::-moz-placeholder {
  color: #999999;
}

input:-ms-input-placeholder {
  color: #999999;
}

textarea::-webkit-input-placeholder {
  color: #999999;
}

textarea:-moz-placeholder {
  color: #999999;
}

textarea::-moz-placeholder {
  color: #999999;
}

textarea:-ms-input-placeholder {
  color: #999999;
}

/*---------------------------------------------*/

button {
  outline: none !important;
  border: none;
  background: transparent;
}

button:hover {
  cursor: pointer;
}

iframe {
  border: none !important;
}

/*//////////////////////////////////////////////////////////////////
[ Utility ]*/

.txt1 {
  font-family: Poppins-Regular;
  font-size: 13px;
  line-height: 1.5;
  color: #999999;
}

.txt2 {
  font-family: Poppins-Regular;
  font-size: 13px;
  line-height: 1.5;
  color: #666666;
}

/*//////////////////////////////////////////////////////////////////
[ login ]*/

.limiter {
  width: 100%;
  margin: 0 auto;
}

.container-login100 {
  width: 100%;
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding: 15px;
  background: #9053c7;
  background: -webkit-linear-gradient(-135deg, #c850c0, #4158d0);
  background: -o-linear-gradient(-135deg, #c850c0, #4158d0);
  background: -moz-linear-gradient(-135deg, #c850c0, #4158d0);
  background: linear-gradient(-135deg, #50c86f, #4158d0);
  /* background: linear-gradient(-135deg, #c850c0, #4158d0); */
}

.wrap-login100 {
  background: #fff;
  border-radius: 10px;
  overflow: hidden;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: block;
  /* flex-wrap: wrap; */
  justify-content: space-between;
  /* padding: 177px 130px 33px 95px; */
  padding: 50px 120px 0px 120px;
  width: 40rem;
  position: relative;
}

/*------------------------------------------------------------------
[  ]*/

.login100-pic {
  width: 316px;
}

.login100-pic img {
  max-width: 100%;
}

/*------------------------------------------------------------------
[  ]*/

.login100-form {
}

.login100-form-title {
  font-size: 24px;
  color: #333333;
  line-height: 1.2;
  text-align: center;
  width: 100%;
  display: block;
  padding-bottom: 30px;
  padding-top: 20px;
}

/*---------------------------------------------*/

.wrap-input100 {
  position: relative;
  width: 100%;
  z-index: 1;
  margin-bottom: 10px;
}

.input100 {
  font-size: 15px;
  line-height: 1.5;
  color: #666666;
  display: block;
  width: 100%;
  background: #e6e6e6;
  height: 50px;
  border-radius: 25px;
  padding: 0 30px 0 68px;
}

/*------------------------------------------------------------------
[ Focus ]*/

.focus-input100 {
  display: block;
  position: absolute;
  border-radius: 25px;
  bottom: 0;
  left: 0;
  z-index: -1;
  width: 100%;
  height: 100%;
  box-shadow: 0px 0px 0px 0px;
  color: rgba(87, 184, 70, 0.8);
}

.input100:focus + .focus-input100 {
  -webkit-animation: anim-shadow 0.5s ease-in-out forwards;
  animation: anim-shadow 0.5s ease-in-out forwards;
}

@-webkit-keyframes anim-shadow {
  to {
    box-shadow: 0px 0px 70px 25px;
    opacity: 0;
  }
}

@keyframes anim-shadow {
  to {
    box-shadow: 0px 0px 70px 25px;
    opacity: 0;
  }
}

.symbol-input100 {
  font-size: 15px;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  position: absolute;
  border-radius: 25px;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding-left: 35px;
  pointer-events: none;
  color: #666666;
  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.input100:focus + .focus-input100 + .symbol-input100 {
  color: #57b846;
  padding-left: 28px;
}

/*------------------------------------------------------------------
[ Button ]*/

.container-login100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding-top: 20px;
}

.login100-form-btn {
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  width: 70%;
  height: 50px;
  border-radius: 25px;
  background: #3db5ab;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 25px;
  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #99e60a;
}

.title-page-register {
  position: relative;
  /* top: -75px; */
  text-align: center;
  font-weight: bold;
}

/*------------------------------------------------------------------
[ Responsive ]*/

@media (max-width: 992px) {
  .wrap-login100 {
    /* padding: 177px 90px 33px 85px; */
  }

  .login100-pic {
    width: 35%;
  }
}

@media (max-width: 768px) {
  .wrap-login100 {
    padding: 100px 80px 33px 80px;
  }

  .login100-pic {
    display: none;
  }

  .login100-form {
    width: 100%;
  }

  .title-page-register {
    position: relative;
    top: -75px;
    text-align: center;
    font-weight: bold;
  }

  .login100-form-title {
    padding-top: 0px;
    margin-bottom: 2rem;
  }
}

@media (max-width: 576px) {
  .wrap-login100 {
    padding: 100px 15px 33px 15px;
  }
}

/*------------------------------------------------------------------
[ Alert validate ]*/

.validate-input {
  position: relative;
}

.alert-validate::before {
  content: attr(data-validate);
  position: absolute;
  max-width: 70%;
  background-color: white;
  border: 1px solid #c80000;
  border-radius: 13px;
  padding: 4px 25px 4px 10px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  right: 8px;
  pointer-events: none;
  color: #c80000;
  font-size: 13px;
  line-height: 1.4;
  text-align: left;
  visibility: hidden;
  opacity: 0;
  -webkit-transition: opacity 0.4s;
  -o-transition: opacity 0.4s;
  -moz-transition: opacity 0.4s;
  transition: opacity 0.4s;
}

.alert-validate::after {
  content: "\f06a";
  font-family: FontAwesome;
  display: block;
  position: absolute;
  color: #c80000;
  font-size: 15px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  right: 13px;
}

.alert-validate:hover:before {
  visibility: visible;
  opacity: 1;
}

.p-t-12 {
  padding-top: 1rem;
  padding-bottom: 4rem;
  width: 90%;
  margin: 0 auto;
}

.note-create {
  font-size: small;
  font-style: italic;
  color: red;
  text-decoration: underline;
}

.p-t-136 {
  padding-top: 136px;
}

.icon-eye {
  position: absolute;
  top: 50%;
  right: 15px;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  color: black;
}

@media (max-width: 992px) {
  .alert-validate::before {
    visibility: visible;
    opacity: 1;
  }
}
</style>
