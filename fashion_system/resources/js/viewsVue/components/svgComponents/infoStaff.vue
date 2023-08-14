<template>
    <section>
        <svg role="img" width="476" height="124" aria-labelledby="loading-aria" viewBox="0 0 476 124"
            preserveAspectRatio="none">
            <title id="loading-aria">Loading...</title>
            <rect x="0" y="0" width="100%" height="100%" clip-path="url(#clip-path)" style='fill: url("#fill");'></rect>
            <defs>
                <clipPath id="clip-path">
                    <rect x="1" y="9" rx="3" ry="3" width="275" height="30" />
                    <rect x="498" y="158" rx="3" ry="3" width="52" height="6" />
                    <rect x="1" y="70" rx="3" ry="3" width="211" height="12" />
                    <rect x="2" y="49" rx="3" ry="3" width="211" height="12" />
                </clipPath>
                <linearGradient id="fill">
                    <stop offset="0.599964" stop-color="#f3f3f3" stop-opacity="1">
                        <animate attributeName="offset" values="-2; -2; 1" keyTimes="0; 0.25; 1" dur="2s"
                            repeatCount="indefinite"></animate>
                    </stop>
                    <stop offset="1.59996" stop-color="#ecebeb" stop-opacity="1">
                        <animate attributeName="offset" values="-1; -1; 2" keyTimes="0; 0.25; 1" dur="2s"
                            repeatCount="indefinite"></animate>
                    </stop>
                    <stop offset="2.59996" stop-color="#f3f3f3" stop-opacity="1">
                        <animate attributeName="offset" values="0; 0; 3" keyTimes="0; 0.25; 1" dur="2s"
                            repeatCount="indefinite"></animate>
                    </stop>
                </linearGradient>
            </defs>
        </svg>
    </section>
</template>

<script>
export default {
    name: 'infoStaff',
    components: {
    },
    setup() {
    },
    directives: {
    },
    data() {
        return {

        };
    },
    created() {

    },
    mounted() {

    },
    computed() {

    },
    updated() {

    },
    destroyed() {

    },
    methods: {

    },
};
</script>

<style>

</style>
