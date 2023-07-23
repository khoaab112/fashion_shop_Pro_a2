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

const auth = [{
    path: '/auth',
    children: [{
            path: 'login',
            name: 'login',
            components: {
                auth: () =>
                    import ('../viewsVue/admin/authentication/login.vue'),
            },
        },
        {
            path: 'forgotPassword',
            name: 'forgotPassword',
            components: {
                auth: () =>
                    import ('../viewsVue/admin/authentication/forgotPassword.vue'),
            },
        },
        {
            path: 'register',
            name: 'register',
            components: {
                auth: () =>
                    import ('../viewsVue/admin/authentication/register.vue'),
            },
        },
    ]
}]

export default { admin, auth };