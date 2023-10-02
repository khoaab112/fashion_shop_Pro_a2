<template>
    <br>
    <div class="container">
        <div class="row v1">
            <section class="card card-notification col-5">
                <div class="header-notification-admin text-center">
                    Thông báo
                </div>
            </section>
            <section class="col-7">
                <div class="header-link-account text-center">
                    Kích hoạt tài khoản đã liên kết
                </div>
                <div class="body-link-account">
                    <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>
                    <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>       <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>       <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>       <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>       <div class="item-account">
                        <div class="form-check form-switch switch">
                            <label class="form-check-label" for="flexSwitchCheckDefault">Google Account</label>
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                        </div>
                        <input type="text" class="name ">
                    </div>
                </div>
            </section>
        </div>
        <hr>
        <section id="list-of-active-people">
            <div class="row pt-3">
                <div class="col-lg-8 col-12">
                    <p class="text-center">
                        Người dùng đang hoạt động
                        <font-awesome-icon icon="fa-solid fa-check" style="color: #48dd08;" />
                    </p>
                    <button class="action action-reset" @click="resetListAccounts">Cài lại </button>
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
        <section>
            <div class="row">
                <div class="col-4">
                    <div class="card-weather">
                        <div class="header-weather text-center">
                            <span class="text-center">{{ getTimeNow() }}</span>
                            <br>
                            <strong v-if="!supportGettingAddress">
                                Trình duyệt không hỗ trợ lấy địa chỉ
                            </strong>
                            <strong v-else-if="!longitude || !latitude">
                                Hãy mở quyền truy cập vị trí để sử dụng chức năng
                            </strong>
                            <strong v-else-if="loadingWeather">
                                <loadingSpinner></loadingSpinner>
                            </strong>
                            <div v-else>
                                <strong>{{ dataWeather.name }}</strong>
                                <img :src=svgWeather :alt=dataWeather.weather[0].icon class="sgv-weather">
                                <p class="temperature">{{ dataWeather.main.temp }}<sup>○</sup>C</p>
                                <p>Cảm nhận thực tế : {{ dataWeather.main.feels_like }}</p>
                                <p>{{ dataWeather.weather[0].description }}</p>
                                <div class="row lich-van-nien" v-if="dataLichVanLien">
                                    <div class="col-6">DL<br>{{ dataLichVanLien.days[0] }}&nbsp;{{ dataLichVanLien.dates[0]
                                    }}
                                    </div>
                                    <div class="col-6">AL<br>{{ dataLichVanLien.days[1] }}&nbsp;{{ dataLichVanLien.dates[1]
                                    }}
                                    </div>
                                    <div class="col-6">{{ dataLichVanLien.events[0] }}</div>
                                    <div class="col-6">{{ dataLichVanLien.events[1] }}</div>
                                    <div class="col-6">Hiện tại: {{ dataLichVanLien['time-string'] }}</div>
                                    <div class="col-6">Hoàng đạo: {{ dataLichVanLien['good-hour'] }}</div>
                                </div>
                            </div>
                            <!-- <br>
                    <strong>Hà Nội</strong>
                    <button @click="getLocation" class="action get-location">Lấy địa chỉ GPS</button> -->
                        </div>
                        <hr style="color: white;">
                        <div class="footer-weather">
                            <div class="row" v-if="!loadingWeather">
                                <div class="col-6">Kinh độ :{{ dataWeather.coord.lon }}</div>
                                <div class="col-6">Vĩ độ : {{ dataWeather.coord.lat }}</div>
                                <div class="col-6">Độ ẩm : {{ dataWeather.main.humidity }}%</div>
                                <div class="col-6">Tốc độ gió : {{ dataWeather.wind.speed }}&nbsp;<font-awesome-icon
                                        icon="fa-solid fa-wind" /></div>
                                <div class="col-6">Mật độ mây : {{ dataWeather.clouds.all }}%</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <div class="card card-list-events">
                        <div class="text-center">Sự kiện</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <br>
    <br>
</template>

<script>
import circleMenuAdmin from "@/js/generalSetting/circleMenuAdmin.js";
import circleMenu from "@/js/viewsVue/components/circleMenu.vue";
import apiManagerAccount from '@/js/api/broadcasting/apiManagerAccount.js';
import loadingSpinner from '@/js/viewsVue/components/loadingSpinner.vue';
import apiOpenWeatherMap from '@/js/apiThirdPartyService/apiOpenWeatherMap.js';
import { ElNotification } from 'element-plus';
import crawlDataLichVanLien from '@/js/crawlData/lich-van-nien.js';
// import imgWeather from '@/public/images/svg/weather';

export default {
    name: "homeAdmin",
    components: {
        circleMenu,
        loadingSpinner
    },
    data() {
        return {
            circleMenuAdmin: circleMenuAdmin.menu,
            users: [],
            listAccountsAdminNew: null,
            listAccountsAdminOld: null,
            listAccountsOff: null,
            latitude: null,//vĩ độ
            longitude: null,//kinh độ
            supportGettingAddress: true,
            loadingWeather: true,
            dataWeather: null,
            svgWeather: null,
            dataLichVanLien: null,
        };
    },
    created() {
        // this.listenToChannel();
        this.getLocation();
        this.getDataLichVanLien();
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
        resetListAccounts() {
            apiManagerAccount.deleteListAccountAdmin().then(res => {
                var dataResponse = res.data;
                if (dataResponse.result_code == 200) {
                    this.listAccountsAdminNew = [];
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
        getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition((position) => {
                    this.supportGettingAddress = true;
                    this.latitude = position.coords.latitude;
                    this.longitude = position.coords.longitude;
                    this.callOpenWeatherMap();
                    console.log(this.latitude);
                });
            } else {
                this.supportGettingAddress = false;
                console.error("Trình duyệt không hỗ trợ Geolocation.");
            }
        },
        getTimeNow() {
            var date = new Date();
            const timeNow = {
                'day': Number(date.getDay()) + 1,
                'date': date.getDate(),
                'month': date.getMonth() + 1,
                'year': date.getFullYear(),
            }
            var convertDay;
            switch (timeNow.day) {
                case 1: convertDay = 'thứ hai'; break
                case 2: convertDay = 'thứ ba'; break
                case 3: convertDay = 'thứ tư'; break
                case 4: convertDay = 'thứ năm'; break
                case 5: convertDay = 'thứ sáu'; break
                case 6: convertDay = 'thứ bảy'; break
                case 7: convertDay = 'thứ chủ nhật'; break
            };
            return convertDay + ", ngày " + timeNow.date + "/" + timeNow.month + "/" + timeNow.year;
        },
        callOpenWeatherMap() {
            const data = {
                'lat': this.latitude,
                'lon': this.longitude,
            }
            apiOpenWeatherMap.getOpenWeatherMap(data).then(res => {
                var dataResponse = res.data;
                if (res.status == 200) {
                    this.loadingWeather = false;
                    this.dataWeather = dataResponse;
                    console.log(dataResponse);
                    this.getImage(dataResponse.weather[0].icon);
                    console.log(dataResponse);
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
        getImage(url) {
            // // var path = ''
            const publicPath = window.location.origin + '/public';
            const imagePath = `weather/${url}.svg`;
            this.svgWeather = new URL(imagePath, publicPath).href;
            return;
        },
        getDataLichVanLien() {
            crawlDataLichVanLien.crawlDataLichVanLien().then(res => {
                if (res) {
                    this.dataLichVanLien = res;
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
.body-link-account {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.switch{
    margin-left: 0.5rem;
}
.item-account {
    background-color: red;
    min-width: 40%;
    margin-left: 1rem;
    margin-bottom: 1rem;
    padding-bottom: 0.4rem;
    display: grid;
    border-radius: 15px;
}

.item-account .name:focus {
    border-color: transparent !important;
}

.item-account .name {
    border-radius: 10px;
    outline: none;
    border: none;
    padding: 0 1rem;
    width: 90%;
    margin-left: 0.5rem;

}

.row.v1 {
    padding: 0 1rem;
}

.card-notification {
    min-height: 12rem;
}

.card.card-list-events {
    margin-top: 1rem;
    height: 94%;
}

.row.lich-van-nien {
    text-align: left;
    margin-left: 1rem;
    font-size: 80%;
}

.sgv-weather {
    width: 7rem;
    height: 7rem;
}

.temperature {
    font-size: 220%;
    padding: 0;
    margin: 0;
}

.header-weather {
    color: white;
}

.footer-weather {
    position: absolute;
    color: white;
    font-size: 80%;
    bottom: 0;
    width: 100%;
    margin: 0rem 1.7rem;
    padding-bottom: 1rem;
}



.card-weather {
    min-width: 15rem;
    max-width: 20rem;
    min-height: 30rem;
    box-shadow: 0px 1px 4px 2px #888888;
    background-color: #43afd1;
    position: relative;
    margin: 1rem;
}

section#list-of-active-people {
    border-bottom: 1px solid #c7c8c9;
}

button.action-block {
    background-color: orange;
    color: #fff;
    font-weight: bolder;
}

button.action-reset {
    background-color: red;
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
