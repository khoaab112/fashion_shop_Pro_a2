<template>
  <!-- Nội dung giao diện người dùng -->
  <section class="table-report-source">
    <div class="title-table text-center">
      <h3>Bảng quản lý nguồn tố cáo</h3>
    </div>
    <table-admin :titles="titleTable" :items="itemsTable" :loading="isLoadingTable">
      <template #cell(name)="data">
        <span class="col-name"> {{ data.data.value.name }}</span>
      </template>
      <template #cell(code)="data">
        <span class="col-name"> {{ data.data.value.code }}</span>
      </template>
      <template #cell(note)="data">
        {{ data.data.value.note }}
      </template>
      <template #cell(status)="data">
        <span v-if="data.data.value.status"
          >Hoạt động<strong class="ps-2">
            <font-awesome-icon icon="fa-solid fa-circle" style="color: #28a745" /></strong
        ></span>
        <span v-else
          >Khóa<strong class="ps-2">
            <font-awesome-icon icon="fa-solid fa-circle" style="color: #dc3545" /></strong
        ></span>
      </template>
      <template #cell(actions)="data">
        <button
          class="action action-block"
          v-if="data.data.value.status"
          @click="changeStatus(data.data.value.id)"
        >
          Khóa
        </button>
        <button
          class="action action-live"
          v-else
          @click="changeStatus(data.data.value.id)"
        >
          Hoạt động
        </button>
        <!-- <button class="action action-remove" @click="deleteRecord(data.data.value.id)">Xóa</button> -->
      </template>

      <template v-slot:notifyUsers v-if="isDataTable">
        <p>Không có dữ liệu</p>
      </template>
    </table-admin>
  </section>
  <!-- <section class="text-end me-5 mt-3 pb-1">
        <pagination-Button :total="rowDefault" :currentPage="currentPageDefault"
            @page-return="returnResultFromPagination">
        </pagination-Button>
    </section> -->

  <section></section>
</template>

<script>
import tableAdmin from "../../components/tableAdmin.vue";
import paginationButton from "../../components/paginationButton.vue";
import { ElMessage } from "element-plus";
import { ElNotification } from "element-plus";
import apiReportSource from "@/js/api/admin/apiReportSource.js";

export default {
  name: "ReportSource",
  components: {
    tableAdmin,
    paginationButton,
  },
  props: {
    items: {
      type: Object,
    },
    isData: {
      type: Boolean,
    },
    showLoading: {
      type: Boolean,
    },
  },
  emits: ["retrieval-request"],
  setup() {},
  directives: {},
  data() {
    return {
      titleTable: [
        { key: "index", label: "STT", text: "center" },
        { key: "code", label: "Mã", text: "start", color: "black" },
        { key: "name", label: "Tên", text: "start", color: "black" },
        { key: "note", label: "Ghi chú", text: "start" },
        { key: "status", label: "Trạng thái", text: "center" },
        { key: "actions", label: "Thao tác", text: "center" },
      ],
      itemsTable: [],
      isLoadingTable: true,
      pageReturn: null,
      rowDefault: 5,
      currentPageDefault: 1,
      isDataTable: false,
      // visibleRecordCount: 10,
    };
  },
  created() {
    // Logic khi component được khởi tạo
    // this.isLoadingTable=this.items;
  },
  watch: {
    pageReturn(val) {
      this.currentPageDefault = val;
    },
    items(val) {
      this.itemsTable = val;
    },
    isData(val) {
      console.log(val);
      this.isDataTable = val;
    },
    showLoading(val) {
      this.isLoadingTable = val;
    },
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
    returnResultFromPagination(value) {
      this.pageReturn = value;
    },
    changeStatus(id) {
      this.loadingTable = true;
      var input = { id };
      apiReportSource
        .changeReportSource(input)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: dataResponse.results,
              type: "success",
            });
            // this.getListTypeReports();
            this.dataRetrievalRequest();
            this.loadingTable = false;
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          console.log(error);
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    dataRetrievalRequest() {
      return this.$emit("retrieval-request", true);
    },
  },
};
</script>

<style scoped>
/* CSS cho component */
.col-name {
  font-weight: bold;
}

button.action {
  font-size: 80%;
  margin: 0.2rem;
  padding: 0.2rem 0.5rem;
  border: none;
  border-radius: 15px;
  user-select: none;
}

button.action-block {
  background-color: orange;
  color: #fff;
  font-weight: bolder;
}

button.action-live {
  background-color: #28a745;
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
</style>
