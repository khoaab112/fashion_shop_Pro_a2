//map với file routerVue
//2 file có điểm tương đồng nhưng lười không cấu hình lại

export default [{
        'key': 'profile',
        'name': 'Hồ sơ',
        'path': '/admin/profile',
        component: '',
        'icon': 'fa-regular fa-user',
    },
    {
        'key': 'support',
        'name': 'Hỗ trợ',
        'path': '/admin/support',
        component: '',
        'icon': "fa-solid fa-circle-question"
    },
    {
        'key': 'feedback',
        'name': 'Đóng góp ý kiến',
        'path': '/admin/feedback',
        component: '',
        'icon': "fa-regular fa-paper-plane"
    },
    {
        'key': 'logout',
        'name': 'Đăng xuất',
        'path': '',
        component: '',
        'icon': "fa-solid fa-arrow-right-from-bracket",
        'method': 'logoutAdmin',
    }
];
