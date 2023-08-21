<template>
    <section id="setting-feedback">
        <div class="add-type-feedback">
            <div class="text-end"><button @click="isShowDiaLog =!isShowDiaLog">Thêm</button></div>
            <el-dialog v-model="isShowDiaLog" title="Tạo kiểu / nguồn thu thập phản hồi mới" width="30%" align-center>
                <span>Open the dialog from the center from the screen</span>
                <template #footer>
                    <span class="dialog-footer">
                        <el-button @click="isShowDiaLog = false">Thoát</el-button>
                        <el-button type="primary" @click="isShowDiaLog = false">
                            Tạo
                        </el-button>
                    </span>
                </template>
            </el-dialog>

        </div>
        <div class="card p-3">
            <table-admin :titles="titlesTable" :items="itemsTable" class="p-2">
                <template #cell(name)="data">
                    <button>{{ data.data.value }}</button>
                </template>
                <template #cell(note)="data">
                    <button>{{ data.data.value }}</button>
                </template>
                <template #cell(status)="data">
                    <button>{{ data.data.value }}</button>
                </template>
                <template #cell(actions)="data">
                    <button class="action action-block">Khóa{{ data.data.value }}</button>
                    <button class="action action-remove">Xóa</button>
                </template>
            </table-admin>
        </div>
    </section>
</template>

<script>
import tableAdmin from "../../components/tableAdmin.vue";
export default {
    name: "HtpShiftDetail",
    components: {
        tableAdmin,
    },
    setup() { },
    directives: {},
    data() {
        return {
            tabPosition: "left",
            titlesTable: [
                { key: "index", label: "STT", text: 'center' },
                { key: "name", label: "Tên", text: 'start' },
                { key: "note", label: "Ghi chú", text: 'start' },
                { key: "status", label: "Trạng thái", text: 'center' },
                { key: "actions", label: "Thao tác", text: 'center' },
            ],
            itemsTable: [
                { title1: "khoa", title2: "HtpShiftDetail", title3: "HtpShiftDetail" },
                { title1: "khoa", title2: "HtpShiftDetail", title3: "HtpShiftDetail" },
            ],
            isShowDiaLog:false,
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
    updated() { },
    destroyed() { },
    methods: {},
};
</script>

<style scoped>
#setting-feedback {}

button.action {
    font-size: 80%;
    margin: 0.2rem;
    padding: 0.2rem 0.5rem;
    border: none;
    border-radius: 15px;
}

button.action-block {
    background-color: orange;
    color: #fff;
    font-weight: bolder;
}

button.action-remove {
    background-color: red;
    color: #fff;
    font-weight: bolder;
}

button.action:hover {
    background-color: #007bff;
    transform: scale(1.1);
}

.add-type-feedback>.text-end>button {
    border: 1px solid #28a745;
    width: 4rem;
    height: 2.5rem;
    border-radius: 10px;
    margin: 1rem;
    color: white;
    background: #28a745;
}

.add-type-feedback>.text-end>button:hover {
    transform: scale(1.1);
    background-color: #186f2c;
}
</style>
