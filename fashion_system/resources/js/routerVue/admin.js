const admin = [{
    path: '/admin',
    name: 'admin',
    components: {
        // default: () =>
        //     import ('../layout/admin/sidebarMenu.vue'),
        header: () =>
            import ('../layout/admin/header.vue'),
        sidebar: () =>
            import ('../layout/admin/sidebarMenu.vue'),
        footer: () =>
            import ('../layout/admin/footer.vue'),
    },
    children: [{
        path: "user",
        name: "admin-user",
        component: () =>
            import ('../viewsVue/admin/index.vue'),
    }]
}]

export default admin;