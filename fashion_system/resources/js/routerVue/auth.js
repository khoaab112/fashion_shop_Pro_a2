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
}];
// const authCustomer = [{
//     path: '/customer/auth',
//     children: [{
//             path: 'login',
//             name: 'login-customer',
//             components: {
//                 auth: () =>
//                     import ('../viewsVue/client/authentication/login.vue'),
//             },
//         },
//         {
//             path: 'forgotPassword',
//             name: 'forgotPassword-customer',
//             components: {
//                 auth: () =>
//                     import ('../viewsVue/client/authentication/forgotPassword.vue'),
//             },
//         },
//         {
//             path: 'register',
//             name: 'register-customer',
//             components: {
//                 auth: () =>
//                     import ('../viewsVue/client/authentication/register.vue'),
//             },
//         },
//     ]
// }];
export default {
    authAdmin,
    // authCustomer
};