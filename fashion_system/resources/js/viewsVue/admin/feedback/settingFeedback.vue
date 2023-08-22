<template>
    <section id="setting-feedback">
        <!-- add -->
        <div class="add-type-feedback">
            <div class="text-end"><button @click="isShowDiaLog = !isShowDiaLog">Thêm</button></div>
            <el-dialog v-model="isShowDiaLog" title="Tạo kiểu / nguồn thu thập phản hồi mới" width="60%" align-center>
                <table-admin :titles="titlesTable" :items="valuesTableCreateNew" class="p-2">
                    <template #cell(name)="data">
                        <input type="text" placeholder="Tên" class="input-add"
                            v-model="valuesTableCreateNew[data.data.index].name">
                    </template>
                    <template #cell(note)="data">
                        <textarea placeholder="Ghi chú..." class="" data-mdb-toggle="popover" title="Click 2 lần để mở to"
                            v-model="valuesTableCreateNew[data.data.index].note"
                            @dblclick="showTextAreaAdd(valuesTableCreateNew[data.data.index].note, data.data.index)">
                        </textarea>
                    </template>
                    <template #cell(status)="data">
                        <el-select v-model="valuesTableCreateNew[data.data.index].status" placeholder="Chọn"
                            style="width: 100%">
                            <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value" />
                        </el-select>
                    </template>
                    <template #cell(actions)="data">
                        <button class="action-table-add action-add-type" @click="addRow(data.data.index)"><font-awesome-icon
                                icon="fa-solid fa-plus" />{{
                                    data.data.value }}</button>
                        <button class="action-table-add action-minus-type"
                            @click="minusRow(data.data.index)"><font-awesome-icon icon="fa-solid fa-minus" /></button>
                    </template>
                </table-admin>
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

        <el-dialog v-model="showTextArea" :title="`Nội dung ghi chú hàng ${idCol}`" width="30%" class="show-text-area">
            <textarea placeholder="Chưa có nội dung" v-model="contentCol.value" class="textarea-more">{{ contentCol.value }}</textarea>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="clearContentTextArea(contentCol.index)">Xóa</el-button>
                    <el-button type="primary" @click="submitPopupTextArea(contentCol)">
                        Xác nhận
                    </el-button>
                </span>
            </template>
        </el-dialog>
        <!-- end add -->
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
import { ElMessage } from 'element-plus'
export default {
    name: "HtpShiftDetail",
    components: {
        tableAdmin,
    },
    setup() { },
    directives: {},
    data() {
        return {
            contentCol: {
                value: '',
                index: 1
            },
            idCol: 1,
            showTextArea: false,
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
            isShowDiaLog: false,
            valuesTableCreateNew: [
                { name: '', note: '', status: null, actions: '', }
            ],
            valueStatus: null,
            options: [
                {
                    value: 0,
                    label: 'Khóa',
                },
                {
                    value: 1,
                    label: 'Hoạt động',
                },
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
    updated() { },
    destroyed() { },
    methods: {
        showTextAreaAdd(value, index) {
            this.showTextArea = true;
            this.contentCol.value = value
            this.contentCol.index = index
        },
        clearContentTextArea(index) {
            this.contentCol.value = '';
            this.valuesTableCreateNew[index].note = '';
        },
        addRow(index) {
            if (this.valuesTableCreateNew.length == 10) {
                ElMessage({
                    showClose: true,
                    message: 'Oh thật mệt mỏi khi phải thêm quá nhiều dữ liệu cùng một lúc',
                    type: 'warning',
                })
            }
            if (this.valuesTableCreateNew.length > 11) {
                ElMessage({
                    showClose: true,
                    message: 'Quá nhiều dữ liệu cùng một lúc !',
                    type: 'error',
                })
                return;
            }
            const obj = { name: '', note: '', status: '', actions: '' };
            this.valuesTableCreateNew.splice(++index, 0, obj);
        },
        minusRow(index) {
            if (this.valuesTableCreateNew.length <= 1) {
                ElMessage({
                    showClose: true,
                    message: 'Không thể xóa thêm được nữa',
                    type: 'warning',
                });
                return;
            }

            this.valuesTableCreateNew.splice(index, 1);
        },
        submitPopupTextArea(value) {
            console.log(value);
            this.showTextArea = false
            this.valuesTableCreateNew[value.index].note = value.value;
        },
    },
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

.action-table-add {
    max-width: 1.5rem;
    min-width: 1.5rem;
    max-height: 1.5rem;
    min-height: 1.5rem;
    margin: 0.3rem;
    border: none;
    border-radius: 20px;
}

.action-table-add:hover {
    transform: scale(1.2);

}

.action-add-type {
    background-color: #0d6efd;
    color: #fff;
}

.input-add {
    width: 100%;
    padding: 5px 12px;
    border: 1px solid #e8eaee;
    border-radius: 5px;
    transition: border-color 0.3s;
    color: #000;
}

input[type=text]:focus {
    border-color: red !important;
    outline: none
}

.add-type-feedback textarea {
    width: 100%;
    height: 2rem;
    border: 1px solid #e8eaee;
    border-radius: 5px;
    padding: 4px 0 0 4px;
}

.add-type-feedback textarea:focus {
    border-color: red !important;
    outline: none
}
.textarea-more{
    border: 1px solid #e8eaee;
    border-radius: 5px;
}
.textarea-more:focus{
    border-color: palegreen !important;
    outline: none
}
.show-text-area textarea {
    width: 100%;
    padding: 11px 0px 0px 11px;
}
</style>
