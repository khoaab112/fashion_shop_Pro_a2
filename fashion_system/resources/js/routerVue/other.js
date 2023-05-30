const error404 = [{
    path: '/:pathMatch(.*)*',
    component: () =>
        import ('../viewsVue/other/error404.vue'),
}];
const home = [{
    path: '/',
    component: () =>
        import ('../Home.vue'),
}];
export { error404, home };