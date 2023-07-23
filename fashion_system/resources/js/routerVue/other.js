const error404 = [{
    path: '/:pathMatch(.*)*',
    name: 'page404',
    components: {
        error: () =>
            import ('../viewsVue/other/page404.vue'),
    },
}];

const error = [{
        path: '/error401',
        name: 'error401',
        components: {
            error: () =>
                import ('../viewsVue/other/page401.vue'),
        },
    },
    {
        path: '/error403',
        name: 'error403',
        components: {
            error: () =>
                import ('../viewsVue/other/page403.vue'),
        },
    },
    {
        path: '/error404',
        name: 'error404-children',
        components: {
            error: () =>
                import ('../viewsVue/other/page404.vue'),
        },
    },
    {
        path: '/error500',
        name: 'error500',
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