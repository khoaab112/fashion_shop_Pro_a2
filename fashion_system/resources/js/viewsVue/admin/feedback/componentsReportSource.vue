<template>
    <!-- Nội dung giao diện người dùng -->
    <section class="table-report-source">
        <div class="title-table text-center">
            <h3>Bảng quản lý nguồn tố cáo</h3>
        </div>
        <table-admin :titles="titleTable" :items="itemsTable" :loading="isLoadingTable">
            <template v-slot:notifyUsers>
                <p>Không có dữ liệu</p>
            </template>
        </table-admin>
    </section>
    <!-- <section class="text-end me-5 mt-3 pb-1">
        <pagination-Button :total="rowDefault" :currentPage="currentPageDefault"
            @page-return="returnResultFromPagination">
        </pagination-Button>
    </section> -->

    <section>

    </section>
</template>

<script>
import tableAdmin from "../../components/tableAdmin.vue";
import paginationButton from "../../components/paginationButton.vue";
import { ElMessage } from 'element-plus';
import { ElNotification } from 'element-plus';
export default {
    name: 'ReportSource',
    components: {
        tableAdmin,
        paginationButton,
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            titleTable: [
                { key: "index", label: "STT", text: 'center' },
                { key: "name", label: "Tên", text: 'start', color: 'black' },
                { key: "note", label: "Ghi chú", text: 'start' },
                { key: "status", label: "Trạng thái", text: 'center' },
                { key: "actions", label: "Thao tác", text: 'center' },
            ],
            itemsTable: [],
            isLoadingTable: true,
            pageReturn: null,
            rowDefault: 5,
            currentPageDefault: 1,
            // visibleRecordCount: 10,
        };
    },
    created() {
        // Logic khi component được khởi tạo
    },
    watch: {
        pageReturn(val) {
            this.currentPageDefault = val;
        },
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
        returnResultFromPagination(value) {
            this.pageReturn = value;
        },
    },
};
</script>

<style scoped>
/* CSS cho component */
</style>
