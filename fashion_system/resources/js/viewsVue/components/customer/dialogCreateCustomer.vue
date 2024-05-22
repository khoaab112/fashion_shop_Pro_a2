<template>
    <el-dialog v-model="centerDialogVisible" title="Thêm tài khoản" width="500" align-center @close="closeDialog">
        <form action="">
            <div class="full-name">
                <div class="form-floating mb-3 me-2 first_name">
                    <input type="text" class="form-control" id="first_name" placeholder="Tên" autocomplete="off">
                    <label for="first_name">Tên <span class="require">*</span></label>
                </div>
                <div class="form-floating mb-3 last_name">
                    <input type="text" class="form-control" id="last_name" placeholder="Họ">
                    <label for="last_name">Họ<span class="require">*</span></label>
                </div>
            </div>
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                <label for="address">Địa chỉ</label>
            </div>
            <div class="form-floating mb-3">
                <input type="number" class="form-control" id="phone_number" placeholder="SĐT">
                <label for="phone_number">SĐT</label>
            </div>
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="email" placeholder="email">
                <label for="email">Email<span class="require">*</span></label>
            </div>
            <div class="last-layout">
                <el-switch v-model="value" class="mb-2"
                    style="--el-switch-on-color: #13ce66; --el-switch-off-color: #ff4949"
                    active-text="Nam"
                    inactive-text="Nữ" />
                <el-date-picker v-model="value1" type="date" placeholder="Ngày sinh" :size="size" />
            </div>
        </form>

        <template #footer>
            <div class="dialog-footer">
                <el-button @click="closeDialog">Đóng</el-button>
                <el-button type="primary" @click="closeDialog">
                    Tạo
                </el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script>
export default {
    name: 'dialogCreateCustomer',
    components: {
    },
    props: ["active"],
    setup() {
    },
    directives: {
    },
    data() {
        return {
            centerDialogVisible: this.active ?? false,
            size: 'large',
            value1: '',
            value: "",
        };
    },
    watch: {
        active(val) {
            this.centerDialogVisible = val;
        },
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
        closeDialog() {
            this.centerDialogVisible = false
            this.$emit('close-dialog', false);
        }
    },
};
</script>

<style scoped>
.full-name {
    display: flex;
    justify-content: space-around;
}

.last_name {
    width: 60%;
}

.first_name {
    width: 40%;
}

span.require {
    color: red;
}
.last-layout{
    display: flex;
    justify-content: space-between;
}
</style>
