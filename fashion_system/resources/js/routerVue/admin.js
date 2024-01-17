import checkPermission from '@/js/auth/middleware.js'
const home = [{
    path: '/',
    name: 'home_default',
    components: {
        auth: () =>
            import ('../viewsVue/admin/authentication/login.vue'),
    },
}];
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
            meta: { breadcrumb: 'Home' },
            component: () =>
                import ('../viewsVue/admin/home/homeAdmin.vue'),
        },
        {
            path: "profile",
            name: "staffProfile",
            meta: { breadcrumb: 'Hồ sơ' },
            component: () =>
                import ('../viewsVue/admin/menuStaff/staffProfile.vue'),
        },
        {
            path: "support",
            name: "supportForEmployees",
            meta: { breadcrumb: 'Hỗ trợ' },
            component: () =>
                import ('../viewsVue/admin/menuStaff/supportForEmployees.vue'),
        },
        {
            path: "feedback",
            name: "employeeFeedback",
            meta: { breadcrumb: 'Phản hồi' },
            component: () =>
                import ('../viewsVue/admin/menuStaff/employeeFeedback.vue'),
        },
        {
            path: "admin-manage",
            name: "adminManage",
            meta: { roles: ['ADMIN', 'SUPERADMIN'] },
            beforeEnter: checkPermission,
            exact: true,
            group: 'true',
            children: [{
                path: "account-management",
                name: "accountManagement",
                meta: { breadcrumb: 'Quản lí tài khoản' },
                component: () =>
                    import ('../viewsVue/admin/systemManagement/accountManagement/main.vue'),
                children: [{
                    path: "detail-staf",
                    name: "detailStaff",
                    meta: { breadcrumb: 'Chi tiết nhân viên' },
                    props: true,
                    component: () =>
                        import ('../viewsVue/admin/systemManagement/accountManagement/pageDetailStaff.vue'),
                }, ],
            }, ],
        },
        {
            path: "admin-feedback",
            name: "adminFeedback",
            meta: { roles: ['FEEDBACK'] },
            beforeEnter: checkPermission,
            group: true,
            children: [{
                    path: "feedback-app",
                    name: "feedbackApp",
                    meta: { breadcrumb: 'Phản hồi APP' },
                    component: () =>
                        import ('../viewsVue/admin/feedback/feedbackApp.vue'),
                },
                {
                    path: "manage-feedback",
                    name: "manageFeedback",
                    meta: { breadcrumb: 'Quản lý' },
                    component: () =>
                        import ('../viewsVue/admin/feedback/settingFeedback.vue'),
                },
            ],
        },
        {
            path: "web",
            name: "web",
            meta: { roles: ['ADMIN', 'SUPERADMIN'] },
            beforeEnter: checkPermission,
            group: true,
            children: [{
                path: "menu",
                name: "menu",
                meta: { breadcrumb: 'Menu' },
                component: () =>
                    import ('../viewsVue/admin/web/menu.vue'),
            }, ],
        },
    ],
}]


export default { admin, home };