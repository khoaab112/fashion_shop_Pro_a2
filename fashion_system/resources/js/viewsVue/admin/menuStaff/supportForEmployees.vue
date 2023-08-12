<template>
    <!-- Nội dung giao diện người dùng -->
    <div class="ms-4 pt-2">
        <p>Tên phân mềm : {{ nameSystem }}</p>
        <p>Số phiên bản : {{ versionSystem }}</p>
        <hr>
        <span>Phần đóng góp ý kiến hoặc phản hồi</span>
        <div class="content-support">
            <input class="form-control input-title" type="text" placeholder="Tiêu đề" aria-label="default input ">
        </div>
        <mavon-editor v-model="value"/>
    </div>

    <pre>
        .tên `cho phiên bản thử nghiệm``
        .content `hỗ trợ định dạng văn bản``
        . submit
    </pre>
</template>

<script>
import ENV from '@/js/generalSetting/filterEnv.js'
export default {
    name: 'supportForEmployees',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            nameSystem: ENV.SYSTEM_NAME,
            versionSystem: ENV.VERSION,
            value:'',
            // Dữ liệu của component
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
.input-title{
    width: 80%;
    margin: 1rem;
}
/* CSS cho component */
</style>
