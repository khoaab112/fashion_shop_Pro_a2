<template>
    <div class="">
        quan ly nhan vien
        <font-awesome-icon :icon="['fab', 'facebook']" />
        
    </div>
    <!-- <div>{{ examples }}</div> -->
    <span>{{ examples }}</span>
</template>

<script>
import Test from '@/js/api/admin/apiAdmin.js'
// import Test from '../../../js/api/admin/apiAdmin.js';
export default {
    name: 'appindex',
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
            Test.test().then(response => {
                console.log(55,response);
                   this.examples = response.data.content[0]
            })
                .catch(error => {
                    console.log(error);
                });
            //   UserService.getUser(1)
            //     .then(response => {
            //       this.user = response.data;
            //     })
            //     .catch(error => {
            //       console.log(error);
            //     });
        },
    }
};
</script>
<style></style>