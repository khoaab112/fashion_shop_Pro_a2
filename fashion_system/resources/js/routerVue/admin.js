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
        },
        {
            path: "profile",
            name: "staffProfile",
            component: () =>
                import ('../viewsVue/admin/menuStaff/staffProfile.vue'),
        },
        {
            path: "support",
            name: "supportForEmployees",
            component: () =>
                import ('../viewsVue/admin/menuStaff/supportForEmployees.vue'),
        },
        {
            path: "feedback",
            name: "employeeFeedback",
            component: () =>
                import ('../viewsVue/admin/menuStaff/employeeFeedback.vue'),
        }
    ],
}]


export default { admin };
