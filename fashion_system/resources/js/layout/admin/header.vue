<template>
    <section class="home">

        <div class="header-admin d-flex justify-content-end">
            <div id="breadcrumb">
                <el-breadcrumb separator-class="el-icon-arrow-right">
                    <div>
                        <el-breadcrumb-item :to="{ path: '/admin/home' }">HOME</el-breadcrumb-item>
                        <el-breadcrumb-item v-for="value in  breadcrumb "
                            :class="{ 'show-breadcrumb': Object.keys(value.meta).length <= 0 || value.path == '/admin/home' || value.path == '/admin' }"
                            :to="{ path: value.path }">{{ value.meta.breadcrumb }}</el-breadcrumb-item>
                    </div>
                </el-breadcrumb>
            </div>
            <div class="">
                <button type="button" class="btn-set btn-header-admin"><font-awesome-icon
                        icon="fa-solid fa-list-check" /></button>
                <button type="button" class="btn-bell btn-header-admin"><font-awesome-icon
                        icon="fa-regular fa-bell" /></button>
                <button type="button" class="btn-bell-signal btn-header-admin"><font-awesome-icon icon="fa-regular fa-bell"
                        beat-fade /></button>
            </div>
        </div>
        <main>
            <div id="content-admin">
                <div class="container-content bg-content">
                    <router-view></router-view>
                </div>
            </div>
        </main>
    </section>
</template>

<script>

export default {
    data() {
        return {
            circleUrl: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png',
            breadcrumb: null,
        };
    },
    created() {
        this.breadcrumb = this.$route.matched
    },
    watch: {
        '$route.matched'(value) {
            this.breadcrumb = value;
            console.log(this.breadcrumb);

        },
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
    },
};
</script>

<style scoped>
/* CSS cho component */
.btn-header-admin {
    border: none;
    font-size: 24px;
    float: right;
    background: none;
    margin-right: 2rem;
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
    ;
}

.btn-set {
    color: white;
    ;
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

@media (max-width:580px) {
    .container-content {
        width: 90%;
        margin: 0 auto;
    }

}
</style>
