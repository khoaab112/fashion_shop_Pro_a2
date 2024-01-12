<template>
  <el-dialog
    v-model="showUploadFile"
    title="Thay đổi ảnh"
    width="30%"
    align-center
    @close="hideUpLoad"
  >
    <el-upload
      class="upload-demo"
      drag
      :auto-upload="false"
      :on-change="handleChange"
      :on-remove="removeFile"
      ref="upload"
      multiple
    >
      <font-awesome-icon
        icon="fa-solid fa-cloud-arrow-up"
        style="font-size: 50px"
      ></font-awesome-icon>
      <div class="el-upload__text">
        Kéo hoặc <em>click để tải file</em>
        <p class="note-up-file">
          Giới hạn kịch thước
          <br />
          Chỉ nhận file png/jpg
        </p>
      </div>
      <template #tip>
        <div class="el-upload__tip">
          <br />
          <span v-if="isErrorFile" class="content-error">{{ contentError }}</span>
        </div>
      </template>
    </el-upload>
    <template #footer>
      <div class="text-center" v-if="isUploaded">
        <loadingStyleTwirl></loadingStyleTwirl>
      </div>
      <span class="dialog-footer" v-else>
        <el-button @click="clonePopup">Thoát</el-button>
        <el-button type="primary" @click="upFile"> Thay đổi </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script>
import { ElNotification } from "element-plus";
import apiStaff from "@/js/api/admin/apiStaff.js";
import loadingStyleTwirl from "@/js/viewsVue/components/loading/loadingStyleTwirl.vue";

export default {
  name: "popupUploadAvatar",
  components: {
    loadingStyleTwirl,
  },
  props: {
    show: {
      type: Boolean,
      required: true,
    },
    type: {
      type: String,
    },
    data: {
      type: Object,
    },
  },
  watch: {
    show(value) {
      this.showUploadFile = value;
    },
    data(value) {
      this.dataStaff = value;
    },
  },
  setup() {},
  directives: {},
  data() {
    return {
      showUploadFile: this.show,
      dataStaff: this.data,
      arrFile: [],
      isErrorFile: false,
      contentError: null,
      FileToSend: null,
      isUploaded: false,
    };
  },
  created() {
    // Logic khi component được khởi tạo
  },
  mounted() {},
  computed() {
    // được sử dụng để định nghĩa các thuộc tính tính toán
  },
  updated() {},
  destroyed() {},
  methods: {
    handleChange(file, fileList) {
      // console.log(file.raw.type);
      console.log(file);
      this.arrFile.push(file);
      this.isErrorFile = false;
      if (
        !(file.raw.type == "image/jpeg") &&
        !(file.raw.type == "image/png") &&
        !(file.raw.type == "image/gif")
      ) {
        this.isErrorFile = true;
        this.contentError = "File tải lên không đúng định dạng";
        return;
      }
      if (fileList.length >= 2) {
        this.isErrorFile = true;
        this.contentError = "Hãy xóa bớt file, chỉ chấp nhận một file";
        return;
      }
      // const reader = new FileReader();
      // reader.readAsDataURL(file.raw);
      // reader.onload = (e) => {
      //     this.FileToSend = e.target.result;
      // }
      this.FileToSend = file;
    },
    hideUpLoad() {
      this.arrFile = [];
      this.FileToSend = "";
      this.isErrorFile = false;
      this.$refs.upload.clearFiles();
      this.$emit("hide-upload", (this.showUploadFile = false));
    },
    clonePopup() {
      this.arrFile = [];
      this.$refs.upload.clearFiles();
      this.isErrorFile = false;
      this.FileToSend = "";
      this.showUploadFile = false;
    },
    removeFile(file, fileList) {
      //xóa  file
      this.arrFile = this.arrFile.filter((item) => item.name !== file.name);
      if (fileList.length < 2) {
        this.isErrorFile = false;
        this.contentError = "";
        return;
      }
    },
    upFile() {
      console.log(this.isErrorFile);
      if (this.isErrorFile) {
        return ElNotification({
          title: "Error",
          message: "Hãy kiểm tra lỗi",
          type: "error",
        });
      }
      if (this.arrFile.length == 1) {
        this.isUploaded = true;
        ElNotification({
          title: "Success",
          message: "Đang tải file",
          type: "success",
        });
        if (this.type == "AVT") {
          var formData = new FormData();
          formData.append("file", this.FileToSend.raw);
          const staffId = this.dataStaff.id;
          apiStaff
            .changeAvatarStaffById(formData, staffId)
            .then((res) => {
              var dataResponse = res.data;
              if (dataResponse.result_code == 200) {
                this.isUploaded = false;

                ElNotification({
                  title: "Success",
                  message: dataResponse.results,
                  type: "success",
                });
                this.$refs.upload.clearFiles();

                this.$emit("upload-success", true);
                return this.$emit("hide-upload", (this.showUploadFile = false));
              } else throw new Error(dataResponse.results);
            })
            .catch((error) => {
              this.$refs.upload.clearFiles();
              this.isUploaded = false;
              ElNotification({
                title: "Error",
                message: "Có lỗi bất thường",
                type: "error",
              });
            });
        }
        if (this.type == "BG") {
          var formData = new FormData();
          formData.append("file", this.FileToSend.raw);
          const staffId = this.dataStaff.id;
          apiStaff
            .changeBackgroundStaffById(formData, staffId)
            .then((res) => {
              var dataResponse = res.data;
              if (dataResponse.result_code == 200) {
                this.isUploaded = false;
                ElNotification({
                  title: "Success",
                  message: dataResponse.results,
                  type: "success",
                });
                this.$refs.upload.clearFiles();
                this.$emit("upload-success", true);
                return this.$emit("hide-upload", (this.showUploadFile = false));
              } else throw new Error(dataResponse.results);
            })
            .catch((error) => {
              this.$refs.upload.clearFiles();
              this.isUploaded = false;

              ElNotification({
                title: "Error",
                message: "Có lỗi bất thường",
                type: "error",
              });
            });
        }
      } else if (this.arrFile.length == 0) {
        return ElNotification({
          title: "Warning",
          message: "Hãy nhập file trước khi lưu",
          type: "warning",
        });
      } else {
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
