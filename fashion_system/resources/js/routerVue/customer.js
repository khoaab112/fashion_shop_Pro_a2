const customer = [{
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
export default customer;