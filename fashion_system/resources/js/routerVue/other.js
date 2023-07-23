const error404 = [{
    path: '/:pathMatch(.*)*',
    components: {
        error: () =>
            import ('../viewsVue/other/page404.vue'),
    },
}];


const error = [{
        path: '/error401',
        components: {
            error: () =>
                import ('../viewsVue/other/page401.vue'),
        },
    },
    {
        path: '/error403',
        components: {
            error: () =>
                import ('../viewsVue/other/page403.vue'),
        },
    },
    {
        path: '/error404',
        components: {
            error: () =>
                import ('../viewsVue/other/page404.vue'),
        },
    },
    {
        path: '/error500',
        components: {
            error: () =>
                import ('../viewsVue/other/page500.vue'),
        },
    },

]

export default {
    error,
    error404,
};