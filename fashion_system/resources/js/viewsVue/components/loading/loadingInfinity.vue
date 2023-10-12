<template>
    <section id='loading-infinity'>
        <div class="svg-infinity" :style="{ 'background-image': 'url(' + svg + ')' }">
        </div>
    </section>
</template>

<script>
import sgvLoadingSpinner from "@/public/images/svg/loading/spinner.svg"
export default {
    name: 'Loading-spinner',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {
            svg: '',
        };
    },
    created() {
        this.svg = this.getImage(sgvLoadingSpinner);
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
        getImage(url) {
            return new URL(url, import.meta.url).href
        },
    },
};
</script>

<style scoped>
.svg-infinity {
    background-size: cover;
    background-size: contain;
    background-repeat: no-repeat;
    width: 5rem;
    height: 5rem;
}
</style>
