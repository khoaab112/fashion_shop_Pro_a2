<template>
  <section class="home">
    <section id="header-admin">
      <div class="header-admin d-flex justify-content-end">
        <div id="breadcrumb">
          <el-breadcrumb separator-class="el-icon-arrow-right">
            <div>
              <el-breadcrumb-item :to="{ path: '/admin/home' }">HOME</el-breadcrumb-item>
              <el-breadcrumb-item
                v-for="value in breadcrumb"
                :class="{
                  'show-breadcrumb':
                    Object.keys(value.meta).length <= 0 ||
                    value.path == '/admin/home' ||
                    value.path == '/admin',
                }"
                :to="{ path: value.path }"
                >{{ value.meta.breadcrumb }}</el-breadcrumb-item
              >
            </div>
          </el-breadcrumb>
        </div>
        <div class="">
          <button type="button" class="btn-set btn-header-admin">
            <font-awesome-icon icon="fa-solid fa-list-check" />
          </button>
          <button
            type="button"
            class="btn-bell btn-header-admin"
            data-bs-toggle="offcanvas"
            data-bs-target="#offcanvasRight"
            aria-controls="offcanvasRight"
            @click="getListNotifications"
          >
            <font-awesome-icon class="icon-notification" icon="fa-regular fa-bell" />
            <p
              class="notification-number"
              v-if="notificationNumber > 0 && notificationNumber < 99"
            >
              {{ notificationNumber }}
            </p>
            <p class="notification-number" v-else-if="notificationNumber > 99">+99</p>
          </button>
        </div>
      </div>
    </section>
    <main>
      <div id="content-admin">
        <div class="container-content bg-content">
          <router-view></router-view>
        </div>
      </div>
    </main>
  </section>
  <!-- THông báo cho người dùng -->
  <section id="sidebar-notification">
    <div
      class="offcanvas offcanvas-end"
      tabindex="-1"
      id="offcanvasRight"
      aria-labelledby="offcanvasRightLabel"
    >
      <div class="offcanvas-header">
        <h5 id="offcanvasRightLabel">
          Thông báo
          <button class="check-all" @click="markAllNotification">
            <font-awesome-icon icon="fa-solid fa-list-check" />
          </button>
          <button class="check-all" @click="sortArr()">
            <font-awesome-icon icon="fa-solid fa-up-down" />
          </button>
        </h5>
        <button
          type="button"
          class="btn-close text-reset"
          data-bs-dismiss="offcanvas"
          aria-label="Close"
        ></button>
      </div>
      <div class="offcanvas-body" id="sidebar-notification">
        <loadingStyleWave v-if="!isShowDataNotification" class="style-loading">
        </loadingStyleWave>
        <div
          v-for="item in listNotifications"
          class="notification"
          :class="{ 'unread-notification': !item.watched }"
          v-else
        >
          <el-checkbox
            v-model="item.status"
            @change="checkNotification(item)"
            v-if="!item.watched"
          >
            &nbsp</el-checkbox
          >
          <strong
            class="label-notification"
            :style="{ background: '#' + `${item.color}` }"
            >{{ item.name }}</strong
          ><span>&ensp;:&ensp;</span>
          <span class="item-un">
            {{ item.content }}
          </span>
          <!-- <span>{{}}</span> -->
          <br />
          <span class="time-notification"
            ><b>({{ calculateTime(item.created_at) }})</b>&nbsp{{ item.created_at }}</span
          >
          <hr />
        </div>
        <div class="text-center">
          <span v-if="listNotifications.length <= 0">Không có thông báo</span>
        </div>
        <div
          class="more-notification text-center"
          v-if="nextPage < maxPage"
          @click="nextNotification()"
        >
          Xem thêm
        </div>
      </div>
    </div>
  </section>
  <section>
    <audio id="audio-notification">
      <source :src="mp3Notification" type="audio/mpeg" />
    </audio>
  </section>
</template>

<script>
import sessionStorage from "@/js/auth/sessionStorage.js";
import apiManagerAccount from "@/js/api/broadcasting/apiManagerAccount.js";
import apiNotification from "@/js/api/admin/apiNotification.js";
import { ElNotification } from "element-plus";
import globalVariable from "@/js/generalSetting/globalVariable.js";
import loadingStyleWave from "@/js/viewsVue/components/loading/loadingStyleWave.vue";
import notificationMp3 from "@/public/mp3/notification/notification-admin.mp3";

export default {
  components: {
    loadingStyleWave,
  },
  data() {
    return {
      KEY_SESSION: "session_storage_accessed",
      // circleUrl: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
      breadcrumb: null,
      pollingInterval: null,
      staff: null,
      notificationNumber: null,
      listNotifications: [],
      isShowDataNotification: false,
      recordNumber: null,
      nextPage: 1,
      maxPage: null,
      isNotAllowed: false,
      arrIdchecks: [],
      mp3Notification: "mp3-notification",
      dateNow: new Date(),
      id: null,
    };
  },
  created() {
    this.breadcrumb = this.$route.matched;
    this.getGlobalVariableInfoStaff();
    window.addEventListener("beforeunload", this.handleBeforeUnload);
    this.mp3Notification = notificationMp3;
  },
  watch: {
    "$route.matched"(value) {
      this.breadcrumb = value;
    },
  },
  mounted() {
    window.Echo.private("notification_admin")
      .listen(".notification.admin", async (e) => {
        this.notificationNumber = ++this.notificationNumber;
        this.listNotifications.push(e.message.content);
        this.playAudio();
      })
      .error((error) => {
        if (error.status == 403) {
          location.reload();
        }
      });
    window.Echo.private(`disconnect-admin-${this.id}`)
      // window.Echo.private(`disconnect-admin-`)
      .listen(".admin.logout", async (e) => {
        console.log(e);
      })
      .error((error) => {
        if (error.status == 403) {
        }
      });
  },
  computed() {
    // được sử dụng để định nghĩa các thuộc tính tính toán
  },
  updated() {},
  destroyed() {
    window.removeEventListener("beforeunload", this.handleBeforeUnload);
  },
  methods: {
    async getGlobalVariableInfoStaff() {
      const intervalTime = 1000; // 1 giây
      const maxDuration = 10000; // 10 giây
      const startTime = Date.now();
      this.pollingInterval = setInterval(async () => {
        this.staff = await globalVariable.getGlobalVariableInfoStaff();
        if (this.staff || Date.now() - startTime > maxDuration) {
          // Dừng polling
          this.numberOfUnreadNotifications(this.staff.id);
          clearInterval(this.pollingInterval);
          // Tiếp tục
          this.id = this.staff.id;
          console.log(this.id);
          this.checkAccessed(this.staff);
        }
      }, intervalTime);
    },
    async checkAccessed(data) {
      if (sessionStorage.getSession(this.KEY_SESSION)) {
        return;
      }
      var dataPost = {
        id: data.id,
        name: data.name,
        phone_number: data.phone_number,
        img: data.img,
        code_staff: data.code_staff,
      };
      apiManagerAccount
        .followAccountAdmin(dataPost)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            sessionStorage.setSession(this.KEY_SESSION, true);
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    async handleBeforeUnload() {
      // const idUser = this.staff.id;
      sessionStorage.clearSession();
      await apiManagerAccount
        .deleteStatusAccountAdmin()
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    numberOfUnreadNotifications(staffId) {
      apiNotification
        .CheckForUnreadNotifications(staffId)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.notificationNumber = Number(dataResponse.results);
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    getListNotifications() {
      this.dateNow = new Date();
      if (this.isNotAllowed) return;
      this.isShowDataNotification = false;
      var data = {
        record_number: 10,
        page: this.nextPage,
        count: true,
      };
      apiNotification
        .getNotificationByIdStaff(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.isShowDataNotification = true;
            this.listNotifications = dataResponse.results.notification;
            this.recordNumber = dataResponse.results.total_record;
            // this.maxPage = (this.recordNumber / 10).toFixed();
            this.maxPage = Math.ceil(this.recordNumber / 10);
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    markAllNotification() {
      if (this.arrIdchecks.length > 0) {
        apiNotification
          .changeWatchedStatusByID({ arr_id: this.arrIdchecks })
          .then((res) => {
            var dataResponse = res.data;
            if (dataResponse.result_code == 200) {
              this.getListNotifications();
              this.numberOfUnreadNotifications(this.staff.id);
              return ElNotification({
                title: "Success",
                message: "Đọc thành công",
                type: "success",
              });
            } else throw new Error(dataResponse.result_code);
          })
          .catch((error) => {
            ElNotification({
              title: "Error",
              message: "Có lỗi bất thường",
              type: "error",
            });
          });
        return;
      }
      if (this.notificationNumber <= 0) {
        return ElNotification({
          title: "Success",
          message: "Đọc tất cả thành công",
          type: "success",
        });
      }
      apiNotification
        .changeWatchedStatus(this.staff.id)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.getListNotifications();
            return ElNotification({
              title: "Success",
              message: "Đọc tất cả thành công",
              type: "success",
            });
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    nextNotification() {
      if (this.nextPage == this.maxPage || this.nextPage > this.maxPage) {
        this.isNotAllowed = true;
        return ElNotification({
          title: "Error",
          message: "lỗi bất thường",
          type: "error",
        });
      }
      this.nextPage = this.nextPage + 1;
      var data = {
        record_number: 10,
        page: this.nextPage,
        count: true,
      };
      apiNotification
        .getNotificationByIdStaff(data)
        .then((res) => {
          var dataResponse = res.data;
          if (dataResponse.result_code == 200) {
            this.listNotifications = [
              ...this.listNotifications,
              ...dataResponse.results.notification,
            ];
            this.recordNumber = dataResponse.results.total_record;
            this.maxPage = (this.recordNumber / 10).toFixed();
            if (this.nextPage == this.maxPage || this.nextPage > this.maxPage)
              this.isNotAllowed = true;
          } else throw new Error(dataResponse.result_code);
        })
        .catch((error) => {
          ElNotification({
            title: "Error",
            message: "Có lỗi bất thường",
            type: "error",
          });
        });
    },
    checkNotification(data) {
      if (data.status) {
        return this.arrIdchecks.push(data.id);
      }
      return this.arrIdchecks.filter((item) => item !== data.id);
    },
    sortArr() {
      this.listNotifications = this.listNotifications.reverse();
    },
    playAudio() {
      const audio = document.getElementById("audio-notification");
      audio.play();
    },
    calculateTime(timeInput) {
      var timeStart = new Date(timeInput);
      const timeNow = this.dateNow;
      const timeDifference = timeNow - timeStart;
      const minutesDifference = Math.floor(timeDifference / (1000 * 60));
      const hoursDifference = Math.floor(timeDifference / (1000 * 60 * 60));
      const daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
      // sét theo giờ
      if (hoursDifference >= 24) {
        if (daysDifference >= 1) {
          return `${daysDifference} ngày trước`;
        }
      } else {
        if (minutesDifference <= 0) {
          return `< 1 phút trước`;
        }
        if (minutesDifference <= 60) {
          return `${minutesDifference} phút trước`;
        } else {
          return `${hoursDifference} giờ trước`;
        }
      }
    },
  },
};
</script>

<style scoped>
/* CSS cho component */
.time-notification {
  float: right;
  font-size: 80%;
  color: #594e4e;
}

.time-notification > b {
  color: #7c9cde;
}

.style-loading {
  height: 37px;
}

button.check-all {
  border: none;
  background: none;
  margin-left: 20px;
  color: #007bff;
}

button.check-all:hover {
  color: black;
  transform: scale(1.2);
}

.notification {
  border-radius: 5px;
  padding: 6px 0px 0px 5px;
}

.unread-notification {
  background: #b4b3b35c;
}

.more-notification {
  padding: 1px 5px;
  border-radius: 10px;
  background-color: #007bff;
  display: block;
  cursor: pointer;
  border: none;
  text-align: center;
  text-decoration: none;
  transition: background-color 0.3s ease;
  user-select: none;
}

.more-notification:hover {
  background-color: #219c90;
}

strong.label-notification {
  padding: 1px 5px;
  color: white;
  font-size: 14px;
  border-radius: 10px;
  user-select: none;
}

strong.label-notification:hover {
  background-color: #26577c !important;
  color: #f1efef;
}

hr {
  border-top: 1px dashed black;
}

.offcanvas-end {
  top: 9vh !important;
  bottom: 6vh;
  border-radius: 20px 0 0 20px;
}

.btn-header-admin {
  border: none;
  font-size: 24px;
  float: right;
  background: none;
  margin-right: 2rem;
  position: relative;
}

.icon-notification:hover {
  color: #409eff;
  transform: scale(1.2);
}

.btn-header-admin .notification-number {
  position: absolute;
  top: 0px;
  font-size: 12px;
  font-weight: bold;
  right: -8px;
  background: #ff0000ab;
  width: 100%;
  height: 20px;
  border-radius: 10px;
  animation: beat 0.8s infinite alternate;
  transform-origin: center;
}

@keyframes beat {
  to {
    transform: scale(1.1);
  }
}

main {
  margin-top: 6.5rem;
}

section#header-admin {
  position: fixed;
  width: 96%;
  right: 0px;
  z-index: 1;
}

div#breadcrumb {
  position: absolute;
  left: 18px;
  background: white;
  padding: 0.5rem 2rem 0.5rem 1rem;
  border-radius: 10px;
  z-index: 99999;
  font-weight: bolder;
}

.show-breadcrumb {
  display: none;
}

.avatar-admin {
  margin-left: 0.5rem;
  margin-top: 0.3rem;
}

.header-admin {
  position: relative;
  width: 96%;
  background: #a0c49d;
  margin: auto;
  border-radius: 10px;
  margin-top: 1rem;
  display: flex;
  height: 3rem;
  align-items: center;
}

.btn-bell {
  color: white;
}

.btn-bell-signal {
  color: yellow;
}

.btn-set {
  color: white;
}

.home {
  position: absolute;
  top: 0;
  left: 250px;
  height: 100vh;
  width: calc(100% - 250px);
  background-color: var(--body-color);
  transition: var(--tran-05);
}

.home .text {
  font-size: 30px;
  font-weight: 500;
  color: var(--text-color);
  padding: 12px 60px;
}

.sidebar.close ~ .home {
  left: 78px;
  height: 100vh;
  width: calc(100% - 78px);
}

body.dark .home .text {
  color: var(--text-color);
}

/*  */
#content-admin {
  margin-top: 2.5rem;
  height: 100vh;
  background-color: #e4e9f7;
}

.bg-content {
  background-color: white;
  min-height: 10rem;
}

.container-content {
  width: 95%;
  margin: 0 auto;
}

.offcanvas-body {
  overflow: auto;
  overflow-x: hidden;
  overflow-y: scroll;
  height: 40vh;
}

.offcanvas-body::-webkit-scrollbar {
  width: 7px;
  height: 5px;
}

.offcanvas-body::-webkit-scrollbar-track {
  background-color: #e9f0ff;
  border-radius: 4px;
  border-left: 2.5px solid white;
  border-right: 2.5px solid white;
}

.offcanvas-body::-webkit-scrollbar-thumb {
  box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
  border-radius: 4px;
  background-color: #8fb3ff;
}

@media (max-width: 1600px) {
  section#header-admin {
    width: 95%;
  }
}

@media (max-width: 1300px) {
  section#header-admin {
    width: 94%;
  }
}

@media (max-width: 1300px) {
  section#header-admin {
    width: 92%;
  }
}

@media (max-width: 800px) {
  section#header-admin {
    width: 90%;
  }
}

@media (max-width: 580px) {
  .container-content {
    width: 90%;
    margin: 0 auto;
  }

  section#header-admin {
    width: 84%;
  }
}
</style>
