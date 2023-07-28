const admin = [{
    path: '/admin',
    name: 'admin',
    components: {
        header: () =>
            import ('../layout/admin/header.vue'),
        sidebar: () =>
            import ('../layout/admin/sidebarMenu.vue'),
        footer: () =>
            import ('../layout/admin/footer.vue'),
    },
    children: [{
        path: "home",
        name: "home",
        component: () =>
            import ('../viewsVue/admin/home/homeAdmin.vue'),
    }]
}]

export default { admin };