<template>
    <img :src=src @error="imageError" class="rounded-circle shadow-4" alt="Avatar" />
</template>

<script>

export default {
    name: 'avatar',
    props: ['srcImg'],
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            src: this.srcImg
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
        imageError() {
            this.$emit('image-error', true);
        },
    },
};
</script>

<style scoped>
img{
    width: 150px !important;
    height: 150px !important;
}
</style>
