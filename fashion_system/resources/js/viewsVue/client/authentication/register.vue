<template>
  <section class="ftco-section img js-fullheight" :style="{ 'background-image': 'url(' + background + ')' }">
    <div class="container content-register">
      <div class="row justify-content-center">
        <div class="col-md-6 text-center mb-3 mt-5">
          <h1 class="heading-section block-copy">Đăng ký</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="login-wrap p-0">
            <h3 class="mb-4 text-center block-copy">Thông tin đăng ký</h3>
            <form action="#" class="signin-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control last-name" placeholder="Họ" autocomplete="on"
                  name="lastNameRegister" required>
                <input type="text" class="form-control name" placeholder="Tên" autocomplete="on" name="nameRegister"
                  required>
              </div>
              <div class="form-group">
                <input type="number" class="form-control" placeholder="Số điện thoại" autocomplete="on"
                  name="phoneNumberRegister" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Email" autocomplete="off" name="emailRegister"
                  required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Tên đăng nhập" autocomplete="off"
                  name="emailRegister" required>
              </div>
              <div class="form-group">
                <input id="password-register" :type=typeInputPassword class="form-control" placeholder="Mật khẩu"
                  autocomplete="off" required>
                <span class="field-icon " @click="showPassword('password')">
                  <font-awesome-icon icon="fa-regular fa-eye" v-if="isShowPassWord" />
                  <font-awesome-icon icon="fa-regular fa-eye-slash" v-else />
                </span>
              </div>
              <div class="form-group">
                <input id="password-confirm" :type=typeInputPasswordConfirm class="form-control"
                  placeholder="Xác thực lại mật khẩu" autocomplete="off" required>
                <span class="field-icon " @click="showPassword('confirm')">
                  <font-awesome-icon icon="fa-regular fa-eye" v-if="isShowPassWordConfirm" />
                  <font-awesome-icon icon="fa-regular fa-eye-slash" v-else />
                </span>
              </div>
              <div class="form-group d-flex">
                <input type="text" class="form-control input-code-confirm" placeholder="mã xác thực gửi về"
                  autocomplete="on" name="nameRegister" required>
                <input type="button" class="form-control send-code" value="Gửi mã" required>
              </div>
              <div class="form-group text-center">
                <button type="submit" class="form-control btn btn-primary submit px-3 mt-2">Xác nhận</button>
              </div>
            </form>
            <div class="text-center block-copy">
              <p class="mt-2">Hoặc</p>
              <p class="w-100 text-center fw-bold">&mdash; Đăng ký với cách khác &mdash;</p>
            </div>
            <div class="social text-center">
              <button class="btn-service"><img :src=logoGoogle alt="google" draggable="false"
                  class="img-service"></button>
              <button class="btn-service"><img :src=logoGoogle alt="google" draggable="false"
                  class="img-service"></button>
              <button class="btn-service"><img :src=logoGoogle alt="google" draggable="false"
                  class="img-service"></button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
    
<script>
import backgroundRegisterAdmin from '@/public/images/client/authentication/register/background.jpg';
import logoGoogle from "@/public/images/client/logo/google.png";

export default {
  name: 'registerClient',
  components: {

  },
  setup() {
  },
  directives: {
  },
  data() {
    return {
      background: '',
      logoGoogle: '',
      isShowPassWord: false,
      isShowPassWordConfirm: false,
      typeInputPassword: 'password',
      typeInputPasswordConfirm: 'password',
    };
  },
  created() {
    this.background = this.getBackGround(backgroundRegisterAdmin);
    this.logoGoogle = this.getBackGround(logoGoogle);
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
    getBackGround(url) {
      return new URL(url, import.meta.url).href
    },
    showPassword(string) {
      switch (string) {
        case 'password':
          this.isShowPassWord = !this.isShowPassWord;
          this.isShowPassWord ? this.typeInputPassword = 'text' : this.typeInputPassword = 'password';
          break;
        case 'confirm':
          this.isShowPassWordConfirm = !this.isShowPassWordConfirm;
          this.isShowPassWordConfirm ? this.typeInputPasswordConfirm = 'text' : this.typeInputPasswordConfirm = 'password';
          break;
        default:
          this.isShowPassWord = !this.isShowPassWord;
          this.isShowPassWord ? this.typeInputPassword = 'text' : this.typeInputPassword = 'password';
      }

    }
  },
};
</script>
    
<style>
.img {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  min-height: 100vh;
}

.login-wrap {
  position: relative;
  color: rgba(255, 255, 255, 0.9);
}

.login-wrap h3 {
  font-weight: 300;
  color: #fff;
}

.login-wrap .social {
  width: 100%;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;
  padding-bottom: 2rem !important;
}

.login-wrap .social a {
  width: 100%;
  display: block;
  border: 1px solid rgba(255, 255, 255, 0.4);
  color: #000;
  background: #fff;
}

.login-wrap .social a:hover {
  background: #000;
  color: #fff;
  border-color: #000;
}

*::before,
*::after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

html {
  font-family: sans-serif;
  line-height: 1.15;
  -webkit-text-size-adjust: 100%;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

article,
aside,
figcaption,
figure,
footer,
header,
hgroup,
main,
nav,
section {
  display: block;
}

div.content-register {
  z-index: 1;
  position: relative;
}

.form-group {
  position: relative;
}

.form-group {
  margin-bottom: 1rem;
}

.form-control {
  background: transparent;
  border: none;
  height: 50px;
  color: white !important;
  border: 1px solid transparent;
  /* background: rgba(255, 255, 255, 0.08); */
  background: #dfc3b3b5;
  border-radius: 40px;
  padding-left: 20px;
  padding-right: 20px;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}

button,
input {
  overflow: visible;
}

.field-icon {
  position: absolute;
  top: 50%;
  right: 15px;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  color: rgba(255, 255, 255, 0.9);
}

*,
*::before,
*::after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.btn.btn-primary {
  background: #fbceb5 !important;
  border: 1px solid #fbceb5 !important;
  color: white !important;
  font-weight: bold;
}

button:not(:disabled),
[type="button"]:not(:disabled),
[type="reset"]:not(:disabled),
[type="submit"]:not(:disabled) {
  cursor: pointer;
}

.btn {
  cursor: pointer;
  border-radius: 40px;
  -webkit-box-shadow: none !important;
  box-shadow: none !important;
  font-size: 15px;
  text-transform: uppercase;
  width: 50%;
}

.checkbox-primary {
  color: #fbceb5;
}

.checkbox-wrap {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 16px;
  font-weight: 500;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.checkbox-wrap input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.checkmark {
  position: absolute;
  top: 0;
  left: 0;
}

.checkbox-primary input:checked~.checkmark:after {
  color: #fbceb5 !important;
}

.checkbox-wrap input:checked~.checkmark:after {
  display: block;
  content: "\f14a";
  font-family: "FontAwesome";
  color: rgba(0, 0, 0, 0.2);
}

.checkmark:after {
  content: "\f0c8";
  font-family: "FontAwesome";
  position: absolute;
  color: rgba(255, 255, 255, 0.1);
  font-size: 20px;
  margin-top: -4px;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}

.text-md-right {
  text-align: right !important;
}

a {
  -webkit-transition: .3s all ease;
  -o-transition: .3s all ease;
  transition: .3s all ease;
  color: #fbceb5;
}

a {
  color: #007bff;
  text-decoration: none;
  background-color: transparent;
}

@media (prefers-reduced-motion: reduce) {
  .form-control {
    -webkit-transition: none;
    -o-transition: none;
    transition: none;
  }
}

.form-control:valid {
  background-color: #21252987;
  outline: none;
  box-shadow: none;
  border-color: rgba(255, 255, 255, .4);
}

.form-control::-ms-expand {
  background-color: transparent;
  border: 0;
}

.form-control:focus {
  color: #495057;
  background-color: #fff;
  border-color: #80bdff;
  outline: 0;
  -webkit-box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.form-control::-webkit-input-placeholder {
  color: #6c757d;
  opacity: 1;
}

.form-control:-ms-input-placeholder {
  color: #6c757d;
  opacity: 1;
}

.form-control::-ms-input-placeholder {
  color: #6c757d;
  opacity: 1;
}

.form-control::placeholder {
  color: #6c757d;
  opacity: 1;
}

.form-control:disabled,
.form-control[readonly] {
  background-color: #e9ecef;
  opacity: 1;
}

a:not([href]):not([tabindex]):hover,
a:not([href]):not([tabindex]):focus {
  color: inherit;
  text-decoration: none;
}

a:hover {
  color: #0056b3;
  text-decoration: underline;
}

.btn:hover {
  color: #212529;
  text-decoration: none;
}

.form-control {
  background: transparent;
  border: none;
  height: 50px;
  color: rgba(255, 255, 255, 1) !important;
  border: 1px solid transparent;
  /* background: rgba(255, 255, 255, .08); */
  background: #dfc3b3b5;
  border-radius: 40px;
  padding-left: 20px;
  padding-right: 20px;
}

.form-control:hover {
  /* background: transparent; */
  background-color: #21252987;
  outline: none;
  box-shadow: none;
  border-color: rgba(255, 255, 255, .4);
}

.form-control:focus {
  background: #21252987;
  outline: none;
  box-shadow: none;
  border-color: rgba(255, 255, 255, .4);
}

.form-control::placeholder {
  color: white;
  opacity: 1;
}

button.btn-service {
  background-color: #fff;
  border: none;
  transition: transform 250ms;
  padding: 1px 1px;
  border-radius: 16px;
  margin: 0px 4px;
}

img.img-service {
  max-width: 3rem;
  max-height: 3rem;
}

button.btn-service:hover {
  transform: translateY(-10px);
}

.heading-section {
  color: white;
}

input.last-name {
  width: 40%;
}

input.name {
  width: 40%;
  float: right;
  flex: auto;
  margin-left: 1rem;
}


/*  */


/* The switch - the box around the slider */

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  margin-left: 1rem;
}


/* Hide default HTML checkbox */

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}


/* The slider */

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked+.slider {
  background-color: #0dcaf0;
  ;
}

input:focus+.slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}


/* Rounded sliders */

.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}


/* Ẩn nút tăng giảm */

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

input[type="number"] {
  -moz-appearance: textfield;
}

.no-spinner {
  /* Firefox */
  -moz-appearance: textfield;
}

.send-code {
  width: 40%;
  margin-left: 3rem;
  background-color: #8CC0DE;
}

.send-code:active {
  background: #11da5e;
}

.send-code:valid {
  background: #11da5e !important;
  outline: none;
  box-shadow: none;
  border-color: rgba(255, 255, 255, .4);
}

.input-code-confirm {
  width: 100%;
  background-color: #6c757db8 !important;
}

.block-copy {
  user-select: none;
}

@media(max-width:1500px) {}
</style>