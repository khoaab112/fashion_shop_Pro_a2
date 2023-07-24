<template>
      <audio id="startup-sound" autoplay>
    <source src="path/to/your/sound-file.mp3" type="audio/mpeg">
  </audio>
    <div id="login" class="img js-fullheight" :style="{ 'background-image': 'url(' + background + ')' }">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h1 class="heading-section">Đăng nhập</h1>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Bạn đã có tài khoản</h3>
                            <form action="#" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Tài khoản" autocomplete="off"
                                        required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" :type=typeInputPassword class="form-control"
                                        placeholder="Mật khẩu" autocomplete="off" required>

                                    <span class="field-icon" @click="showPassWord()">
                                        <font-awesome-icon icon="fa-regular fa-eye" v-if="isShowPassWord" />
                                        <font-awesome-icon icon="fa-regular fa-eye-slash" v-if="!isShowPassWord" />
                                    </span>
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Đăng
                                        nhập</button>
                                </div>
                                <div class="form-group d-md-flex set-center">
                                    <div class="w-50">
                                        <el-checkbox label="Nhớ mật khẩu" class="cb-remember-password" size="large" />
                                    </div>
                                    <div class="w-50  text-decoration-underline set-end ">
                                        <a href="#" style="color: #fff">Quên mật khẩu ?</a>
                                    </div>
                                </div>
                            </form>
                            <div class=" text-decoration-underline set-end set-center">
                                <a href="#" style="color: #fff">Chưa có tài khoản</a>
                            </div>
                            <div class="text-center block-copy">
                                <p class="pt-2">Hoặc</p>
                                <p class="w-100 text-center">&mdash; Đăng nhập với cách khác &mdash;</p>
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

    </div>
</template>
    
<script>
import backgroundLogin from "@/public/images/client/authentication/login/bg_login_client.gif";
import logoGoogle from "@/public/images/client/logo/google.png";
// import { DatePicker, Radio } from 'ant-design-vue';
// import avatarAdminDefault from "@/images/client/authentication/login.js";

export default {
    name: 'HtpShiftDetail',
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
            typeInputPassword: 'text',
        };
    },
    created() {
        this.background = this.getBackGround(backgroundLogin);
        this.logoGoogle = this.getBackGround(logoGoogle);


    },
    mounted() {
        const fullheightElements = document.querySelectorAll('.js-fullheight');
        const resizeHandler = () => {
            fullheightElements.forEach((element) => {
                element.style.height = window.innerHeight + 'px';
            });
        };

        resizeHandler();
        window.addEventListener('resize', resizeHandler);
        addEventListener('touchstart', this.callPassedFuntion, {
            passive: false
        });
        // this.showPassWord();
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        getBackGround(url) {
            return new URL(url, import.meta.url).href
        },
        showPassWord() {
            this.isShowPassWord = !this.isShowPassWord;
            this.isShowPassWord ? this.typeInputPassword = 'text' : this.typeInputPassword = 'password';
        }
    },
};
</script>
    
<style>
.img {
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    height: unset;
}

.ftco-section {
    padding-top: 4rem;
    position: relative;
    z-index: 1;
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

.img:after {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    content: '';
    background: #000;
    opacity: .3;
    z-index: 0;
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
    background: rgba(255, 255, 255, 0.08);
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

.btn.btn-primary {
    background: #fbceb5 !important;
    border: 1px solid #fbceb5 !important;
    color: #000 !important;
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

.heading-section {
    color: white;
}

.cb-remember-password {
    color: #fbceb5;
    font-size: 2rem;
}

.el-checkbox__input.is-checked+.el-checkbox__label {
    color: #44a985 !important;
}

.el-checkbox__input.is-checked .el-checkbox__inner {
    background-color: #1ccb8d;
    border-color: #1ccb8d;
}

.el-checkbox.el-checkbox--large .el-checkbox__label {
    font-size: 16px !important;
}

.set-end {
    text-align: right;
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
    background: rgba(255, 255, 255, .08);
    border-radius: 40px;
    padding-left: 20px;
    padding-right: 20px;
}

.form-control:hover {
    background: transparent;
    outline: none;
    box-shadow: none;
    border-color: rgba(255, 255, 255, .4);
}

.form-control:focus {
    background: transparent;
    outline: none;
    box-shadow: none;
    border-color: rgba(255, 255, 255, .4);
}

.form-control::placeholder {
    color: white;
    opacity: 1;
}

button.btn-service {
    background-color: #ff000000;
    border: none;
    transition: transform 250ms;
    padding: 0px 4px;
}

img.img-service {
    max-width: 3rem;
    max-height: 3rem;
}

button.btn-service:hover {
    transform: translateY(-10px);
}

.set-center,
.block-copy {
    user-select: none;
}

@media (max-width:800px) {
    div.set-end {
        text-align: unset;
    }

    .set-center {
        text-align: center !important;
    }

    .w-50 {
        width: 100% !important;
    }
}

@media (prefers-reduced-motion: reduce) {
    .form-control {
        -webkit-transition: none;
        -o-transition: none;
        transition: none;
    }
}
</style>