<template>
  <section class="table-vue">
    <table>
      <thead>
        <tr>
          <th
            v-for="(val, indexTitles) in titles"
            :key="indexTitles"
            :class="val.key == `index` ? 'p-3' : ''"
          >
            {{ val.label }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(record, key) of items"
          :key="key"
          :class="record.status ? 'color-status' : ''"
        >
          <td
            v-for="(valTitles, indexTitles) in titles"
            :key="indexTitles"
            :class="[getClass(valTitles.text), valTitles.key == `index` ? 'p-3' : '']"
          >
            <template v-if="valTitles.key == `index`">
              {{ Number(key) + 1 }}
            </template>
            <template v-if="searchCellName(record, valTitles.key)">
              <div :style="`color: ${getColor(valTitles)};`">
                <slot
                  :name="`cell(${valTitles.key})`"
                  :data="{ value: record, index: key }"
                ></slot>
              </div>
            </template>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="loading-data text-center" v-if="loading">
      <loadingStyleTwirl></loadingStyleTwirl>
      <h5 class="pt-3 ps-3">Đang tải.....</h5>
    </div>
    <div class="text-center notify-users">
      <slot name="notifyUsers"></slot>
    </div>
  </section>
</template>

<script scoped>
import loadingStyleTwirl from "./loading/loadingStyleTwirl.vue";
export default {
  name: "tableAdmin",
  components: {
    loadingStyleTwirl,
  },
  props: {
    //  titles = key , label
    titles: Array,
    items: Array,
    loading: Boolean,
  },
  setup() {},
  directives: {},
  data() {
    return {
      arrTitle: this.titles,
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
    searchCellName(record, key) {
      const arrTitle = Object.keys(record);
      arrTitle.forEach((element) => {
        if (element == key) {
          return true;
        }
      });
      return true;
    },
    getClass(value) {
      switch (value) {
        case "center":
          return "text-center";
        case "start":
          return "text-start";
        case "end":
          return "text-end";
        default:
          return "text-start";
      }
    },
    getColor(value) {
      if (!value.color) {
        return "black";
      } else return value.color;
    },
  },
};
</script>

<style scoped>
.color-status {
  background-color: #e0d3db;
}

section.table-vue {
  position: relative;
}

.notify-users {
  position: absolute;
  bottom: 50%;
  right: 40%;
  left: 40%;
}

table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  overflow: hidden;
  width: 100%;
  margin: 0 auto;
  position: relative;
}

.table-vue {
  min-height: 30rem;
}

table * {
  position: relative;
}

table td,
table th {
  padding-left: 3rem;
}

table thead tr {
  height: 60px;
  background: #99b19c;
  font-size: 16px;
}

table tbody tr {
  height: 48px;
  border-bottom: 1px solid #e3f1d5;
}

table tbody tr:last-child {
  border: 0;
}

table td,
table th {
  text-align: center;
}

table td.l,
table th.l {
  text-align: right;
}

table td.c,
table th.c {
  text-align: center;
}

table td.r,
table th.r {
  text-align: center;
}

@media screen and (max-width: 35.5em) {
  table {
    display: block;
  }

  table > *,
  table tr,
  table td,
  table th {
    display: block;
  }

  table thead {
    display: none;
  }

  table tbody tr {
    height: auto;
    padding: 8px 0;
  }

  table tbody tr td {
    padding-left: 45%;
    margin-bottom: 12px;
  }

  table tbody tr td:last-child {
    margin-bottom: 0;
  }

  table tbody tr td:before {
    position: absolute;
    font-weight: 700;
    width: 40%;
    left: 10px;
    top: 0;
  }

  table tbody tr td:nth-child(1):before {
    content: "Code";
  }

  table tbody tr td:nth-child(2):before {
    content: "Stock";
  }

  table tbody tr td:nth-child(3):before {
    content: "Cap";
  }

  table tbody tr td:nth-child(4):before {
    content: "Inch";
  }

  table tbody tr td:nth-child(5):before {
    content: "Box Type";
  }
}

blockquote {
  color: white;
  text-align: center;
}
</style>
