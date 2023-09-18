<template>
    <div class="container">
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
            listAccountsAdmin: [],
        };
    },
    created() {
        // this.listenToChannel();
    },
    mounted() {
        //theo dõi tài khoản trực tuyến
        window.Echo.private('admin_connect')
            .listen('.admin.connect', (e) => {
                this.listAccountsAdmin = e;
            });



        window.Echo.private('channel-name').listen('MessageNotification', (e) => {
            console.log('go public');
            //code for displaying the serve data
            console.log(e); // the data from the server
        });
        window.Echo.private('admin_connect')
            .listen('.admin.connect', (e) => {
                console.log(e);
            });
        // window.Echo.channel('admin_connect')
        //     .listen('AdminConnected', (e) => {
        //         console.log('User connected from server:', e.user_id);
        //         // Thực hiện các xử lý khác tại đây
        //     });

        window.Echo.channel('users').listen('user_connected', (user) => {
            // Thêm người dùng vào danh sách
            this.users.push(user);
        });
        window.Echo.private(`channel-name`)
            .listenForWhisper('MessageNotification', (e) => {
                console.log(e);
                console.log('adasdas');
            });
    },
    computed: {
    },
    methods: {
        testSendSocket() {
            // Sử dụng Laravel Echo
            window.Echo.private('channel-name')
                .whisper('MessageNotification', {
                    message: 'This is a message from the client!',
                });
        },
    },
};
</script>
<style scoped>
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background-color: rgb(217, 12, 12);
}

::-webkit-scrollbar-thumb {
    box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
</style>
