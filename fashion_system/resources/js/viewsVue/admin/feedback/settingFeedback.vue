<template>
  <section id="setting-feedback">
    <div class="tap-view">
      <div class="row">
        <div class="col-12 col-md-3">
          <button
            :class="{ 'active-table': isActiveTableTypeResponse }"
            @click="isActiveTableTypeResponse = true"
          >
            Các loại phản hồi
          </button>
        </div>
        <div class="col-12 col-md-3">
          <button
            :class="{ 'active-table': isActiveTableReportSource }"
            @click="isActiveTableReportSource = true"
          >
            Nguồn tố cáo
          </button>
        </div>
        <div class="col-12 col-md-3">
          <button>Test</button>
        </div>
        <div class="col-12 col-md-3">
          <button>Test</button>
        </div>
      </div>
    </div>
    <div class="btn-add">
      <div class="text-end">
        <button @click="isShowDiaLog = !isShowDiaLog">Thêm</button>
      </div>
    </div>
    <div>
      <!-- add -->
      <div class="add-type-feedback">
        <!-- <div class="text-end"><button @click="isShowDiaLog = !isShowDiaLog">Thêm</button></div> -->
        <el-dialog
          v-model="isShowDiaLog"
          title="Tạo kiểu / nguồn thu thập phản hồi mới"
          width="60%"
          align-center
        >
          <table-admin :titles="titlesTable" :items="valuesTableCreateNew" class="p-2">
            <template #cell(name)="data">
              <input
                type="text"
                placeholder="Tên ( Bắt buộc )"
                class="input-add"
                v-model="valuesTableCreateNew[data.data.index].name"
              />
              <!-- <span class="remind-user" v-if="!valuesTableCreateNew[data.data.index].name"
                >Bắt buộc</span
              > -->
            </template>
            <template #cell(code)="data">
              <input
                type="text"
                placeholder="Mã"
                class="input-add"
                v-model="valuesTableCreateNew[data.data.index].code"
              />
            </template>
            <template #cell(note)="data">
              <textarea
                placeholder="Ghi chú..."
                class=""
                data-mdb-toggle="popover"
                title="Click 2 lần để mở to"
                v-model="valuesTableCreateNew[data.data.index].note"
                @dblclick="
                  showTextAreaAdd(
                    valuesTableCreateNew[data.data.index].note,
                    data.data.index
                  )
                "
              >
              </textarea>
            </template>
            <template #cell(status)="data">
              <el-select
                v-model="valuesTableCreateNew[data.data.index].status"
                placeholder="Chọn"
                style="width: 100%"
              >
                <el-option
                  v-for="item in options"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </template>
            <template #cell(actions)="data">
              <button
                class="action-table-add action-add-type"
                @click="addRow(data.data.index)"
              >
                <font-awesome-icon icon="fa-solid fa-plus" />
              </button>
              <button
                class="action-table-add action-minus-type"
                @click="minusRow(data.data.index)"
              >
                <font-awesome-icon icon="fa-solid fa-minus" />
              </button>
            </template>
          </table-admin>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="isShowDiaLog = false">Thoát</el-button>
              <el-button type="primary" @click="switchAPICreate()"> Tạo </el-button>
            </span>
          </template>
        </el-dialog>
      </div>

      <el-dialog
        v-model="showTextArea"
        :title="`Nội dung ghi chú hàng ${idCol}`"
        width="30%"
        class="show-text-area"
      >
        <textarea
          placeholder="Chưa có nội dung"
          v-model="contentCol.value"
          class="textarea-more"
          >{{ contentCol.value }}</textarea
        >
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
    </div>
    <div class="table-type-response" v-if="isActiveTableTypeResponse">
      <div class="text-center">
        <h3>Bảng quản lý các loại phản hồi</h3>
      </div>
      <div class="card p-3">
        <table-admin
          :titles="titlesTable"
          :items="itemsTable"
          :loading="loadingTable"
          class="p-2"
        >
          <template #cell(code)="data">
            <span class="col-name"> {{ data.data.value.code }}</span>
          </template>
          <template #cell(name)="data">
            <span class="col-name"> {{ data.data.value.name }}</span>
          </template>
          <template #cell(note)="data">
            {{ data.data.value.note }}
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
    </div>

    <!-- table-source-report -->
    <componentsReportSource
      v-if="isActiveTableReportSource"
      :items="itemsTable"
      :isData="nullReportSource"
      :showLoading="loadingTable"
      @retrieval-request="dataRetrievalRequest"
    >
    </componentsReportSource>
    <section class="text-end me-5 mt-3 pb-1">
      <pagination-Button
        :total="rowDefault"
        :currentPage="currentPageDefault"
        @page-return="returnResultFromPagination"
      >
      </pagination-Button>
    </section>
  </section>
</template>

<script>
import tableAdmin from "../../components/tableAdmin.vue";
import paginationButton from "../../components/paginationButton.vue";
import { ElMessage } from "element-plus";
import { ElNotification } from "element-plus";
import componentsReportSource from "./componentsReportSource.vue";

import apiTypeReport from "@/js/api/admin/apiTypeReport.js";
import apiReportSource from "@/js/api/admin/apiReportSource.js";

export default {
  name: "settingFeedback",
  components: {
    tableAdmin,
    paginationButton,
    componentsReportSource,
  },
  setup() {},
  directives: {},
  data() {
    return {
      contentCol: {
        value: "",
        index: 1,
      },
      idCol: 1,
      showTextArea: false,
      tabPosition: "left",
      titlesTable: [
        { key: "index", label: "STT", text: "center" },
        { key: "code", label: "Mã", text: "start" },
        { key: "name", label: "Tên", text: "start", color: "black" },
        { key: "note", label: "Ghi chú", text: "start" },
        { key: "status", label: "Trạng thái", text: "center" },
        { key: "actions", label: "Thao tác", text: "center" },
      ],
      itemsTable: [],
      isShowDiaLog: false,
      valuesTableCreateNew: [{ name: "", note: "", status: 0 }],
      valueStatus: null,
      options: [
        {
          value: 0,
          label: "Khóa",
        },
        {
          value: 1,
          label: "Hoạt động",
        },
      ],
      rowDefault: 5,
      currentPageDefault: 1,
      visibleRecordCount: 10,
      pageReturn: null,
      isCount: true,
      loadingTable: true,
      //
      isActiveTableTypeResponse: true,
      isActiveTableReportSource: false,
      //reportSource
      nullReportSource: false,
    };
  },
  created() {
    // this.getListTypeReports();
    this.switchAPIList();
  },
  mounted() {
    // Logic sau khi component được gắn kết (render) vào DOM
  },
  computed() {
    // được sử dụng để định nghĩa các thuộc tính tính toán
  },
  watch: {
    pageReturn(val) {
      this.currentPageDefault = val;
      this.switchAPIList();
    },
    isActiveTableTypeResponse(val) {
      if (val) {
        this.isActiveTableReportSource = false;
        this.switchAPIList();
      }
    },
    isActiveTableReportSource(val) {
      if (val) {
        this.isActiveTableTypeResponse = false;
        this.switchAPIList();
      }
    },
  },
  updated() {},
  destroyed() {},
  methods: {
    showTextAreaAdd(value, index) {
      this.showTextArea = true;
      this.contentCol.value = value;
      this.contentCol.index = index;
    },
    clearContentTextArea(index) {
      this.contentCol.value = "";
      this.valuesTableCreateNew[index].note = "";
    },
    addRow(index) {
      if (this.valuesTableCreateNew.length == 10) {
        ElMessage({
          showClose: true,
          message: "Oh thật mệt mỏi khi phải thêm quá nhiều dữ liệu cùng một lúc",
          type: "warning",
        });
      }
      if (this.valuesTableCreateNew.length > 11) {
        ElMessage({
          showClose: true,
          message: "Quá nhiều dữ liệu cùng một lúc !",
          type: "error",
        });
        return;
      }
      const obj = { name: "", note: "", status: 0 };
      this.valuesTableCreateNew.splice(++index, 0, obj);
    },
    minusRow(index) {
      if (this.valuesTableCreateNew.length <= 1) {
        ElMessage({
          showClose: true,
          message: "Không thể xóa thêm được nữa",
          type: "warning",
        });
        return;
      }

      this.valuesTableCreateNew.splice(index, 1);
    },
    submitPopupTextArea(value) {
      this.showTextArea = false;
      this.valuesTableCreateNew[value.index].note = value.value;
    },
    createTypeReports() {
      var shouldCallApi = true;
      this.valuesTableCreateNew.forEach((element, key) => {
        if (!element.name) {
          shouldCallApi = false;
          return;
        }
        if (!element.note) {
          this.valuesTableCreateNew[key].note = "Trống";
        }
      });
      if (!shouldCallApi) {
        return ElMessage({
          showClose: true,
          message: "Trường tên là trường bắt buộc",
          type: "warning",
        });
      }
      const data = this.valuesTableCreateNew;
      apiTypeReport
        .createTypeReports(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: dataResponse.results,
              type: "success",
            });
            this.isShowDiaLog = false;
            this.valuesTableCreateNew = [{ name: "", note: "", status: 0 }];
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
    getListTypeReports() {
      this.loadingTable = true;
      const data = {
        page: this.currentPageDefault,
        record_number: this.visibleRecordCount,
        count: this.isCount,
      };
      apiTypeReport
        .getListTypeReportsByPage(data)
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
    changeStatus(id) {
      this.loadingTable = true;
      var input = { id };
      apiTypeReport
        .changeTypeReports(input)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: dataResponse.results,
              type: "success",
            });
            this.getListTypeReports();
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
    deleteRecord(id) {
      this.loadingTable = true;
      var input = { id };
      apiTypeReport
        .deleteTypeReports(input)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: dataResponse.results,
              type: "success",
            });
            this.getListTypeReports();
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
    createReportSource() {
      var shouldCallApi = true;
      this.valuesTableCreateNew.forEach((element, key) => {
        if (!element.name) {
          shouldCallApi = false;
          return;
        }
        if (!element.note) {
          this.valuesTableCreateNew[key].note = "Trống";
        }
      });
      if (!shouldCallApi) {
        return ElMessage({
          showClose: true,
          message: "Trường tên là trường bắt buộc",
          type: "warning",
        });
      }
      const data = this.valuesTableCreateNew;
      apiReportSource
        .createReportSource(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            ElNotification({
              title: "Success",
              message: dataResponse.results,
              type: "success",
            });
            this.isShowDiaLog = false;
            this.valuesTableCreateNew = [{ name: "", note: "", status: 0 }];
            this.getListReportSource();
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
    getListReportSource() {
      const data = {
        page: this.currentPageDefault,
        record_number: this.visibleRecordCount,
        count: this.isCount,
      };
      apiReportSource
        .getListReportSourceByPage(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.nullReportSource = false;
            if (dataResponse.results.page.length <= 0) {
              this.nullReportSource = true;
            }
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
    switchAPICreate() {
      if (this.isActiveTableTypeResponse) {
        this.createTypeReports();
        return;
      }
      if (this.isActiveTableReportSource) {
        this.createReportSource();
        return;
      }
    },
    switchAPIList() {
      this.loadingTable = true;
      if (this.isActiveTableTypeResponse) {
        this.getListTypeReports();
        return;
      }
      if (this.isActiveTableReportSource) {
        this.getListReportSource();
        return;
      }
    },
    dataRetrievalRequest(val) {
      this.switchAPIList();
    },
  },
};
</script>

<style scoped>
#setting-feedback {
}

.tap-view {
  display: flex;
  padding: 1rem 1rem 0 1rem;
}

.tap-view button {
  margin: 0.5rem;
  min-height: 2.5rem;
  min-width: 8.5rem;
  border: none;
  border-radius: 10px;
  background: #2a6fe6;
  color: white;
  font-size: 14px;
}

.tap-view button.active-table {
  background-color: #44a747 !important;
}

.tap-view button:hover {
  background: #d9d9d9;
  color: #000;
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

.add-type-feedback > .text-end > button {
  border: 1px solid #28a745;
  width: 4rem;
  height: 2.5rem;
  border-radius: 10px;
  margin: 1rem;
  color: white;
  background: #28a745;
}

.add-type-feedback > .text-end > button:hover {
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

.input-add:placeholder-shown {
  border: 1px solid #da2525;
}

input[type="text"]:focus {
  border-color: rgb(94, 255, 0) !important;
  outline: none;
}

.add-type-feedback textarea {
  width: 100%;
  height: 2rem;
  border: 1px solid #e8eaee;
  border-radius: 5px;
  padding: 4px 0 0 4px;
}

.add-type-feedback textarea:focus {
  border-color: rgb(94, 255, 0) !important;
  outline: none;
}

.textarea-more {
  border: 1px solid #e8eaee;
  border-radius: 5px;
}

.textarea-more:focus {
  border-color: palegreen !important;
  outline: none;
}

.show-text-area textarea {
  width: 100%;
  padding: 11px 0px 0px 11px;
}

span.remind-user {
  font-size: 70%;
  color: red;
}

.col-name {
  font-weight: bold;
}
</style>
