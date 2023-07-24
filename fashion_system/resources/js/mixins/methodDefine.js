export default {
    methods: {
        goToPage(path) {
            console.log(path);
            this.$router.push(path);
        },
    },
};