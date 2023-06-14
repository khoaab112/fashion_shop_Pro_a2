const admin = [{
    path: '/admin',
    name: 'admin',
    component: () =>
        import ('../layout/admin/sidebarMenu.vue'),
    children: [{
        path: "user",
        name: "admin-user",
        component: () =>
            import ('../viewsVue/admin/index.vue'),
    }]

}]
export default admin;