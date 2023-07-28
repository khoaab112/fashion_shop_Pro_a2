const home = [{
    path: '/',
    name: 'homeClient',
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

const auth = [{
    path: '/customer/auth',
    children: [{
            path: 'login',
            name: 'login-customer',
            components: {
                auth: () =>
                    import ('../viewsVue/client/authentication/login.vue'),
            },
        },
        {
            path: 'forgotPassword',
            name: 'forgotPassword-customer',
            components: {
                auth: () =>
                    import ('../viewsVue/client/authentication/forgotPassword.vue'),
            },
        },
        {
            path: 'register',
            name: 'register-customer',
            components: {
                auth: () =>
                    import ('../viewsVue/client/authentication/register.vue'),
            },
        },
    ]
}]
const test = [{
    path: '/test',
    name: 'test',
    components: {
        home: () =>
            import ('../viewsVue/admin/authentication/forgotPassword.vue'),
    },
}];
export default { home, test, auth };