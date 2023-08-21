<template>
    <section id="setting-feedback">
        <table-client :titles="titlesTable" :items="itemsTable">
            <template #cell(title1)="data">
                <button>{{ data.data.value }}</button>
            </template>
            <template #cell(title3)="data">
                <button>{{ data.data.value }}</button>
            </template>
            <template #cell(title2)="data">
                <button>{{ data.data.value }}</button>
            </template>
        </table-client>
    </section>
</template>

<script>
import tableClient from '../../components/tableClient.vue';
import tableAdmin from '../../components/tableAdmin.vue';
export default {
    name: 'HtpShiftDetail',
    components: {
        tableClient,
        tableAdmin
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            tabPosition: 'left',
            titlesTable: [
                { 'key': 'title1', 'label': 'tiêu đề 1' },
                { 'key': 'title2', 'label': 'tiêu đề 2' },
                { 'key': 'title3', 'label': 'tiêu đề 3' },
                { 'key': 'title4', 'label': 'tiêu đề 4' },
                { 'key': 'title5', 'label': 'tiêu đề 5' },
            ],
            itemsTable: [
                { 'title1': 'khoa', 'title2': 'HtpShiftDetail', 'title3': 'HtpShiftDetail' },
                { 'title1': 'khoa', 'title2': 'HtpShiftDetail', 'title3': 'HtpShiftDetail' },
            ]
        };
    },
    created() {
        // Logic khi component được khởi tạo
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
    },
};
</script>

<style scoped>
#setting-feedback {
    height: 37rem;
    background: red;
}
</style>
