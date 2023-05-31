const error404 = [{
    path: '/:pathMatch(.*)*',
    component: () =>
        import ('../viewsVue/other/error404.vue'),
}];

export default error404;