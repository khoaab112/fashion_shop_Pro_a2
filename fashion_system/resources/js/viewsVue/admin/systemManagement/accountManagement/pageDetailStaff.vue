<template>
    <div class="row">
        <div class="col-4">
            <section>
                <avatar :src="urlAvatar" class="avatar-staff">
                </avatar>
                avatar ,tuổi , tên , giới tính
            </section>
        </div>
        <div class="col-8">
            <section>
                thôg tin cơ bản nhân viên
            </section>
        </div>
    </div>
</template>

<script>
import avatar from '../../../components/avatar.vue';
export default {
    name: "detailStaff",
    components: {
        avatar
    },
    //   props: ['dataa'],
    setup() { },
    directives: {},
    data() {
        return {
            dataStaff: null,
            urlAvatar: null,

        };
    },
    created() {
        this.dataStaff = JSON.parse(this.$route.query.child);
        console.log(this.dataStaff);
this.checkImageAdmin(this.dataStaff.img)
        // Logic khi component được khởi tạo
    },
    mounted() {
    },
    computed() {
        // được sử dụng để định nghĩa các thuộc tính tính toán
    },
    updated() { },
    destroyed() { },
    methods: {
        checkImageAdmin(img) {

            try {
                if (img) {
                    const publicPath = window.location.origin + '/public';
                    const imagePath = `data_client/${img}`;
                    // const urlImage = new URL(imagePath, publicPath).href
                    this.urlAvatar = new URL(imagePath, publicPath).href;
                    return
                }
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href
                return
            } catch (e) {
                this.urlAvatar = new URL(avatarAdminDefault, import.meta.url).href
                return
            }
        },
    },
};
</script>

<style></style>
