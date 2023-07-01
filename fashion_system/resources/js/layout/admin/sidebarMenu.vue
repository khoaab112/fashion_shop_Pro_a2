<template>
    <nav :class="{ 'sidebar': true, 'close': !activeShowSidebar }">
        <header>
            <div class="image-text">
                <span class="image-logo-sidebar">
                    <img src="" alt="ssss">
                </span>

                <div class="text logo-text">
                    <span class="admin-name">TomTom</span>
                    <span class="profession">New Edge</span>
                </div>
            </div>
            <hr>

            <i class='bx bx-chevron-right toggle' id="toggle" @click=showSidebar></i>
        </header>
        <!--  -->
        <div class="list-menu ">
            <div class="menu_content ">
                <ul class="menu_items" v-for="value in dataMenuSidebar">
                    <!-- <div class="menu_title menu_dahsboard"></div> -->
                    <h3 :class="{ 'menu-title-sidebar': true, 'show-titles': activeShowSidebar }"
                        v-if="value.showLabel ? true : false">
                        Dashboard
                    </h3>
                    <li class="item">
                        <div href="#" class="nav_link submenu_item show_submenu">
                            <span class="navlink_icon"> 
                                <font-awesome-icon :icon="value.icon" />              
                            </span>
                            <span class="navlink">{{ value.title }}</span>
                            <i class="bx bx-chevron-right arrow-left"></i>
                        </div>
                        <ul class="menu_items submenu" v-if="value.children.length">                                        
                            <a href="#" class="nav_link sublink" v-for="item in value.children"><font-awesome-icon :icon="item.icon" />  {{ item.title }}</a>
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
export default {
    data() {
        return {
            activeShowSidebar: false,
            dataMenuSidebar: dataSidebar,
            // dataSidebar: dataSidebar
            // Dữ liệu của component
        };
    },
    created() {
        console.log(dataSidebar);
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
            if (this.activeShowSidebar) this.activeShowSidebar = false;
            else this.activeShowSidebar = true;
        }
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
.sidebar .icon {
    min-width: 60px;
    border-radius: 6px;
}

.sidebar .icon {
    min-width: 60px;
    border-radius: 6px;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.sidebar .text,
.sidebar .icon {
    color: var(--text-color);
    transition: var(--tran-03);
}

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
}

.sidebar header .logo-text {
    display: flex;
    flex-direction: column;
    padding-bottom: 10px;
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
    background-color: var(--primary-color);
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

.sidebar.close~.home {
    left: 78px;
    height: 100vh;
    width: calc(100% - 78px);
}

body.dark .home .text {
    color: var(--text-color);
}


/*  */

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
    font-size: 22px;
    min-width: 50px;
    line-height: 40px;
    display: inline-block;
    text-align: center;
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
    display: grid;
    align-items: center;
    width: 100%;
    padding: 10px 45px;
    border-radius: 8px;
    text-decoration: none;
    color: var(--text-color);
    white-space: nowrap;
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
    font-size: 1rem;
}

.submenu {
    /* display: none;    */
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
    padding: 7px 0px 7px 55px;
    display: block;
    font-size: 0.9em;
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


/* footer*/

#back-to-top {
    display: inline-block;
    color: red;
    background-color: #FAF0E4;
    width: 50px;
    height: 50px;
    text-align: center;
    border-radius: 4px;
    position: fixed;
    bottom: 80px;
    right: 45px;
    transition: background-color .3s, opacity .5s, visibility .5s;
    opacity: 0;
    visibility: hidden;
    z-index: 1000;
    border: none !important;
}

#back-to-top::after {
    content: "\f077";
    font-family: FontAwesome;
    font-weight: normal;
    font-style: normal;
    font-size: 2em;
    line-height: 50px;
    color: #fff;
}

#back-to-top:hover {
    cursor: pointer;
    background-color: #9BCDD2;
}

#back-to-top:active {
    background-color: #A2CDB0;
}

#back-to-top.show {
    opacity: 1;
    visibility: visible;
}

.show-titles {
    height: auto;
    opacity: 1;
    transition: height 15ms 18ms, opacity 641ms 24ms;
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