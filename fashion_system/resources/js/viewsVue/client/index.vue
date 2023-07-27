<template>
    <div class="">
        quan ly nhan vien
        <font-awesome-icon :icon="['fab', 'facebook']" />        
    </div>
    <dropdown-avatar></dropdown-avatar>
    <span>{{ examples }}</span>
</template>

<script>
import Test from '@/js/api/admin/apiAdmin.js'
import LoadingInfinity from '../components/LoadingInfinity.vue';
import loadingSpinner from '../components/loadingSpinner.vue';
import dropdownAvatar from '../components/dropdownAvatar.vue';
// import Test from '../../../js/api/admin/apiAdmin.js';
export default {
    name: 'appindex',
    components: {
        LoadingInfinity,
        loadingSpinner,
        dropdownAvatar,
  },
    data() {
        return {
            examples: '',
        }
    },
    created() {
        this.fetchUser();
    },
    mounted() {
        this.fetchUser();
    },
    methods: {
        fetchUser() {
   
        },
    }
};
</script>

<style scoped>
</style>