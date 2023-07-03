<template>


</template>
  
<script>
import CircleMenu from 'vue-circle-menu';
export default {
    components: {
        CircleMenu,
    },
    data() {
        return {
            // Dữ liệu của component
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
    updated() {

    },
    destroyed() {

    },
    methods: {
        // Các phương thức xử lý sự kiện hoặc logic khác
    },
};
</script>
  
<style>
/* CSS cho component */
#back-to-top {
    display: inline-block;
    color: #10da32;
    width: 50px;
    height: 50px;
    text-align: center;
    font-size: 16px;
    /* border-radius: 4px; */
    position: fixed;
    bottom: 80px;
    right: 45px;
    transition: background-color .3s, opacity .5s, visibility .5s;
    opacity: 0;
    visibility: hidden;
    z-index: 1000;
    border: none !important;
}


#back-to-top:hover {
    cursor: pointer;
    color: #9BCDD2;
}

#back-to-top:active {
    color: #A2CDB0;
}

#back-to-top:after {
    content: "";
    background: #90EE90;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px !important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

#back-to-top:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}

#back-to-top.show {
    opacity: 1;
    visibility: visible;
}

.show-titles {
    height: auto;
    opacity: 1;
    transition: height 15ms 18ms, opacity 641ms 24ms;
}</style>