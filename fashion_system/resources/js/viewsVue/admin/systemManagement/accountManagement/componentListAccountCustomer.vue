<template>
    <div>
        <button class="btn-add" @click="activeDialog = !activeDialog">Thêm</button>
        <div class="text-center">
            <h4>Danh sách tài khoản</h4>
        </div>
        <div class="table-customer">
            <tableClient :titles="titlesTable" :items="itemsTable" :loading="loadingTable">
                <template #cell(id)="data">
                    {{ data.data.value }}
                </template>
                <template #cell(email)="data">
                    <span class="col-name"> {{ data.data.value }}</span>
                </template>
                <template #cell(phone_number)="data">
                    <span class="col-name"> {{ data.data.value }}</span>
                </template>
                <template #cell(first_name)="data">
                    <span class="col-name"> {{ data.data.value }}</span>
                </template>
                <template #cell(rank_name)="data">
                    <span class="col-name"> {{ data.data.value }}</span>
                </template>
                <template #cell(status)="data">
                    <span class="status-on badge" v-if="data.data.value">Hoạt động</span>
                    <span class="status-off badge" v-else>Khóa</span>
                </template>
                <template #cell(actions)="data">
                    <!-- <button class="action action-update">Thay đổi</button> -->
                    <button class="action" :class="[!data.data.row.status ? 'action-live' : 'action-block']"
                        @click="lockAccount(data.data.row)">
                        {{ data.data.row.status ? "Khóa" : "Hoạt Động" }}
                    </button>
                </template>
            </tableClient>
            <section class="text-end me-5 pb-1">
                <pagination-Button :total="rowDefault" :currentPage="currentPageDefault"
                    @page-return="returnResultFromPagination">
                </pagination-Button>
            </section>
        </div>
    </div>
    <dialogCreateCustomer :active="activeDialog"  @close-dialog="returnEmit"></dialogCreateCustomer>
</template>

<script>
import apiCustomer from "@/js/api/admin/apiCustomer.js";
import tableClient from "../../../components/tableClient.vue";
import paginationButton from "../../../components/paginationButton.vue";
import dialogCreateCustomer from "../../../components/customer/dialogCreateCustomer.vue";
import { ElNotification } from "element-plus";

export default {
    name: 'componentListAccountCustomer',
    components: {
        paginationButton,
        tableClient,
        dialogCreateCustomer
    },
    props: {
        call: {
            type: Boolean,
        },
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            titlesTable:
                [
                    { key: "id", label: "ID", text: "center" },
                    { key: "email", label: "Email", text: "start" },
                    { key: "phone_number", label: "SDT", text: "start", color: "black" },
                    { key: "first_name", label: "Tên", text: "start" },
                    { key: "rank_name", label: "Rank", text: "center" },
                    { key: "status", label: "Trạng thái", text: "center" },
                    { key: "actions", label: "", text: "start" },
                ],
            itemsTable: [],
            //phân trang
            rowDefault: 5,
            currentPageDefault: 1,
            visibleRecordCount: 10,
            isCount: true,
            rowDefault: 5,
            currentPageDefault: 1,
            pageReturn: null,
            loadingTable: true,
            //   end
            activeDialog:false,
        };
    },
    watch: {
        call(val) {
            if (val)
                this.getCustomers();
        },
        pageReturn(val) {
            this.currentPageDefault = val;
            this.getCustomers();
        },
    },
    created() {
    },
    mounted() {
        // Logic sau khi component được gắn kết (render) vào DOM
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        getCustomers() {
            this.loadingTable = true;
            const data = {
                page: this.currentPageDefault,
                record_number: this.visibleRecordCount,
                count: this.isCount,
            };
            apiCustomer
                .getCustomers(data)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        console.log(dataResponse.results);
                        this.rowDefault = dataResponse.results.total_record;
                        this.itemsTable = Object.values(dataResponse.results.page);
                        this.loadingTable = false;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        },
        lockAccount(user) {
            const data = {
                id: user.id,
                status: !user.status,
            };
            apiCustomer
                .changeStatus(data)
                .then((res) => {
                    var dataResponse = res.data;
                    if (dataResponse.result_code == 200) {
                        this.getCustomers();
                        ElNotification({
                            title: "Success",
                            message: "Thay đổi thành công",
                            type: "success",
                        });
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: error,
                        type: "error",
                    });
                });
        },
        returnResultFromPagination(value) {
            this.pageReturn = value;
        },
        returnEmit(val){
            this.activeDialog=val;
        }
    },
};
</script>

<style scoped>
.table-customer {
    padding: 0 1.5rem;
}

.btn-add {
    float: right;
    border-radius: 5px;
    border: none;
    margin: 5px 1rem 1rem 0;
    width: 4rem;
    height: 2rem;
    background-color: #409eff;
    position: relative;
    z-index: 999;
}

.btn-add:hover {
    background-color: #40a0ffa1 !important;
}

.btn-add:active {
    box-shadow: 0 0 20px #ccc;
    transform: scale(1.1);
}
</style>
