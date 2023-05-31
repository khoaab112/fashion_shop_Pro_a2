const custom = [{
    path: '/',
    name: 'home',
    component: () =>
        import ('../Home.vue'),
    children: [{
        path: "user",
        name: "admin-user",
        component: () =>
            import ('../viewsVue/admin/index.vue'),
    }]

}]

// const custom = [{
//     path: '/',
//     component: () =>
//         import ('../Home.vue'),
// }];
export default custom;