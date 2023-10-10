<template>
    <main id="page-detai-staff">
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
                        {{ this.dataStaff.sex ? 'Nam' : "Nữ" }} {{ getYearOld(this.dataStaff.birthday) }}&nbsp;tuổi<br>{{
                            this.dataStaff.birthday }} &nbsp;<font-awesome-icon icon="fa-solid fa-cake-candles"
                            style="color: #16d1e9;" />
                    </strong>
                </section>
            </div>
            <div class="col-8">
                <section class="card-row-1 card">
                    <div class="mt-2 row">
                        <strong class="ps-5 col-5">
                            Họ tên :
                        </strong>
                        <p class="col-7">{{ this.dataStaff.staff_name }}</p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5">
                            Sinh ngày :
                        </strong>
                        <p class="col-7">{{ this.dataStaff.birthday }}</p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5">
                            Giới tính :
                        </strong>
                        <p class="col-7">{{ this.dataStaff.sex ? "Nam" : "Nữ" }}
                            <font-awesome-icon icon="fa-solid fa-mars" style="color: #0ed3e1;" v-if="this.dataStaff.sex" />
                            <font-awesome-icon icon="fa-solid fa-venus" style="color: #e8179b;" v-else />

                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5">
                            Địa chỉ :
                        </strong>
                        <p class="col-7">
                            {{ this.dataStaff.staff_address }}
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5">
                            Số điện thoại:
                        </strong>
                        <p class="col-7">
                            {{ this.dataStaff.phone_number }}
                        </p>
                    </div>
                    <div class="row">
                        <strong class="ps-5 col-5">
                            email:
                        </strong>
                        <p class="col-7">
                            {{ this.dataStaff.email }}
                        </p>
                    </div>
                    <strong class="ps-5" :class="[this.dataStaff.active?'check':'question']">
                        <font-awesome-icon class="status-staff" icon="fa-regular fa-circle-check" style="color: #4bff0a;" v-if=" this.dataStaff.active"/>
                        <font-awesome-icon class="status-staff" icon="fa-solid fa-question" style="color: #ff0a0a;" v-else/>
                        {{ this.dataStaff.active?"Đã xác thực":"Chưa xác thức" }}</strong>
                </section>
            </div>
        </div>
        <div class="row ps-3 pe-3 mt-4">
            <section class="col-8">
                <div class="card row-2">Thông tin chức vụ , thông tin về công việc</div>
            </section>
            <section class="col-4">
                <div class="card row-2">
                    Thông tin tài khoản
                    các nút khóa , đăng xuất tài khoản , reset mật khẩu , chỉnh sửa thông tin nếu muốn
                </div>
            </section>
        </div>
    </main>
</template>

<script>
import avatar from "../../../components/avatar.vue";
import avatarAdminDefault from "@/public/images/staff/staffDefault.png";

export default {
    name: "detailStaff",
    components: {
        avatar,
    },
    //   props: ['dataa'],
    setup() { },
    directives: {},
    data() {
        return {
            dataStaff: null,
            urlAvatar: null,
        };
    },
    created() {
        this.dataStaff = this.decodeURL(this.$route.query.child);
        console.log(this.dataStaff);
        // this.dataStaff = JSON.parse(this.$route.query.child);
        this.checkImageAdmin(this.dataStaff.img);
        // Logic khi component được khởi tạo
    },
    mounted() { },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        checkImageAdmin(img) {
            console.log(img);
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
            return JSON.parse(decodeURIComponent(data)).data.value;
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
    },
};
</script>

<style scoped>
.row-2{
    min-height: 4rem;
}
.check{
    color: #4bff0a;
}
.question{
    color: #ff0a0a;
}
.status-staff{
    font-size: 2rem;
    padding-right:1rem ;
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
    background-color: #cecccd70;
    border: none;
    box-shadow: -1px 4px 8px 3px #888888;
}
</style>
