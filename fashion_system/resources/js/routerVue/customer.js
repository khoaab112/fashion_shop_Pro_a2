const home = [{
    path: '/',
    name: 'home',
    components: {
        home: () =>
            import ('../viewsVue/client/index.vue'),
    },
    children: [{
        path: "user",
        name: "home-user",
        component: () =>
            import ('../viewsVue/client/index.vue'),
    }]

}]
const test = [{
    path: '/test',
    name: 'test',
    components: {
        home: () =>
            import ('../viewsVue/admin/authentication/register.vue'),
    },
}];
export default { home, test };