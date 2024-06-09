<template>
  <!-- Nội dung giao diện người dùng -->
  <div>
    <div id="title-page" class="text-center mt-2">
      <h3>Rank</h3>
    </div>
    <div class="btn-add">
      <div class="text-end">
        <button @click="isShowDiaLog = !isShowDiaLog">Thêm</button>
      </div>
    </div>
    <div class="content">
      <table-admin :titles="titleTable" :items="itemsTable" :loading="isLoadingTable">
        <template #cell(icon)="data">
          <span class="col-name"> {{ data.data.value.icon }}</span>
        </template>
        <template #cell(name)="data">
          <span class="col-name"> {{ data.data.value.name }}</span>
        </template>
        <template #cell(score)="data">
          <span class="col-name"> {{ data.data.value.score }}</span>
        </template>
        <template #cell(detail)="data">
          <span class="col-name"> {{ data.data.value.detail }}</span>
        </template>
        <template #cell(status)="data">
          <span class="status-on badge" v-if="data.data.value.status">Hoạt động</span>
          <span class="status-off badge" v-else>Khóa</span>
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
      </table-admin>
    </div>
    <addRank></addRank>
  </div>
</template>

<script>
import tableAdmin from "../../components/tableAdmin.vue";
import apiRank from "@/js/api/admin/apiRank.js";
import { ElNotification } from "element-plus";
import addRank from "./components/addRank.vue";

export default {
  name: "HtpShiftDetail",
  components: {
    tableAdmin,
    addRank,
  },
  setup() {},
  directives: {},
  data() {
    return {
      titleTable: [
        { key: "index", label: "STT", text: "center" },
        { key: "icon", label: "Biểu tượng", text: "center" },
        { key: "name", label: "Tên", text: "center" },
        { key: "score", label: "Điểm", text: "center" },
        { key: "detail", label: "Mô tả", text: "center" },
        { key: "status", label: "Trạng thái", text: "center" },
        { key: "actions", label: "Thao tác", text: "center" },
      ],
      itemsTable: [],
      isLoadingTable: true,
      rowDefault: 5,
      currentPageDefault: 1,
      isDataTable: false,
    };
  },
  created() {
    this.getRanks();
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
    getRanks() {
      this.isLoadingTable = true;

      apiRank
        .rank()
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            console.log(dataResponse);
            this.itemsTable = dataResponse.results.page;
            this.isLoadingTable = false;
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
  },
};
</script>

<style scoped>
.content {
  height: 100%;
  padding: 0 1rem;
}
.btn-add > div > button {
  border: 1px solid #28a745;
  width: 4rem;
  height: 2.5rem;
  border-radius: 10px;
  margin: 1rem;
  color: white;
  background: #28a745;
}
</style>
