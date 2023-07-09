<template>
    <button id="back-to-top" :class="{show:btnOnTopVisible}"  @click="scrollToTop"><font-awesome-icon icon="fa-solid fa-chevron-up" style="color: #1a71ff;" /></button>
</template>
  
<script>
// import CircleMenu from 'vue-circle-menu';
export default {
    components: {
        // CircleMenu,
    },
    data() {
        return {
            btnOnTopVisible: true,
        };
    },
    created() {
        // Logic khi component được khởi tạo
    },
    mounted() {
        window.addEventListener('scroll', this.scrollHandler);
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() {

    },
    destroyed() {

    },
    methods: {
        scrollHandler() {
            if (window.pageYOffset > 300) {
                this.btnOnTopVisible = true;
            } else {
                this.btnOnTopVisible = false;
            }
        }
    },
    scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
};
</script>
  
<style>
/* CSS cho component */
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

/* #back-to-top::after {
    content: "\f077";
    font-family: FontAwesome;
    font-weight: normal;
    font-style: normal;
    font-size: 2em;
    line-height: 50px;
    color: #fff;
} */

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
</style>