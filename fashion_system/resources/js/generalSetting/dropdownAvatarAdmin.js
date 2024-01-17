//map với file routerVue
//2 file có điểm tương đồng nhưng lười không cấu hình lại

export default [{
        'name': 'staffProfile',
        'title': 'Hồ sơ',
        'icon': 'fa-regular fa-user',
    },
    {
        'name': 'supportForEmployees',
        'title': 'Hỗ trợ',
        'icon': "fa-solid fa-circle-question"
    },
    {
        'name': 'employeeFeedback',
        'title': 'Đóng góp ý kiến',
        'icon': "fa-regular fa-paper-plane"
    },
    {
        'name': 'logout',
        'title': 'Đăng xuất',
        'icon': "fa-solid fa-arrow-right-from-bracket",
        'method': 'logoutAdmin',
    }
];