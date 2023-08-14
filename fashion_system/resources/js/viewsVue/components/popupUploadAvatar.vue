<template>
    <el-dialog v-model="showUploadFile" title="Thay đổi ảnh" width="30%" align-center @close="hideUpLoad">
        <el-upload class="upload-demo" drag :auto-upload="false" :on-change="handleChange" :on-remove="removeFile" multiple>
            <font-awesome-icon icon="fa-solid fa-cloud-arrow-up" style="font-size: 50px;"></font-awesome-icon>
            <div class="el-upload__text">
                Kéo hoặc <em>click để tải file</em>
                <p class="note-up-file">
                    Giới hạn kịch thước
                    <br>
                    Chỉ nhận file png/jpg
                </p>
            </div>
            <template #tip>
                <div class="el-upload__tip">
                    <br>
                    <span v-if="isErrorFile" class="content-error">{{ contentError }}</span>
                </div>
            </template>
        </el-upload>

        <template #footer>
            <span class="dialog-footer">
                <el-button @click="hideUpLoad">Thoát</el-button>
                <el-button type="primary" @click='upFile'>
                    Thay đổi
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<script>
import { ElNotification } from 'element-plus'
import apiStaff from "@/js/api/admin/apiStaff.js";

export default {
    name: 'popupUploadAvatar',
    components: {
    },
    props: {
        show: {
            type: Boolean,
            required: true,
        },
        type: {
            type: String,
        },
    },
    watch: {
        show(value) {
            this.showUploadFile = value;
        },
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            showUploadFile: this.show,
            arrFile: [],
            isErrorFile: false,
            contentError: null,
            FileToSend: null,
        };
    },
    created() {
        // Logic khi component được khởi tạo
    },
    mounted() {

    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        handleChange(file, fileList) {
            this.arrFile.push(file);
            this.isErrorFile = false;
            if (!(file.raw.type == 'image/jpeg') && !(file.raw.type == 'image/png')) {
                this.isErrorFile = true;
                this.contentError = "File tải lên không đúng định dạng"
                return;
            }
            if (fileList.length >= 2) {
                this.isErrorFile = true;
                this.contentError = "Hãy xóa bớt file, chỉ chấp nhận một file"
                return;
            }
            const reader = new FileReader();
            reader.readAsDataURL(file.raw);
            reader.onload = (e) => {
                this.FileToSend = e.target.result;
            }
        },
        hideUpLoad() {
            this.$emit('hide-upload', this.showUploadFile = false);
        },
        removeFile(file, fileList) {
            //xóa  file
            this.arrFile = this.arrFile.filter(item => item.name !== file.name);
            if (fileList.length < 2) {
                this.isErrorFile = false;
                this.contentError = ""
                return;
            };
        },
        upFile() {
            if (this.isErrorFile) {
                return ElNotification({
                    title: "Error",
                    message: "Hãy kiểm tra lỗi",
                    type: "error",
                });
            }
            if (this.arrFile.length == 1) {
                if (this.type == 'AVT') {
                    const file = {
                        'file': this.FileToSend,
                        'name': 'ádasd'
                    }
                    apiStaff
                        .changeAvatarStaffById(file, 1)
                        .then((res) => {
                            var dataResponse = res.data;
                            if (dataResponse.result_code == 200) {

                            } else throw new Error(dataResponse.result_code);
                        })
                        .catch((error) => {
                            ElNotification({
                                title: "Error",
                                message: "Có lỗi bất thường",
                                type: "error",
                            });
                        });
                }
                if (this.type == 'BG') { }
            }
            else if (this.arrFile.length == 0) {
                return ElNotification({
                    title: "Warning",
                    message: "Hãy nhập file trước khi lưu",
                    type: "warning",
                });
            }
            else {
                return ElNotification({
                    title: "Error",
                    message: "Hãy kiểm tra lỗi",
                    type: "error",
                });
            }
        },
    },
};
</script>

<style scoped>
.content-error {
    color: red;
    font-style: italic;
}

.note-up-file {
    font-style: italic;
    font-size: 11px;
}
</style>
