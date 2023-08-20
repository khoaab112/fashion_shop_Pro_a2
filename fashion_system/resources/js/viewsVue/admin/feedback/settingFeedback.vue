<template>
    <!-- <div class="p-3">
        <el-tabs :tab-position="tabPosition" >
          <el-tab-pane label="Tố cáo">Thêm sửa xóa các loại phản hồi</el-tab-pane>
          <el-tab-pane label="Sản phẩm">danh sách phản hồi , thêm , sửa , xóa , trả lời phản hồi </el-tab-pane>
          <el-tab-pane label="Ứng dụng">Phản hồi đã trả lời</el-tab-pane>
        </el-tabs>
    </div> -->
<table-client></table-client>


</template>

<script>
import tableClient from '../../components/tableClient.vue';
export default {
    name: 'HtpShiftDetail',
    components: {
        tableClient,
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            tabPosition: 'left'
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
        // Các phương thức xử lý sự kiện hoặc logic khác
    },
};
</script>

<style scoped>

</style>
