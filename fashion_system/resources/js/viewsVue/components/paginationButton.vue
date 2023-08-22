<template>
    <section>
        <div class="row mb-5">
            <div class="col-md-12">
                <div class="block-27">
                    <ul>
                        <li><button class="page-jump"><font-awesome-icon icon="fa-solid fa-angles-left" /></button></li>
                        <li><button class="page-jump"><font-awesome-icon icon="fa-solid fa-angle-left" /></button></li>
                        <li class="active"><button>1</button></li>
                        <li><button >2</button></li>
                        <li><button ><font-awesome-icon icon="fa-solid fa-ellipsis" /></button></li>
                        <li><button >5</button></li>
                        <li><button >5</button></li>
                        <li><button class="page-jump"><font-awesome-icon icon="fa-solid fa-angle-right" /></button></li>
                        <li><button class="page-jump"><font-awesome-icon icon="fa-solid fa-angles-right" /></button></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'paginationButton',
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

<style scoped>
.heading-section {
    font-size: 32px;
}

.heading-section small {
    font-size: 16px;
}

.block-27 ul {
    padding: 0;
    margin: 0;
}

.block-27 ul li {
    display: inline-block;
    margin-bottom: 4px;
    font-weight: 400;
}
.block-27 ul li:hover button {
    background: #28a745;
    color: white;
}
.block-27 ul li button,
.block-27 ul li span {
    color: gray;
    text-align: center;
    display: inline-block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 50%;
    border: 1px solid #e6e6e6;
}

.block-27 ul li.active button,
.block-27 ul li.active span {
    background: #7cb9e8;
    color: #fff;
    border: 1px solid transparent;
}
.page-jump:hover{
    background: #778ba5 !important;
    color: white;
}
</style>
