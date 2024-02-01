<template>
  <!-- Nội dung giao diện người dùng -->
  <table>
    <thead>
      <tr>
        <th colspan="2">Menu cha</th>
        <th colspan="5">Menu con</th>
      </tr>
      <tr>
        <th>Tên</th>
        <th>Thông tin</th>
        <th>Tên</th>
        <th>Vị trí</th>
        <th>Màu</th>
        <th>Trạng thái</th>
        <th>Thao tác</th>
      </tr>
    </thead>
    <tbody class="row-table" v-for="(item, key) in dataMenu" :key="key">
      <tr>
        <td :rowspan="item.sub.length">
          <div class="menu-name">
            <strong>{{ item.main }}</strong>
            <br />
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
        <td :rowspan="getNumberRow_1(item.sub.length)">
          <div class="order-table">
            <strong>Vị trí</strong> <span>{{ item.main_order }}</span>
          </div>
        </td>
        <td>{{ item.sub[0].sub ?? "" }}</td>
        <td class="order-sub">{{ item.sub[0].sub_order ?? "" }}</td>
        <td>
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(item.sub[0].sub_color) ? item.sub[0].sub_color : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{
                background: isColorCode(item.sub[0].sub_color)
                  ? item.sub[0].sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span class="status-on badge" v-if="item.sub[0].sub_status">Hoạt động</span>
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
      <tr
        v-for="(subItem, subKey) in item.sub.slice(1, getNumberRow_1(item.sub.length))"
        :key="subKey"
      >
        <td>{{ subItem.sub }}</td>
        <td class="order-sub">{{ subItem.sub_order }}</td>
        <td>
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(subItem.sub_color) ? subItem.sub_color : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{
                background: isColorCode(subItem.sub_color)
                  ? subItem.sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span class="status-on badge" v-if="subItem.sub_status">Hoạt động</span>
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
      <tr>
        <td :rowspan="getNumberRow_1(item.sub.length)">
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(item.color) ? item.color : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{ background: isColorCode(item.color) ? item.color : colorDefault }"
            ></span>
          </div>
        </td>
        <td>
          {{ item.sub[getNumberRow_1(item.sub.length)].sub ?? "" }}
        </td>
        <td class="order-sub">
          {{ item.sub[getNumberRow_1(item.sub.length)].sub_order ?? "" }}
        </td>
        <td>
          <div class="box-list">
            <strong>
              {{
                isColorCode(item.sub[getNumberRow_1(item.sub.length)].sub_color)
                  ? item.sub[getNumberRow_1(item.sub.length)].sub_color
                  : colorDefault
              }}</strong
            >
            <span
              class="color"
              :style="{
                background: isColorCode(
                  item.sub[getNumberRow_1(item.sub.length)].sub_color
                )
                  ? item.sub[getNumberRow_1(item.sub.length)].sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span
            class="status-on badge"
            v-if="item.sub[getNumberRow_1(item.sub.length)].sub_status"
            >Hoạt động</span
          >
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
      <tr
        v-for="(subItem, subKey) in item.sub.slice(
          getNumberRow_1(item.sub.length) + 1,
          getNumberRow_1(item.sub.length) * 2
        )"
        :key="subKey"
      >
        <td>{{ subItem.sub }}</td>
        <td class="order-sub">{{ subItem.sub_order }}</td>
        <td>
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(subItem.sub_color) ? subItem.sub_color : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{
                background: isColorCode(subItem.sub_color)
                  ? subItem.sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span class="status-on badge" v-if="subItem.sub_status">Hoạt động</span>
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
      <tr>
        <td :rowspan="getNumberLastRow(item.sub.length)" class="table-status">
          <span class="status-on badge" v-if="item.main_status">Hoạt động</span>
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td>
          {{ item.sub[getNumberRow_1(item.sub.length) * 2].sub ?? "" }}
        </td>
        <td class="order-sub">
          {{ item.sub[getNumberRow_1(item.sub.length) * 2].sub_order ?? "" }}
        </td>
        <td>
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(item.sub[getNumberRow_1(item.sub.length) * 2].sub_color)
                  ? item.sub[getNumberRow_1(item.sub.length) * 2].sub_color
                  : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{
                background: isColorCode(
                  item.sub[getNumberRow_1(item.sub.length) * 2].sub_color
                )
                  ? item.sub[getNumberRow_1(item.sub.length) * 2].sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span
            class="status-on badge"
            v-if="item.sub[getNumberRow_1(item.sub.length) * 2].sub_status"
            >Hoạt động</span
          >
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
      <tr
        class="sub"
        v-if="item.sub.length > 3"
        v-for="(subItem, subKey) in item.sub.slice(
          getNumberRow_1(item.sub.length) * 2 + 1
        )"
        :key="subKey"
      >
        <td>{{ subItem.sub }}</td>
        <td class="order-sub">{{ subItem.sub_order }}</td>
        <td>
          <div class="box-list">
            <strong>
              <span>{{
                isColorCode(subItem.sub_color) ? subItem.sub_color : colorDefault
              }}</span></strong
            ><span
              class="color"
              :style="{
                background: isColorCode(subItem.sub_color)
                  ? subItem.sub_color
                  : colorDefault,
              }"
            ></span>
          </div>
        </td>
        <td class="table-status">
          <span class="status-on badge" v-if="subItem.sub_status">Hoạt động</span>
          <span class="status-off badge" v-else>Dừng</span>
        </td>
        <td class="btn-table">
          <div class="list-btn">
            <button class="btn btn-block me-2">
              <font-awesome-icon icon="fa-solid fa-ban" />
            </button>
            <button class="btn btn-rename">
              <font-awesome-icon icon="fa-regular fa-pen-to-square" />
            </button>
          </div>
        </td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="2">
          <div>
            <strong>Tổng Menu lớn</strong><strong>{{ totalMain }}</strong>
          </div>
        </td>
        <td colspan="5">
          <div>
            <strong>Tổng Menu con</strong><strong>{{ totalSub }}</strong>
          </div>
        </td>
      </tr>
    </tfoot>
  </table>
</template>

<script>
import methodDefine from "@/js/mixins/methodDefine.js";

export default {
  name: "Menu-table",
  components: {},
  props: ["data"],
  setup() {},
  mixins: [methodDefine],

  directives: {},
  data() {
    return {
      dataMenu: this.data,
      colorDefault: "#000",
      totalMain: 0,
      totalSub: 0,
    };
  },
  watch: {
    data(value) {
      console.log(value);
      this.dataMenu = value;
      this.getTotal(value);
    },
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
  methods: {
    getNumberRow_1(number) {
      let averageResults = number / 3;
      return Number(averageResults.toFixed());
    },
    getNumberLastRow(number) {
      let averageResults = number / 3;
      let rounding = averageResults.toFixed();
      return Number(number - rounding * 2);
    },
    getTotal(data) {
      this.totalMain = data.length;
      this.totalSub = 0;
      data.forEach((ele) => {
        this.totalSub += ele.sub.length;
      });
    },
  },
};
</script>

<style scoped>
table {
  border-collapse: collapse;
  width: 100%;
}
th,
td {
  border: 1px solid #ccc;
  padding: 5px;
}

th {
  background-color: #f0f0f0;
}

td.menu-con {
  width: 100px;
}

td.trang-thai {
  text-align: center;
}
thead > tr th {
  text-align: center;
  font-weight: bold;
}
thead tr:nth-child(2) th:nth-child(4) {
  max-width: 1rem;
}
thead tr:nth-child(2) th:nth-child(6) {
  max-width: 3rem;
}
thead tr:nth-child(2) th:last-child {
  max-width: 3rem;
}
thead tr:nth-child(2) th:nth-child(2),
tbody td[rowspan] {
  max-width: 3rem;
}
tbody {
  border: 3px solid #51a9ff;
}
table > thead > tr:first-child th:first-child,
table > thead > tr:nth-child(2) th:first-child,
table > thead > tr:nth-child(2) th:nth-child(2) {
  background-color: #4464bb;
  color: white;
  border: 2px solid #e8eaed;
}
tbody > tr:first-child > td:first-child {
  text-align: center;
  max-width: 5rem;
}
.table-status {
  max-width: 3rem;
}
.order-sub {
  max-width: 1rem;
}
.order-sub,
.table-status {
  text-align: center;
}
.menu-name {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.order-table {
  display: flex;
  align-items: center;
  flex-direction: column;
}
.order-table span {
  font-weight: bold;
}
.btn-table {
  max-width: 3rem;
}
.list-btn {
  text-align: center;
}
span.color {
  padding: 0.5rem 1rem;
}
div.box-list {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}
tfoot tr > td > div {
  display: flex;
  justify-content: space-between;
  font-size: 105%;
}
tfoot tr > td > div strong:nth-child(2) {
  color: red;
}
</style>
