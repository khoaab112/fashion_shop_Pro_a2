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