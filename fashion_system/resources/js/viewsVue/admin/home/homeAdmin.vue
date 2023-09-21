<template>
    <div class="container">
        <section id="list-of-active-people">
            <div class="row pt-3">
                <div class="col-lg-8 col-12">
                    <p class="text-center">
                        Người dùng đang hoạt động
                        <font-awesome-icon icon="fa-solid fa-check" style="color: #48dd08;" />
                    </p>
                    <div class="list-people">
                        <div v-for="item in listAccountsAdminNew" :key="item.id">
                            <div class="people row">
                                <strong class="col-4">
                                    <font-awesome-icon class="icon-on" icon="fa-solid fa-circle" style="color: #48dd08;" />
                                    {{ item.name }}</strong>
                                <p class="col-3 code-staff">{{ item.code_staff }}</p>
                                <p class="col-2">{{ item.ip.length }} thiết bị</p>
                                <div class="col-3">
                                    <button class="action action-block">Khóa</button>
                                    <!-- <button class="action action-live">Hoạt động</button> -->
                                    <button class="action action-contact">Liên hệ</button>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <p class="text-center">
                        Mất kết nối
                        <font-awesome-icon icon="fa-solid fa-xmark" style="color: #e70808;" />
                        <!-- <div v-for="item in listAccountsAdminOld" :key="item.id" v-if="l">

                        </div> -->
                    </p>
                    <div class="list-people">
                        <div v-for="item in listAccountsOff" :key="item.id">
                            <div class="people row">
                                <strong class="col-7">
                                    <font-awesome-icon class="icon-on" icon="fa-solid fa-circle" style="color: #e70808;" />
                                    {{ item.name }}</strong>
                                <p class="col-5 code-staff">{{ item.code_staff }}</p>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- <circle-Menu :circleMenu="circleMenuAdmin"></circle-Menu> -->
        box : thời tiết
        <br>
        box : thông tin cơ bản nhân viên
        <br>
        box : thông báo
        <br>
        box : người đang on
        <br>
        box : sự kiện
        <br>
        <button><router-link to="/error403" class="style-tag-a ">Giới thiệu</router-link></button>
        <button @click="testSendSocket()">Test</button>
        <button @click="testGetLogin()">testGetLogin</button>
    </div>
</template>

<script>
import circleMenuAdmin from "@/js/generalSetting/circleMenuAdmin.js";
import circleMenu from "@/js/viewsVue/components/circleMenu.vue";


export default {
    name: "homeAdmin",
    components: {
        circleMenu,
    },
    data() {
        return {
            circleMenuAdmin: circleMenuAdmin.menu,
            users: [],
            listAccountsAdminNew: null,
            listAccountsAdminOld: null,
            listAccountsOff: null,
        };
    },
    created() {
        // this.listenToChannel();
    },
    mounted() {
        window.Echo.private('admin_connect')
            .listen('.admin.connect', async (e) => {
                this.getListUsers(e.user);
            })
            .error((error) => {
                if (error.status == 403) {
                    location.reload();
                }
            });
        //
        // window.Echo.private('channel-name').listen('MessageNotification', (e) => {
        //     console.log('go public');
        //     //code for displaying the serve data
        //     console.log(e); // the data from the server
        // });
        // // window.Echo.private('admin_connect')
        // //     .listen('.admin.connect', (e) => {
        // //         console.log(e);
        // //     });
        // // window.Echo.channel('admin_connect')
        // //     .listen('AdminConnected', (e) => {
        // //         console.log('User connected from server:', e.user_id);
        // //         // Thực hiện các xử lý khác tại đây
        // //     });

        // window.Echo.channel('users').listen('user_connected', (user) => {
        //     // Thêm người dùng vào danh sách
        //     this.users.push(user);
        // });
        // window.Echo.private(`channel-name`)
        //     .listenForWhisper('MessageNotification', (e) => {
        //         console.log(e);
        //         console.log('adasdas');
        //     });
    },
    computed: {
    },
    watch: {
    },
    methods: {
        testSendSocket() {
            // Sử dụng Laravel Echo
            window.Echo.private('channel-name')
                .whisper('MessageNotification', {
                    message: 'This is a message from the client!',
                });
        },
        // so sánh 2 mảng , tìm những người dùng vừa off
        findDifference(arrOld, arrNew) {
            // const missingElements = await arrNew.filter(itemNew => !arrOld.some(itemOld => itemOld.id === itemNew.id));
            const missingElements = arrOld.filter(itemOld => !arrNew.some(itemNew => itemNew.id === itemOld.id));
            return missingElements;
        },
        getListUsers(val) {
            // console.log(val);
            const arr = Object.freeze(val);
            if (!this.listAccountsAdminOld) {
                this.listAccountsAdminOld = arr;
                this.listAccountsAdminNew = arr;
            }
            else {
                this.listAccountsAdminOld = this.listAccountsAdminNew;
                this.listAccountsAdminNew = arr;
                this.listAccountsOff = this.findDifference(this.listAccountsAdminOld, this.listAccountsAdminNew);
            }
            return true;
        },
    },
};
</script>
<style scoped>
section#list-of-active-people {
    border-bottom: 1px solid #c7c8c9;
}

button.action-block {
    background-color: orange;
    color: #fff;
    font-weight: bolder;
}

button.action-contact {
    background-color: #0098f6;
    color: #fff;
    font-weight: bolder;
}



button.action {
    font-size: 70%;
    margin: 0.2rem;
    padding: 0.2rem 0.5rem;
    border: none;
    border-radius: 15px;
    user-select: none;
}

.icon-on {
    font-size: 12px;
}

.code-staff {
    color: red;
}

.people {
    display: flex;
}

.list-people {
    overflow: auto;
    overflow-x: hidden;
    overflow-y: scroll;
    height: 40vh;
}

.list-people::-webkit-scrollbar {
    width: 5px;
    height: 5px;
}

.list-people::-webkit-scrollbar-track {
    background-color: #e9f0ff;
    border-radius: 4px;
    border-left: 2.5px solid white;
    border-right: 2.5px solid white;
}

.list-people::-webkit-scrollbar-thumb {
    box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    border-radius: 4px;
    background-color: #8fb3ff;
}
</style>
