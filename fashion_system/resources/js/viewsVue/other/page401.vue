<template>
        <section id="page-401">
        <div id="bg-page-401">
            <div class="content-page-401">
                <h1>KHÔNG CÓ QUYỀN</h1>
            </div>
            <div class="button-home-401">
                <button>HOME</button>
            </div>
        </div>
    </section>
</template>
    
<script>
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
#page-401 {
    width: 100%;
    height: 100vh;
    background-color: #fff;
    text-align: center;
    position: absolute;
    ;
}

#bg-page-401 {
    background-image: url(bg_401.svg);
    /* background-size: cover; */
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

.button-home-401 button:focus {
    background-color: #0edf12de;
    color: black;
}

.button-home-401 button:hover {
    background-color: #0edf12de;
    color: black;
}
</style>