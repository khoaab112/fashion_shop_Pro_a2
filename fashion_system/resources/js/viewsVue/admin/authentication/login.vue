<template>
    <div class="limiter" id="login-manager">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img :src=imageAdmin alt="IMG" draggable="false">
                </div>

                <form class="login100-form validate-form">
                    <span class="login100-form-title h1">
                        QUẢN TRỊ
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                        <input class="input100" type="text" name="email" placeholder="Tài khoản" v-model="username">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <font-awesome-icon icon="fa-regular fa-user" />
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <input class="input100" :type=typePassword name="pass" placeholder="Mật khẩu" autocomplete="off"
                            v-model="password">
                        <span class="focus-input100">
                        </span>
                        <span class="symbol-input100">
                            <font-awesome-icon icon="fa-solid fa-key" />
                        </span>
                        <span class="icon-eye" @click="showPassword()">
                            <font-awesome-icon icon="fa-regular fa-eye-slash" v-if="isShowPassword" />
                            <font-awesome-icon icon="fa-regular fa-eye" v-else />
                        </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn" @click.prevent="clickLogin()">
                            Login
                        </button>
                        <!-- <router-link :to="{ path: '/auth/forgotPassword' }"><button>Login Test</button></router-link> -->
                    </div>
                    <div class="check-remember-me mt-2">
                        <el-checkbox  v-model="remember" label="Nhớ mật khẩu" size="large"  />
                    </div>
                    <div class="text-center mt-1">
                        <a class="txt2" href="#" @click.prevent="clickForgotPassword()">
                            Quên thông tin đăng nhập ?
                        </a>
                    </div>

                    <div class="text-center p-t-136">
                        <a class="txt2" href="#" @click.prevent="clickRegister()">
                            Tạo tài khoản
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
    
<script>
import imageAdmin from '@/public/images/admin/system/authentication/login_admin.svg';
import methodDefine from '@/js/mixins/methodDefine.js';
import paths from '@/js/mixins/getAddressFromRouter.js';

export default {
    mixins: [methodDefine],
    name: 'loginAdmin',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            imageAdmin: '',
            isShowPassword: false,
            typePassword: 'password',
            username: '',
            password: '',
            remember: '',
        };
    },
    created() {
        this.imageAdmin = this.getImage(imageAdmin);
        this.remember = false;
    },
    mounted() {
        const tiltElements = document.querySelectorAll('.js-tilt');
        tiltElements.forEach((element) => {
            element.style.transform = 'scale(1.1)';
        });

        // Hàm Tilt
        function Tilt(element, options) {
            this.element = element;
            this.settings = Object.assign(
                {
                    maxTilt: 20,
                    perspective: 300,
                    easing: 'cubic-bezier(.03,.98,.52,.99)',
                    scale: '1',
                    speed: 400,
                    transition: true,
                    disableAxis: null,
                    reset: true,
                    glare: false,
                    maxGlare: 1
                },
                options
            );
            this.ticking = false;
            this.updateBind = this.update.bind(this);

            this.init();
        }

        Tilt.prototype.init = function () {
            this.updateElementPosition();
            this.addEventListeners();
        };

        Tilt.prototype.addEventListeners = function () {
            this.element.addEventListener('mousemove', this.updateBind);
            if (this.settings.reset) {
                this.element.addEventListener('mouseleave', this.reset.bind(this));
            }
            window.addEventListener('resize', this.onWindowResize.bind(this));
        };

        Tilt.prototype.updateElementPosition = function () {
            var rect = this.element.getBoundingClientRect();
            this.width = this.element.offsetWidth;
            this.height = this.element.offsetHeight;
            this.left = rect.left;
            this.top = rect.top;
        };

        Tilt.prototype.getValues = function (event) {
            var x, y;
            if (this.fullPageListening) {
                x = event.gamma;
                y = event.beta;
            } else {
                x = (event.clientX - this.left) / this.width;
                y = (event.clientY - this.top) / this.height;
            }
            x = Math.min(Math.max(x, 0), 1);
            y = Math.min(Math.max(y, 0), 1);
            var tiltX = (this.settings.maxTilt / 2 - x * this.settings.maxTilt).toFixed(2);
            var tiltY = (y * this.settings.maxTilt - this.settings.maxTilt / 2).toFixed(2);
            var percentageX = x * 100;
            var percentageY = y * 100;
            var angle = Math.atan2(event.clientX - (this.left + this.width / 2), -(event.clientY - (this.top + this.height / 2))) * (180 / Math.PI);
            return {
                tiltX: tiltX,
                tiltY: tiltY,
                percentageX: percentageX,
                percentageY: percentageY,
                angle: angle
            };
        };

        Tilt.prototype.update = function (event) {
            if (!this.ticking) {
                requestAnimationFrame(this.updateBind);
                this.ticking = true;

                var values = this.getValues(event);

                if (this.settings.glare) {
                    var glareSize = Math.sqrt(Math.pow(this.width, 2) + Math.pow(this.height, 2));
                    this.glareElement.style.transform = 'rotate(' + values.angle + 'deg) translate(-50%, -50%)';
                    this.glareElement.style.opacity = (values.percentageY * this.settings.maxGlare) / 100;
                }

                this.element.style.transform = 'perspective(' + this.settings.perspective + 'px) rotateX(' + (this.settings.disableAxis === 'x' ? 0 : values.tiltY) + 'deg) rotateY(' + (this.settings.disableAxis === 'y' ? 0 : values.tiltX) + 'deg) scale3d(' + this.settings.scale + ', ' + this.settings.scale + ', ' + this.settings.scale + ')';

                if (this.settings.transition && !this.transitionTimeout) {
                    this.setTransition();
                }

                this.ticking = false;
            }
        };

        Tilt.prototype.reset = function () {
            this.element.style.transition = 'transform ' + this.settings.speed + 'ms ' + this.settings.easing;
            this.element.style.transform = 'perspective(' + this.settings.perspective + 'px) rotateX(0deg) rotateY(0deg) scale3d(' + this.settings.scale + ', ' + this.settings.scale + ', ' + this.settings.scale + ')';

            if (this.settings.glare) {
                this.glareElement.style.transition = 'opacity ' + this.settings.speed + 'ms ' + this.settings.easing;
                this.glareElement.style.opacity = '0';
            }

            clearTimeout(this.transitionTimeout);
            this.transitionTimeout = setTimeout(function () {
                this.element.style.transition = '';
                if (this.settings.glare) {
                    this.glareElement.style.transition = '';
                }
                this.transitionTimeout = null;
            }.bind(this), this.settings.speed);
        };

        Tilt.prototype.setTransition = function () {
            this.element.style.transition = 'transform ' + this.settings.speed + 'ms ' + this.settings.easing;
            if (this.settings.glare) {
                this.glareElement.style.transition = 'opacity ' + this.settings.speed + 'ms ' + this.settings.easing;
            }
        };

        Tilt.prototype.onWindowResize = function () {
            this.updateElementPosition();
        }

        var elements = document.querySelectorAll('[data-tilt]');
        for (var i = 0; i < elements.length; i++) {
            new Tilt(elements[i]);
        }
    },
    computed() {
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        getImage(url) {
            return new URL(url, import.meta.url).href
        },
        showPassword() {
            this.isShowPassword = !this.isShowPassword;
            this.typePassword = this.isShowPassword ? 'text' : 'password';
        },
        clickLogin() {
            this.goToPage(paths.error403);
        },
        clickForgotPassword() {
            this.goToPage(paths.forgotPassword);
        },
        clickRegister() {
            this.goToPage(paths.register);
        },
    },
};
</script>
    
<style scoped>
#login-manager {
    /* font-family: "banabo" !important; */
}

#login-manager a {
    user-select: none;
}

#login-manager a:focus {
    outline: none !important;
}

#login-manager a:hover {
    text-decoration: none;
    color: #2de90c;
}

input {
    outline: none;
    border: none;
}

textarea {
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




.txt2 {
    /* font-size: 120%; */
    line-height: 1.5;
    color: #666666;
    text-decoration: none;
}


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
    width: 960x;
    background: #fff;
    border-radius: 10px;
    overflow: hidden;
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-box;
    display: -ms-flexbox;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 90px 130px 33px 95px;
}


/*------------------------------------------------------------------
[  ]*/

.login100-pic {
    width: 316px;
    margin-top: 1rem;
    margin-right: 3rem;
}

.login100-pic img {
    max-width: 100%;
}


/*------------------------------------------------------------------
[  ]*/

.login100-form {
    width: 290px;
}

.login100-form-title {
    font-size: 24px;
    color: #333333;
    line-height: 1.2;
    text-align: center;
    width: 100%;
    display: block;
    padding-bottom: 54px;
    user-select: none;
    font-weight: bold;
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

.input100:focus+.focus-input100 {
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

.input100:focus+.focus-input100+.symbol-input100 {
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
    user-select: none;
}

.login100-form-btn {
    font-size: 15px;
    line-height: 1.5;
    color: #fff;
    text-transform: uppercase;
    width: 100%;
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
    padding-top: 12px;
}

.p-t-136 {
    padding-top: 15px;
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

/*------------------------------------------------------------------
[ Responsive ]*/

@media (max-width: 992px) {
    .alert-validate::before {
        visibility: visible;
        opacity: 1;
    }

    .wrap-login100 {
        padding: 60px 90px 33px 85px;
    }

    .login100-pic {
        width: 35%;
        width: 35%;
        margin: 4rem 2rem;
    }

    .login100-form {
        width: 50%;
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
}

@media (max-width: 576px) {
    .wrap-login100 {
        padding: 100px 15px 33px 15px;
    }
}</style>