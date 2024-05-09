<template>
    <!-- Nội dung giao diện người dùng -->
    <router-view v-if="getCurrentRoute()"></router-view>
    <div class="main-manager-account" v-else>
        <code>
      Quản lí tài khoản staff/admin (thêm ,sửa , khóa)
      <br />
      Quản lí tài khoản customer (thêm , sửa , khóa)<br />
      Danh sách tài khoản đang trong hàng chờ xét duyệt để tạo tài khoản liên kết với
      gmail .<br />
      chi tiết tài khoản <br />
      gửi mail thành công hoặc không thành công cho staff<br />
      filter thêm thời gian tạo , trạng thái hoạt động
    </code>
        <section id="list-btn">
            <div class="row">
                <div class="col-6 text-center">
                    <button class="btn-show btn-staff" @click="useSwitch(true)">Nhân viên</button>
                </div>
                <div class="col-6 text-center">
                    <button class="btn-show btn-customer" @click="useSwitch(false)">
                        Khách hàng
                    </button>
                </div>
            </div>
        </section>
        <div class="space"></div>
        <section id="staff-show" v-show="switchShow">
            <el-tabs :tab-position="tabPosition" style="height: 30 rem" class="demo-tabs">
                <el-tab-pane label="Tài khoản">
                    <listAccountsStaff></listAccountsStaff>
                </el-tab-pane>
                <el-tab-pane label="Xác thực">
                    <waitingStaffAccounts></waitingStaffAccounts>
                </el-tab-pane>
            </el-tabs>
        </section>
        <section id="customer-show" v-show="!switchShow">
            <ListAccountCustomer :call="callApiCustomer" @call="callApiCustomer">
            </ListAccountCustomer>
        </section>
        <div class="space"></div>
    </div>
</template>

<script>
import listAccountsStaff from "./componentListAccountStaff.vue";
import waitingStaffAccounts from "./componentWaitingStaffAccount.vue";
import ListAccountCustomer from "./componentListAccountCustomer.vue";
export default {
    name: "mainAccountManagement",
    components: {
        listAccountsStaff,
        waitingStaffAccounts,
        ListAccountCustomer,
    },
    setup() { },
    directives: {},
    data() {
        return {
            switchShow: true,
            tabPosition: "left",
            flagRoute: false,
            callApiCustomer: false,
        };
    },
    watch: {
        $route(to, from) {
            if (this.$refs.myRouterView && this.$refs.myRouterView.$el) {
                this.flagRoute = true;
            } else {
                console.log("<router-view> is not being used.");
            }
        },
        switchShow(val){
           if(!val)
           this.callApiCustomer=true;
        },
    },
    created() {
        // this.getCurrentRoute();
        // Logic khi component được khởi tạo
    },
    mounted() {
        // Logic sau khi component được gắn kết (render) vào DOM
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        useSwitch(bool) {
            this.switchShow = bool;
        },
        getCurrentRoute() {
            const currentRoute = this.$route.matched;
            if (currentRoute[currentRoute.length - 1].name != "accountManagement") {
                return true;
            }
            return false;
        },
    },
};
</script>

<style scoped>
.space {
    padding: 1rem;
}

.btn-show {
    width: 90%;
    height: 100%;
    border: none;
    padding: 0.5rem 0;
    border-radius: 5px;
}

.btn-show:hover {
    background-color: #9fa5aa;
    color: white;
}

.btn-show:active {
    transform: scale(0.9);
}

.btn-staff {
    background-color: #3edd4b;
}

.btn-customer {
    background-color: #0b89f0;
}

section#list-btn {
    margin-top: 1rem;
}
</style>
