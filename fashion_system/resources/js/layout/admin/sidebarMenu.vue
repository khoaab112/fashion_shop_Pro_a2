<template>
    <nav :class="{ 'sidebar': true, 'close': !activeShowSidebar }">
        <header>
            <div class="image-text">
                <span class="image-logo-sidebar">
                    <img :src=checkImageAdmin() alt="logo_system">
                </span>

                <div class="text logo-text">
                    <span class="admin-name">TomTom</span>
                    <span class="profession">New Edge</span>
                </div>
            </div>
            <hr>
            <font-awesome-icon icon="fa-solid fa-angle-right"  id="toggle" @click=showSidebar class="toggle" />
        </header>
        <!--  -->
        <div class="list-menu ">
            <div class="menu_content ">
                <ul class="menu_items" v-for="value in dataMenuSidebar" :key="value.code">
                    <h3 :class="{ 'menu-title-sidebar': true, 'show-titles': activeShowSidebar }"
                        v-if="value.showLabel ? true : false">
                        NG.KHOA
                    </h3>
                    <li class="item">
                        <div href="#" class="nav_link submenu_item show_submenu hover-icon-mainMenu"
                            @click="changeActiveSubmenu(value.code)">
                            <span class="navlink_icon">
                                <font-awesome-icon :icon="value.icon" class="icon " />
                            </span>
                            <span class="navlink" v-bind:hidden="!activeShowSidebar">{{ value.title }}</span>
                            <div class="ml-auto p-2 down"  v-if="value.children.length"><font-awesome-icon icon="fa-solid fa-chevron-down" class=""/></div>
                            <i class="bx bx-chevron-right arrow-left"></i>
                        </div>
                        <ul class="menu_items submenu" v-if="value.children.length && value.active"
                            v-bind:hidden="!activeShowSidebar">
                            <a href="#" class="nav_link sublink hover-icon-subMenu"
                                v-for="item in value.children"><font-awesome-icon :icon="item.icon" class="icon-submenu" />
                                {{ item.title }}</a>
                        </ul>
                    </li>
                </ul>
                <ul class="menu_items">
                    <li><button class="btn-dark">Dark mode</button></li>
                </ul>
            </div>
        </div>
    </nav>
</template>
  
<script>
import dataSidebar from "@/js/generalSetting/adminCategoryMenu.js";
import avatarAdminDefault from "@/public/images/admin/system/administrator.png";
export default {
    data() {
        return {
            activeShowSidebar: false,
            dataMenuSidebar: null,
        };
    },
    created() {
        console.log(dataSidebar);
        this.dataMenuSidebar = this.addElementActiveToSidebar(dataSidebar);
        // Logic khi component được khởi tạo
    },
    mounted() {
        // Logic sau khi component được gắn kết (render) vào DOM
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        // Các phương thức xử lý sự kiện hoặc logic khác
        showSidebar() {
            if (this.activeShowSidebar) {
                this.activeShowSidebar = false;
                this.dataMenuSidebar.forEach(element => {
                    element.active = false;
                });
            }
            else {
                this.activeShowSidebar = true;
            }
        },
        addElementActiveToSidebar(arr) {
            arr.forEach(element => {
                element.active = false;
            });
            return arr;
        },
        changeActiveSubmenu(name) {
            const value = this.dataMenuSidebar.find(item => item.code == name);
            value.active ? value.active = false : value.active = true;
        },
        checkImageAdmin(){
            // return new URL(`@/images/logo/logoAdmin.png`, import.meta.url).href
            return new URL(avatarAdminDefault, import.meta.url).href
        },
    },
};
</script>
  
<style>
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 250px;
    padding: 10px 14px;
    background: var(--sidebar-color);
    transition: var(--tran-05);
    z-index: 100;
}

.sidebar.close {
    width: 88px;
}

.sidebar li {
    height: 50px;
    list-style: none;
    display: initial;
    align-items: center;
    margin-top: 10px;
}

.sidebar header .image-logo-sidebar,

.sidebar .text,

.sidebar .text {
    font-size: 17px;
    font-weight: 500;
    white-space: nowrap;
    opacity: 1;
}

.sidebar.close .text {
    opacity: 0;
}

.sidebar header {
    position: relative;
}

.sidebar header .image-text {
    display: flex;
    align-items: center;
    padding-left: 10px;
    padding-bottom: 1rem;
}

.sidebar header .logo-text {
    display: flex;
    flex-direction: column;
    padding-bottom: 10px;
    padding-left: 20px;
    user-select: none;
}

header .image-text .admin-name {
    margin-top: 2px;
    font-size: 18px;
    font-weight: 600;
}

header .image-text .profession {
    font-size: 16px;
    margin-top: -2px;
    display: block;
}

.sidebar header .image-logo-sidebar {
    display: flex;
    align-items: center;
    justify-content: center;
}

.sidebar header .image-logo-sidebar img {
    width: 40px;
    border-radius: 6px;
}

.sidebar header .toggle {
    position: absolute;
    top: 50%;
    right: -35px;
    transform: translateY(-50%) rotate(180deg);
    height: 40px;
    width: 40px;
    /* background-color: var(--primary-color); */
    background-color: #f9cc88;
    color: var(--sidebar-color);
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    cursor: pointer;
    transition: var(--tran-05);
    z-index: 9999;
}

body.dark .sidebar header .toggle {
    color: var(--text-color);
}

.sidebar.close .toggle {
    transform: translateY(-50%) rotate(0deg);
    z-index: 9999;
}

.sidebar .menu {
    margin-top: 40px;
}

.sidebar li a {
    list-style: none;
    height: 100%;
    background-color: transparent;
    display: flex;
    align-items: center;
    height: 100%;
    width: 100%;
    border-radius: 6px;
    text-decoration: none;
    transition: var(--tran-03);
}

.sidebar li a:hover {
    background-color: rgb(163, 217, 225, 0.6)
}

.sidebar li .submenu_item:hover {
    background-color: #98EECC;
}

.sidebar li a:hover .icon,
.sidebar li a:hover .text {
    color: var(--sidebar-color);
}

body.dark .sidebar li a:hover .icon,
body.dark .sidebar li a:hover .text {
    color: var(--text-color);
}

.menu-bar::-webkit-scrollbar {
    display: none;
}

.mode .sun-moon i {
    position: absolute;
}

.mode .sun-moon i.sun {
    opacity: 0;
}

body.dark .mode .sun-moon i.sun {
    opacity: 1;
}

body.dark .mode .sun-moon i.moon {
    opacity: 0;
}

.switch::before {
    content: '';
    position: absolute;
    height: 15px;
    width: 15px;
    border-radius: 50%;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    background-color: var(--sidebar-color);
    transition: var(--tran-04);
}

body.dark .switch::before {
    left: 20px;
}

.list-menu {
    background-color: var(--white-color);
    /* width: 260px; */
    /* position: fixed; */
    top: 0;
    left: 0;
    height: 100%;
    padding: 5px 20px;
    z-index: 100;
    overflow-y: scroll;
    box-shadow: 0 0 1px var(--grey-color-light);
    transition: all 0.5s ease;
    user-select: none;
}

.list-menu.close {
    padding: 60px 0;
    width: 80px;
}

.list-menu::-webkit-scrollbar {
    display: none;
}

.menu_content {
    position: relative;
}

.menu_dahsboard::before {
    content: "Dashboard";
}

.menu_editor::before {
    content: "Editor";
}

.menu_setting::before {
    content: "Setting";
}

.menu_items {
    padding: 0;
    list-style: none;
}

.navlink_icon {
    position: relative;
    font-size: 25px;
    min-width: 50px;
    line-height: 40px;
    display: inline-block;
    /* text-align: center; */
    border-radius: 6px;
}

.navlink_icon::before {
    content: "";
    position: absolute;
    height: 100%;
    width: calc(100% + 100px);
    left: -20px;
}

.navlink_icon:hover {
    background: var(--blue-color);

}

.list-menu .menu_content ul li div span:hover {
    /* background-color: red; */
    color: var(--white-color);
    background: var(--blue-color);

}

.list-menu .nav_link {
    display: flex !important;
    align-items: center;
    width: 100%;
    /* padding: 10px 45px; */
    border-radius: 8px;
    text-decoration: none;
    color: var(--text-color);
    /* white-space: nowrap; */
}

.list-menu.close .navlink {
    display: none;
}

.nav_link:hover {
    color: var(--white-color);
    background: var(--blue-color);
}

.list-menu.close .nav_link:hover {
    background: var(--white-color);
}

.submenu_item {
    cursor: pointer;
    font-weight: bold;
    font-size: 1.1rem;
}

.submenu {
    /* display: none;    */
    border-left: 2px solid #45CFDD !important;
    overflow: hidden;
    height: 0;
    opacity: 0;
    transition: height 0ms 400ms, opacity 400ms 0ms;
}


/* .submenu.show{
    opacity: 1;
} */

.submenu_item .arrow-left {
    position: absolute;
    right: 10px;
    display: inline-block;
    margin-right: auto;
}

.list-menu.close .submenu {
    display: none;
}

.show_submenu~.submenu {
    height: auto;
    opacity: 1;
    transition: height 0ms 0ms, opacity 600ms 0ms;
}

.show_submenu .arrow-left {
    transform: rotate(90deg);
}

.submenu .sublink {
    padding: 7px 0px 7px 16px;
    display: block;
    font-size: 1rem;
}

.bottom_content {
    position: fixed;
    bottom: 60px;
    left: 0;
    width: 260px;
    cursor: pointer;
    transition: all 0.5s ease;
}

.bottom {
    position: absolute;
    display: flex;
    align-items: center;
    left: 0;
    justify-content: space-around;
    padding: 18px 0;
    text-align: center;
    width: 100%;
    color: var(--grey-color);
    border-top: 1px solid var(--grey-color-light);
    background-color: var(--white-color);
}

.bottom i {
    font-size: 20px;
}

.bottom span {
    font-size: 18px;
}

.list-menu.close .bottom_content {
    width: 50px;
    left: 15px;
}

.list-menu.close .bottom span {
    display: none;
}

.list-menu.hoverable .collapse_sidebars {
    display: none;
}

.menu-title-sidebar {
    color: var(--title-menu-color);
    user-select: none;
    text-decoration: underline;
    overflow: hidden;
    height: 0;
    opacity: 0;
    transition: height 46ms 400ms, opacity 400ms 17ms;
}

.item .navlink_icon .icon {
    padding-right: 1rem;
}


.show-titles {
    height: auto;
    opacity: 1;
    transition: height 15ms 18ms, opacity 641ms 24ms;
}

.icon-submenu {
    padding-right: 1rem;
}

.hover-icon-mainMenu:hover {
    color: #8290B3;
}

.hover-icon-subMenu:hover {
    color: #45CFDD;
}
div.down{
    color: chocolate;
}
/* sidebars */

@media screen and (max-width: 768px) {
    .sidebars.close {
        left: -100%;
    }

    .sidebars.close .bottom_content {
        left: -100%;
    }
}
</style>