const authAdmin = [{
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
export default { authAdmin };