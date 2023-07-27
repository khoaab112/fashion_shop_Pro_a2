<template>
    <div class="">
        quan ly nhan vien
        <font-awesome-icon :icon="['fab', 'facebook']" />
    </div>
    <button @click="test()">logout</button>
</template>

<script>
import API from '@/js/api/admin/apiAdmin.js'
// import Test from '../../../js/api/admin/apiAdmin.js';
export default {
    name: 'appindex',
    components: {
    },
    data() {
        return {
            examples: '',
        }
    },
    created() {
    },
    mounted() {
    },
    methods: {
        test() {
            API.logout().then(res => {
                console.log(res);
            }).catch(error => {
                console.log(222, error);
            });
        },
    }
};
</script>

<style scoped></style>