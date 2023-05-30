const admin = [{
    path: '/admin',
    component: () =>
        import ('../layout/admin.vue'),
    children: [{
        path: "user",
        name: "admin-user",
        component: () =>
            import ('../viewsVue/admin/index.vue'),
    }]

}]
export default admin;