export default {
    methods: {
        goToPage(path) {
            this.$router.push(path);
        },
        checkStrangeCharacters(string) {
            var format = /[%^&*()+\=\[\]{};':"\\|,.<>\/?]+/;
            if (format.test(string)) {
                return true;
            } else {
                return false;
            }
        }
    },
};