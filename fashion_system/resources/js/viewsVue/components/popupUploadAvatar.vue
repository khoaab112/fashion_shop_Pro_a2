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
                <el-button type="primary" @click="showUploadFile = false">
                    Thay đổi
                </el-button>
            </span>
        </template>
    </el-dialog>
</template>

<script>
export default {
    name: 'popupUploadAvatar',
    components: {
    },
    props: {
        show: {
            type: Boolean,
            required: true,
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
            file: null,
            isErrorFile: false,
            contentError: null,
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



        },
        hideUpLoad() {
            this.$emit('hide-upload', this.showUploadFile = false);
        },
        removeFile(file, fileList)  {
            if (fileList.length < 2) {
                this.isErrorFile = false;
                this.contentError = ""
                return;
            };
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
