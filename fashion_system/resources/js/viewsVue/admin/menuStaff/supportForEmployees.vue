<template>
  <!-- Nội dung giao diện người dùng -->
  <div class="ms-4 pt-2">
    <p>Tên phân mềm : {{ nameSystem }}</p>
    <p>Số phiên bản : {{ versionSystem }}</p>
    <hr />
    <span>Phần đóng góp ý kiến hoặc phản hồi</span>
    <div class="content-support">
      <input
        class="form-control input-title"
        type="text"
        placeholder="Tiêu đề"
        aria-label="default input "
      />
      <!-- <mavon-editor
        v-model="valueMavon"
        :language="languageMavonEditor"
        fontSize="15px"
        :boxShadow="boxShadow"
        :subfield="subfield"
        :placeholder="placeholder"
        :toolbarsFlag="toolbarsFlag"
        :autofocus="autofocus"
        :toolbars="toolbars"
      /> -->
    </div>
  </div>

  <pre>
        .tên `cho phiên bản thử nghiệm``
        .content `hỗ trợ định dạng văn bản``
        . submit
    </pre
  >
</template>

<script>
import ENV from "@/js/generalSetting/filterEnv.js";
export default {
  name: "supportForEmployees",
  components: {},
  setup() {},
  directives: {},
  data() {
    return {
      nameSystem: ENV.SYSTEM_NAME,
      versionSystem: ENV.VERSION,
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
    // Các phương thức xử lý sự kiện hoặc logic khác
  },
};
</script>

<style scoped>
.input-title {
  width: 80%;
  margin: 1rem;
}

/* CSS cho component */
</style>
