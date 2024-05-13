<template>
    <div>
        <button class="btn-add">Thêm</button>
        <div class="text-center">
            <h4>Danh sách tài khoản</h4>
        </div>
        <div class="table-customer">
            <tableClient :titles="titlesTable" :items="itemsTable">
                <template #cell(id)="data">
                    {{data.data.value}}
                  </template>
                <template #cell(email)="data">
                    <span class="col-name"> {{data.data.value}}</span>
                  </template>
                  <template #cell(phone_number)="data">
                    <span class="col-name"> {{data.data.value}}</span>
                  </template>
                  <template #cell(first_name)="data">
                    <span class="col-name"> {{data.data.value}}</span>
                  </template>
                  <template #cell(rank_name)="data">
                    <span class="col-name"> {{data.data.value}}</span>
                  </template>
                  <template #cell(status)="data">
                    <span class="col-name"> {{data.data.value?"Hoạt động":"Khóa"}}</span>
                  </template>

            </tableClient>
        </div>
    </div>
</template>

<script>
import apiCustomer from "@/js/api/admin/apiCustomer.js";
import paginationButton from "../../../components/paginationButton.vue";
import tableClient from "../../../components/tableClient.vue";
import { ElNotification } from "element-plus";

export default {
    name: 'componentListAccountCustomer',
    components: {
        paginationButton,
        tableClient,
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
                    { key: "actions", label: "Thao tác", text: "start" },
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
            //   end
        };
    },
    watch: {
        call(val) {
            if (val)
                this.getCustomers();
        }
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
            // this.loadingTable = true;
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
                        // this.loadingTable = false;
                    } else throw new Error(dataResponse.results);
                })
                .catch((error) => {
                    ElNotification({
                        title: "Error",
                        message: "Có lỗi bất thường",
                        type: "error",
                    });
                });
        }
    },
};
</script>

<style scoped>
.table-customer{
    padding: 0 1.5rem;
}
</style>
