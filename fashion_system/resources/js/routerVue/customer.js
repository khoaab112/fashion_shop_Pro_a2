const customer = [{
    path: '/',
    name: 'home',
    component: () =>
        import ('../layout/header.vue'),
    children: [{
        path: "user",
        name: "home-user",
        component: () =>
            import ('../viewsVue/client/index.vue'),
    }]

}]
export default customer;