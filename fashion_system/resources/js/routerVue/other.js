const error404 = [{
    path: '/:pathMatch(.*)*',
    components: {
        error: () =>
            import ('../viewsVue/other/page404.vue'),
    },
}];
const error500 = [{
    path: '/error500',
    components: {
        error: () =>
            import ('../viewsVue/other/page500.vue'),
    },
}];
export default {
    error404,
    error500,
};