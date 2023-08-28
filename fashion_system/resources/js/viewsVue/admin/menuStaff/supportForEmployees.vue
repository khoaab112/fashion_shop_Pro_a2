<template>
  <!-- Nội dung giao diện người dùng -->
  <div class="main-support">
    <p>Tên phân mềm : <strong>{{ nameSystem }}</strong></p>
    <p>Số phiên bản : <strong>{{ versionSystem }}</strong></p>
    <hr />
    <strong class="title-comments h3">Yêu cầu hỗ trợ</strong>
    <div class="content-support">
      <input
        class="form-control input-title"
        type="text"
        placeholder="Tiêu đề"
        aria-label="default input "
      />
      <div class="input-title">
        <QuillEditor theme="snow"   toolbar="full"
        :contentType="contentType"
        :readOnly="readOnly"
        :placeholder="placeholder"
        />
      </div>
      <div class="text-end input-title">
        <button type="button" class="btn btn-primary ">Gửi<LoadingSpinner></LoadingSpinner></button>

      </div>
    </div>
  </div>
<div class="lining"></div>
</template>

<script>
import ENV from "@/js/generalSetting/filterEnv.js";
import LoadingSpinner from "../../components/loadingSpinner.vue";
export default {
  name: "supportForEmployees",
  components: {
    LoadingSpinner
},
  setup() {},
  directives: {},
  data() {
    return {
      nameSystem: ENV.SYSTEM_NAME,
      versionSystem: ENV.VERSION,
      contentType:'html',
      readOnly:false,
      placeholder:'Nội dung phản hồi ...'
      //config mavon
    //   valueMavon: "",
    //   languageMavonEditor: "en",
    //   boxShadow: true,
    //   subfield: false,
    //   placeholder: "Phản hồi ....",
    //   toolbarsFlag: true,
    //   autofocus: true,
    //   toolbars: {
    //     bold: true, // 粗体
    //     italic: true, // 斜体
    //     header: true, // 标题
    //     underline: true, // 下划线
    //     strikethrough: true, // 中划线
    //     mark: true, // 标记
    //     superscript: true, // 上角标
    //     subscript: true, // 下角标
    //     quote: true, // 引用
    //     ol: true, // 有序列表
    //     ul: true, // 无序列表
    //     link: true, // 链接
    //     imagelink: true, // 图片链接
    //     code: false, // code
    //     table: true, // 表格
    //     fullscreen: false, // 全屏编辑
    //     readmodel: false, // 沉浸式阅读
    //     htmlcode: true, // 展示html源码
    //     help: false, // 帮助
    //     /* 1.3.5 */
    //     undo: true, // 上一步
    //     redo: true, // 下一步
    //     trash: true, // 清空
    //     save: true, // 保存（触发events中的save事件）
    //     /* 1.4.2 */
    //     navigation: false, // 导航目录
    //     /* 2.1.8 */
    //     alignleft: true, // 左对齐
    //     aligncenter: true, // 居中
    //     alignright: true, // 右对齐
    //     /* 2.2.1 */
    //     subfield: true, // 单双栏模式
    //     preview: true, // 预览
    //   },

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
  updated() {},
  destroyed() {},
  methods: {
    submitRequest(){

    }
  },
};
</script>

<style scoped>
.input-title {
  width: 80%;
  margin: 1rem;
}
.ql-container{
    padding: 50px;
}
.lining {
    width: 100%;
    height: 1rem;
}
.main-support {
    padding: 18px 2.3rem;
}
/* CSS cho component */
</style>
