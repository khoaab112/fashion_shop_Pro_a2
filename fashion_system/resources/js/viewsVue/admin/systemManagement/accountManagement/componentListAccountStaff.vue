<template>
  <!-- Nội dung giao diện người dùng -->
  <div>
    <!-- <button class="btn-add">Thêm</button> -->
    <div class="text-center">
      <h4>Danh sách tài khoản</h4>
    </div>
    <table-admin
      :titles="titlesTable"
      :items="itemsTable"
      :loading="loadingTable"
      class="p-2"
    >
      <template #cell(staff_name)="data">
        <router-link
          :to="{ name: 'detailStaff', query: { child: pushData(data) } }"
          target="_blank"
        >
          <span class="col-name"> {{ data.data.value.staff_name }}</span>
        </router-link>
      </template>
      <template #cell(administration)="data">
        <span class="col-name"> {{ data.data.value.administration }}</span>
      </template>
      <template #cell(user_name)="data">
        <span class="col-name"> {{ data.data.value.user_name }}</span>
      </template>
      <template #cell(status)="data">
        <span class="status-on badge" v-if="data.data.value.status">Hoạt động</span>
        <span class="status-off badge" v-else>Khóa</span>
      </template>
      <template #cell(actions)="data">
        <!-- <button class="action action-update">Thay đổi</button> -->
        <button
          class="action"
          :class="[!data.data.value.status ? 'action-live' : 'action-block']"
          @click="lockAccount(data.data.value)"
        >
          {{ data.data.value.status ? "Khóa" : "Hoạt Động" }}
        </button>
      </template>
    </table-admin>
    <section class="text-end me-5 pb-1">
      <pagination-Button
        :total="rowDefault"
        :currentPage="currentPageDefault"
        @page-return="returnResultFromPagination"
      >
      </pagination-Button>
    </section>
  </div>
</template>

<script>
import tableAdmin from "../../../components/tableAdmin.vue";
import apiStaffAccount from "@/js/api/admin/apiStaffAccounts.js";
import { ElMessage } from "element-plus";
import { ElNotification } from "element-plus";
import paginationButton from "../../../components/paginationButton.vue";

export default {
  name: "listAccountsStaff",
  components: {
    tableAdmin,
    paginationButton,
  },
  setup() {},
  directives: {},
  data() {
    return {
      titlesTable: [
        { key: "index", label: "STT", text: "center" },
        { key: "staff_name", label: "Nhân viên", text: "start" },
        { key: "administration", label: "Quyền", text: "start", color: "black" },
        { key: "user_name", label: "Tài khoản", text: "start" },
        { key: "status", label: "Trạng thái", text: "center" },
        { key: "actions", label: "Thao tác", text: "start" },
      ],
      itemsTable: [],
      loadingTable: true,
      //phân trang
      rowDefault: 5,
      currentPageDefault: 1,
      visibleRecordCount: 10,
      isCount: true,
      rowDefault: 5,
      currentPageDefault: 1,
      pageReturn: null,
    };
  },
  watch: {
    pageReturn(val) {
      this.currentPageDefault = val;
      this.getList();
    },
  },
  created() {
    this.getList();
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
    getList() {
      this.loadingTable = true;
      const data = {
        page: this.currentPageDefault,
        record_number: this.visibleRecordCount,
        count: this.isCount,
      };
      apiStaffAccount
        .getByPage(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.rowDefault = dataResponse.results.total_record;
            this.itemsTable = Object.values(dataResponse.results.page);
            this.loadingTable = false;
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    returnResultFromPagination(value) {
      this.pageReturn = value;
    },
    pushData(data) {
      const id = data.data.value.id;
      return encodeURIComponent(JSON.stringify(id));
    },
    lockAccount(user) {
      console.log(user);
      const data = {
        idAccount: user.id,
        status: !user.status,
        idStaff: user.staff_id,
      };
      apiStaffAccount
        .lockAccount(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.getStaffDetail(this.dataStaff.account_id);
            ElNotification({
              title: "Success",
              message: "Thay đổi thành công",
              type: "success",
            });
          } else throw new Error(dataResponse.results);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: error,
            type: "error",
          });
        });
    },
  },
};
</script>

<style scoped>


.btn-add {
  float: right;
  border-radius: 5px;
  border: none;
  margin: 5px 1rem 1rem 0;
  width: 4rem;
  height: 2rem;
  background-color: #409eff;
  position: relative;
  z-index: 999;
}

.btn-add:hover {
  background-color: #40a0ffa1 !important;
}

.btn-add:active {
  box-shadow: 0 0 20px #ccc;
  transform: scale(1.1);
}
</style>
