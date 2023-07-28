<template>
        <section id="page-401">
        <div id="bg-page-401" :style="`background-image: url(${background})`">
            <div class="content-page-401">
                <h1>KHÔNG ĐƯỢC CẤP QUYỀN</h1>
            </div>
            <div class="button-home-401">
               <router-link :to=pathHome class="style-tag-a"> <button>Home</button></router-link>
            </div>
        </div>
    </section>
</template>
    
<script>
import svgBG from '@/public/images/svg/page_401/bg_401.svg';
import paths from '@/js/mixins/getAddressFromRouter.js';

export default {
    name: 'page401',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            background :'',
            pathHome: paths.homeClient,
        };
    },
    created() {
        this.background=svgBG
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
    },
};
</script>
    
<style scoped>
#page-401 {
    width: 100%;
    height: 100vh;
    background-color: #fff;
    text-align: center;
    position: absolute;
    ;
}

#bg-page-401 {
    background-image: var(--svgBG);
    background-size: cover;
    background-size: 78%;
    background-repeat: no-repeat;
    width: 80%;
    height: 100%;
    margin: 0 auto;
    background-position: center;
}

.content-page-401 {
    position: absolute;
    right: 0;
    left: 0;
}

.content-page-401 h1 {
    font-weight: bold;
    margin-top: 5rem;
    /* right: 0;
    left: 0;
    bottom: 0; */
}

.button-home-401 {
    position: absolute;
    bottom: 0;
    right: 0;
    left: 0;
    margin-bottom: 5rem;
}

.button-home-401 button {
    background-color: rgb(7 137 216);
    width: 6rem;
    height: 4rem;
    border-radius: 15px;
    border: none;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
}

.button-home-401 button:active {
    background-color: #0edf12de;
    color: black;
}

.button-home-401 button:hover {
    background-color: #0edf12de;
    color: black;
}
a.style-tag-a{
    color: white;
}
</style>