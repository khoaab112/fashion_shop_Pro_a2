<template>
  <el-dialog v-model="centerDialogVisible" title="Tạo" width="500" align-center>
    <div class="add-name">
      <label for="name" class="me-3">Tên</label>
      <div class="box-input">
        <el-input
          id="name"
          v-model="state.rank.name"
          style="width: 240px"
          placeholder="Nhập tên"
          clearable
        />
        <span class="error-msg ms-2" v-if="v$.rank.name.$error">
          {{ v$.rank.name.$errors[0].$message }}
        </span>
      </div>
    </div>

    <div class="add-icon">
      <label for="icon-rank" class="me-3">Biểu<br />tượng</label>
      <div class="box-input">
        <el-upload
          id="icon-rank"
          class="avatar-uploader"
          :http-request="handleUploadRequest"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
        >
          <img v-if="imageUrl" :src="imageUrl" class="avatar" />
          <el-icon v-else class="avatar-uploader-icon">
            <Plus />
          </el-icon>
        </el-upload>
        <span class="error-msg ms-2 err-file" v-if="errorImage">
          {{ errorImage }}
        </span>
      </div>
    </div>
    <div class="add-score">
      <label for="score" class="me-3 mt-4">Ngưỡng điểm</label>
      <el-input-number
        id="score"
        v-model="state.rank.score"
        :min="1"
        @change="handleChange"
      />
    </div>
    <div class="add-description mt-4">
      <label for="detail" class="me-3 mt-4 mb-2">Mô tả</label>

      <quill-editor
        id="detail"
        theme="snow"
        toolbar="essential"
        v-model:content="description"
        content-type="html"
      ></quill-editor>
      <span class="error-msg ms-2" v-if="v$.rank.detail.$error">
        {{ v$.rank.detail.$errors[0].$message }}
      </span>
    </div>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="centerDialogVisible = false">Đóng</el-button>
        <el-button type="primary" @click="createRank"> Tạo </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script>
import { ref } from "vue";
import { ElMessage } from "element-plus";
import { Plus } from "@element-plus/icons-vue";
// import { UploadProps } from "element-plus";
import { useVuelidate } from "@vuelidate/core";
import { required, helpers, numeric } from "@vuelidate/validators";
import { reactive, computed } from "vue";
import apiRank from "@/js/api/admin/apiRank.js";

export default {
  name: "addRank",
  components: {
    Plus,
    ElMessage,
  },
  props: {
    isCreate: {
      type: Boolean,
    },
  },
  setup() {
    const imageUrl = ref("");
    const file = ref("");

    const handleAvatarSuccess = (response, uploadFile) => {
      imageUrl.value = URL.createObjectURL(uploadFile.raw);
      file.value = uploadFile.raw;
    };

    const beforeAvatarUpload = (rawFile) => {
      if (
        rawFile.type != "image/jpeg" &&
        rawFile.type != "image/gif" &&
        rawFile.type != "image/png" &&
        rawFile.type != "image/apng" &&
        rawFile.type != "image/avif" &&
        rawFile.type != "image/svg+xml" &&
        rawFile.type != "image/webp"
      ) {
        ElMessage.error(
          "Hãy nhập file có định dạng image/jpeg/png/apng/avif/svg+xml/webp"
        );
        return false;
      } else if (rawFile.size / 1024 / 1024 > 2) {
        ElMessage.error("Dung lượng tối đa không quá 2MB!");
        return false;
      }
      return true;
    };
    const handleUploadRequest = ({ file, onSuccess }) => {
      onSuccess(file);
      handleAvatarSuccess(null, { raw: file });
    };
    const state = reactive({
      rank: {
        name: "",
        detail: {},
        icon: "",
        score: 0,
        description: "",
      },
    });
    const rules = computed(() => {
      return {
        rank: {
          name: {
            required: helpers.withMessage("Tên không được bỏ trống", required),
            // email: helpers.withMessage('Hãy nhập mail', email)
          },
          detail: {
            required: helpers.withMessage("Mô tả không được bỏ trống", required),
          },
          score: {
            numeric: helpers.withMessage("Phải là số", numeric),
          },
        },
      };
    });
    const v$ = useVuelidate(rules, state);
    const resetValidation = () => {
      v$.value.$reset();
    };
    return {
      imageUrl,
      file,
      handleAvatarSuccess,
      beforeAvatarUpload,
      handleUploadRequest,
      state,
      v$,
      resetValidation,
    };
  },
  directives: {},
  data() {
    return {
      centerDialogVisible: true,
      errorImage: "",
      description: "",
    };
  },
  created() {},
  mounted() {},
  computed() {},
  updated() {},
  destroyed() {},
  methods: {
    // handleAvatarSuccess(response, uploadFile) {
    //   imageUrl.value = URL.createObjectURL(uploadFile.raw);
    // },
    // beforeAvatarUpload(rawFile) {
    //   if (rawFile.type !== "image/jpeg") {
    //     ElMessage.error("Avatar picture must be JPG format!");
    //     return false;
    //   } else if (rawFile.size / 1024 / 1024 > 2) {
    //     ElMessage.error("Avatar picture size can not exceed 2MB!");
    //     return false;
    //   }
    //   return true;
    // },
    // handleAvatarSuccess() {
    //     UploadProps['onSuccess'] = (
    //         response,
    //         uploadFile
    //     ) => {
    //         imageUrl.value = URL.createObjectURL(uploadFile.raw!)
    //         this.state.data.icon = URL.createObjectURL(uploadFile.raw!)
    //     }
    // },
    // beforeAvatarUpload() {
    //     UploadProps['beforeUpload'] = (rawFile) => {
    //         if (rawFile.type !== 'image/jpeg') {
    //             ElMessage.error('Avatar picture must be JPG format!')
    //             return false
    //         } else if (rawFile.size / 1024 / 1024 > 2) {
    //             ElMessage.error('Avatar picture size can not exceed 2MB!')
    //             return false
    //         }
    //         return true
    //     }
    // },
    handleChange() {},
    async createRank() {
      this.state.rank.detail = this.description;
      const isFormCorrect = await this.v$.$validate();
      if (!this.imageUrl) {
        this.errorImage = "Hãy nhập file";
      }
      if (!isFormCorrect) return;
      var formData = new FormData();
      formData.append("icon", this.file);
      formData.append("name", this.state.rank.name);
      formData.append("detail", this.state.rank.detail);
      formData.append("score", this.state.rank.score);
      apiRank
        .create(formData)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.isUploaded = false;

            // ElNotification({
            //   title: "Success",
            //   message: dataResponse.results,
            //   type: "success",
            // });
            // this.$emit("upload-success", true);
            // return this.$emit("hide-upload", (this.showUploadFile = false));
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          //   this.$refs.upload.clearFiles();
          //   this.isUploaded = false;
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });

      this.centerDialogVisible = false;
    },
  },
};
</script>

<style>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}

.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 8rem;
  height: 8rem;
  text-align: center;
}

.add-icon {
  display: flex;
  align-items: center;
  margin-top: 1rem;
}

label {
  font-weight: bold;
  width: 5rem;
}

#detail {
  min-height: 5rem;
}
.box-input {
  display: flex;
  flex-wrap: wrap;
}
.add-name,
.add-icon {
  display: flex;
}
.err-file {
  display: flex;
  align-items: center;
}
</style>
