export default [{
        showLabel: true,
        path: '',
        code: 'HOME',
        title: 'Home',
        component: '',
        icon: 'fa-solid fa-house',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'ADMIN-MANAGER',
        title: 'Admin hệ thống',
        component: '',
        icon: 'fa-solid fa-list-check',
        role: '',
        router: '',
        children: [{
                path: '',
                code: 'ACCOUNT_MANAGEMENT',
                title: 'Quản lý tài khoản',
                component: '',
                icon: 'fa-solid fa-user-secret',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'STAFF_MANAGEMENT',
                title: 'Quản lý nhân viên',
                component: '',
                icon: 'fa-solid fa-person-rays',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'SETTINGS-ADMIN',
                title: 'Cấu hình quản trị',
                component: '',
                icon: 'fa-solid fa-gears',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'SETTINGS-CLIENT',
                title: 'Cấu hình giao diện bán hàng',
                component: '',
                icon: 'fa-solid fa-mountain-sun',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'SETTINGS-PROCEDURE',
                title: 'Thủ tục (pending)',
                component: '',
                icon: 'fa-solid fa-forward-step',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'SERVICE-ADMINISTRATOR',
                title: 'Dịch vụ',
                component: '',
                icon: 'fa-solid fa-boxes-stacked',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'HISTORY',
                title: 'LỊCH SỬ',
                component: '',
                icon: 'fa-solid fa-file-waveform',
                role: '',
                router: '',
            },
        ]
    },
    {
        path: '',
        code: 'PRODUCT-MANAGERS',
        title: 'SẢN PHẨM',
        component: '',
        icon: 'fa-brands fa-cotton-bureau',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'BRANCHES-MANAGERS',
        title: 'CHI NHÁNH',
        component: '',
        icon: 'fa-solid fa-code-branch',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'DELIVERY-MANAGERS',
        title: 'VẬN CHUYỂN',
        component: '',
        icon: 'fa-solid fa-truck-ramp-box',
        role: '',
        router: '',
        children: [{
                path: '',
                code: 'DELIVERY-ORDER',
                title: 'ĐƠN HÀNG',
                component: '',
                icon: 'fa-solid fa-box-open',
                role: '',
                router: '',
            },
            {
                path: '',
                code: ' COOPERATION-UNIT-ORDER',
                title: 'ĐƠN VỊ HỢP TÁC',
                component: '',
                icon: 'fa-regular fa-handshake',
                role: '',
                router: '',
            }
        ]
    },
    {
        path: '',
        code: 'ORDER-TRACKING',
        title: 'Theo dõi, quản lý đơn',
        component: '',
        icon: 'fa-solid fa-clipboard-list',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'CUSTUMER-MANAGER',
        title: 'KHÁCH HÀNG',
        component: '',
        icon: 'fa-solid fa-id-card',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'WAREHOUSE-MANAGER',
        title: 'KHO',
        component: '',
        icon: 'fa-solid fa-warehouse',
        role: '',
        router: '',
        children: []
    },
    {
        path: '',
        code: 'WEB-CLIENT',
        title: 'WEB',
        component: '',
        icon: 'fa-brands fa-shopify',
        role: '',
        router: '',
        children: [{
                path: '',
                code: 'NEWS',
                title: 'Tin tức',
                component: '',
                icon: 'fa-regular fa-newspaper',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'ADS',
                title: 'Quản cáo',
                component: '',
                icon: 'fa-brands fa-adn',
                role: '',
                router: '',
            },
            {
                path: '',
                code: 'GIFT',
                title: 'MÃ GIẢM GIÁ',
                component: '',
                icon: 'fa-solid fa-gift',
                role: '',
                router: '',
            },
        ]
    },
    {
        path: '',
        code: 'REPORTS',
        title: 'BÁO CÁO',
        component: '',
        icon: 'fa-solid fa-chart-line',
        role: '',
        router: '',
        children: []
    },
]