<template>
    <section class="home">
        <section id="header-admin">
            <div class="header-admin d-flex justify-content-end">
                <div id="breadcrumb">
                    <el-breadcrumb separator-class="el-icon-arrow-right">
                        <div>
                            <el-breadcrumb-item :to="{ path: '/admin/home' }">HOME</el-breadcrumb-item>
                            <el-breadcrumb-item v-for="value in  breadcrumb "
                                :class="{ 'show-breadcrumb': Object.keys(value.meta).length <= 0 || value.path == '/admin/home' || value.path == '/admin' }"
                                :to="{ path: value.path }">{{ value.meta.breadcrumb }}</el-breadcrumb-item>
                        </div>
                    </el-breadcrumb>
                </div>
                <div class="">
                    <button type="button" class="btn-set btn-header-admin"><font-awesome-icon
                            icon="fa-solid fa-list-check" /></button>
                    <button type="button" class="btn-bell btn-header-admin" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"
                        @click="getListNotifications"><font-awesome-icon class="icon-notification"
                            icon="fa-regular fa-bell" />
                        <p class="notification-number" v-if="notificationNumber > 0 && notificationNumber < 99">{{
                            notificationNumber }}</p>
                        <p class="notification-number" v-else-if="notificationNumber > 99">+99</p>
                    </button>
                </div>
            </div>
        </section>
        <main>
            <div id="content-admin">
                <div class="container-content bg-content">
                    <router-view></router-view>
                </div>
            </div>
        </main>
    </section>
    <!-- THông báo cho người dùng -->
    <section>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 id="offcanvasRightLabel">Thông báo
                    <button class="check-all"><font-awesome-icon icon="fa-solid fa-list-check" /></button>
                </h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div v-for="item in listNotifications" class="notification"
                    :class="{ 'unread-notification': !item.watched }">
                    <strong class="label-notification" :style="{ background: '#' + `${item.color}` }">{{ item.name
                    }}</strong><span>&ensp;:&ensp;</span>
                    <span class="item-un">
                        {{ item.content }}
                    </span>
                    <hr>
                </div>
                <div class="more-notification text-center">
                    Xem thêm
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import sessionStorage from '@/js/auth/sessionStorage.js'
import apiManagerAccount from '@/js/api/broadcasting/apiManagerAccount.js';
import apiNotification from '@/js/api/admin/apiNotification.js';
import { ElNotification } from 'element-plus';
import globalVariable from '@/js/generalSetting/globalVariable.js';
export default {
    components: {
    },
    data() {
        return {
            KEY_SESSION: 'session_storage_accessed',
            // circleUrl: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
            breadcrumb: null,
            pollingInterval: null,
            staff: null,
            notificationNumber: null,
            listNotifications: null,
        };
    },
    created() {
        this.breadcrumb = this.$route.matched;
        this.getGlobalVariableInfoStaff();
        window.addEventListener('beforeunload', this.handleBeforeUnload);
    },
    watch: {
        '$route.matched'(value) {
            this.breadcrumb = value;
        },
    },
    mounted() {
        window.Echo.private('notification_admin')
            .listen('.notification.admin', async (e) => {
                console.log(e);
            })
            .error((error) => {
                if (error.status == 403) {
                    location.reload();
                }
            });
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {
        window.removeEventListener('beforeunload', this.handleBeforeUnload);
    },
    methods: {
        async getGlobalVariableInfoStaff() {
            const intervalTime = 1000; // 1 giây
            const maxDuration = 10000; // 10 giây
            const startTime = Date.now();
            this.pollingInterval = setInterval(async () => {
                this.staff = await globalVariable.getGlobalVariableInfoStaff();
                if (this.staff || Date.now() - startTime > maxDuration) {
                    // Dừng polling
                    this.numberOfUnreadNotifications(this.staff.id);
                    clearInterval(this.pollingInterval);
                    // Tiếp tục
                    this.checkAccessed(this.staff)
                }
            }, intervalTime);
        },
        async checkAccessed(data) {
            if (sessionStorage.getSession(this.KEY_SESSION)) {
                return;
            }
            var dataPost = {
                'id': data.id,
                'name': data.name,
                'phone_number': data.phone_number,
                'img': data.img,
                'code_staff': data.code_staff,
            };
            apiManagerAccount.followAccountAdmin(dataPost).then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    sessionStorage.setSession(this.KEY_SESSION, true);
                } else
                    throw new Error(dataResponse.result_code);
            }).catch(error => {
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });
            });

        },
        async handleBeforeUnload() {
            // const idUser = this.staff.id;
            sessionStorage.clearSession();
            await apiManagerAccount.deleteStatusAccountAdmin().then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                } else
                    throw new Error(dataResponse.result_code);
            }).catch(error => {
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });
            });
        },
        numberOfUnreadNotifications(staffId) {
            apiNotification.CheckForUnreadNotifications(staffId).then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    this.notificationNumber = Number(dataResponse.results);
                } else
                    throw new Error(dataResponse.result_code);
            }).catch(error => {
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });
            });
        },
        getListNotifications() {
            var data =
            {
                'record_number': 10,
                'page': 1,
                'count': true
            };
            apiNotification.getNotificationByIdStaff(data).then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    this.listNotifications = dataResponse.results.notification
                    console.log(this.listNotifications);
                } else
                    throw new Error(dataResponse.result_code);
            }).catch(error => {
                ElNotification({
                    title: 'Error',
                    message: 'Có lỗi bất thường',
                    type: 'error',
                });
            });
        },
    },
};
</script>

<style scoped>
/* CSS cho component */
button.check-all {
    border: none;
    background: none;
    margin-left: 20px;
    color: #007bff;
}

button.check-all:hover {
    color: black;
    transform: scale(1.2);
}

.notification {

    border-radius: 5px;
    padding: 6px 0px 0px 5px;
}

.unread-notification {
    background: #b4b3b35c;
}

.more-notification {
    padding: 1px 5px;
    border-radius: 10px;
    background-color: #007bff;
    display: block;
    cursor: pointer;
    border: none;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s ease;
    user-select: none;
}

.more-notification:hover {
    background-color: #219C90;
}

strong.label-notification {
    padding: 1px 5px;
    color: white;
    font-size: 14px;
    border-radius: 10px;
    user-select: none;
}

strong.label-notification:hover {
    background-color: #26577C !important;
    color: #F1EFEF;
}

hr {
    border-top: 1px dashed #ff000000;
}

.offcanvas-end {
    top: 9vh !important;
    bottom: 6vh;
    border-radius: 20px 0 0 20px;
}

.btn-header-admin {
    border: none;
    font-size: 24px;
    float: right;
    background: none;
    margin-right: 2rem;
    position: relative;
}

.icon-notification:hover {
    color: #409eff;
    transform: scale(1.2);
}

.btn-header-admin .notification-number {
    position: absolute;
    top: 0px;
    font-size: 12px;
    font-weight: bold;
    right: -8px;
    background: #ff0000ab;
    width: 100%;
    height: 20px;
    border-radius: 10px;
    animation: beat 0.8s infinite alternate;
    transform-origin: center;
}

@keyframes beat {
    to {
        transform: scale(1.1);
    }
}

main {
    margin-top: 6.5rem;
}

section#header-admin {
    position: fixed;
    width: 96%;
    right: 0px;
    z-index: 1;
}

div#breadcrumb {
    position: absolute;
    left: 18px;
    background: white;
    padding: 0.5rem 2rem 0.5rem 1rem;
    border-radius: 10px;
    z-index: 99999;
    font-weight: bolder;
}

.show-breadcrumb {
    display: none;
}

.avatar-admin {
    margin-left: 0.5rem;
    margin-top: 0.3rem;
}

.header-admin {
    position: relative;
    width: 96%;
    background: #a0c49d;
    margin: auto;
    border-radius: 10px;
    margin-top: 1rem;
    display: flex;
    height: 3rem;
    align-items: center;
}

.btn-bell {
    color: white;
}

.btn-bell-signal {
    color: yellow;
    ;
}

.btn-set {
    color: white;
    ;
}

.home {
    position: absolute;
    top: 0;
    left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    background-color: var(--body-color);
    transition: var(--tran-05);
}

.home .text {
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 12px 60px;
}

.sidebar.close~.home {
    left: 78px;
    height: 100vh;
    width: calc(100% - 78px);
}

body.dark .home .text {
    color: var(--text-color);
}

/*  */
#content-admin {
    margin-top: 2.5rem;
    height: 100vh;
    background-color: #e4e9f7;
}

.bg-content {
    background-color: white;
    min-height: 10rem;
}

.container-content {
    width: 95%;
    margin: 0 auto;
}

@media (max-width:1600px) {
    section#header-admin {
        width: 95%;
    }
}

@media (max-width:1300px) {
    section#header-admin {
        width: 94%;
    }
}

@media (max-width:1300px) {
    section#header-admin {
        width: 92%;
    }
}

@media (max-width:800px) {
    section#header-admin {
        width: 90%;
    }
}

@media (max-width:580px) {
    .container-content {
        width: 90%;
        margin: 0 auto;
    }

    section#header-admin {
        width: 84%;
    }

}</style>
