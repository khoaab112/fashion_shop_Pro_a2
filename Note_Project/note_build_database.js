// Xây dựng database cho hệ thống
// thuật ngữ từ sql => nosql
//table =>connection  // column ->  fields // row ->documents
Ref: users.country_code > countries.code
    // Thuộc tính country_code của bảng users là khóa ngoại tham chiếu tới thuộc tính code của bảng countries.

// > many-to-one; < one-to-many; - one-to-one. , many-to-many

// Dùng ký hiệu > để tạo liên kết nhiều tới 1.
// Dùng ký hiệu < để tạo liên kết 1 tới nhiều.
// Dùng ký hiệu - để tạo liên kết 1 - 1
// ><
//khách hàng
// Danh sách khách hàng
//khách hàng
// Danh sách khách hàng
Table customers {
    id int[pk, increment]
    rank_id integer[ref: > rank.id]
    name varchar[50]
    address varchar[20][not null]
    phone_number varchar[20][unique]
    age integer
    sex boolean
    accumulated_points int
    favorite_product varchar[50]
    number_ban integer
    potential boolean
    discount_code_id varchar[20]
    created_at timestamp
    updated_at timestamp
}

Table account_customers {
    id int[pk, increment]
    link_service varchar[20][ref: < account_service.id]
    user varchar[20]
    password varchar[20]
    status boolean
    created_at timestamp
    updated_at timestamp

}
Ref: customers.phone_number - account_customers.user

Table account_service {
    id int[pk, increment]
    service_id int[ref: -service.id]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//tên các dịch vụ
Table service {
    id int[pk, increment]
    service_name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//tổng số tiền khách đã chi ra
//ds sản phẩm
Table total_payments {
    id int[pk, increment]
    customers_id varchar[20][unique, ref: -customers.id]
    total_money bigserial
    save_money serial
    products varchar[50]
    created_at timestamp
    updated_at timestamp
}
//Hoa donw
//ds nhân viên, ds kh, ds sp, ds code , ds chi nhánh, phuong thức thanh toán,phương thức nhận hành

Table bill {
    id int[pk, increment]
    code_bill varchar[50]
    staff_id int[ref: > staff.id]
    customers_id int[ref: > customers.id]
    branch_id int[ref: -branch.id]
    payment_methods_id varchar[20][ref: > payment_methods.id]
        //lưu giá trị là các mảng của method id
    shipping_method_id int[ref: > shipping_method.id]
        //nếu có chuyển khoản
    online_payment varchar[20][ref: < > online_payment_services.id]
    list_products varchar
    product_number smallserial
    initial_amount serial
    actual_amount serial
    giftcode varchar
    successful_payment boolean
    note varchar[200]
    status boolean
    impact int
    report_ship boolean
    queue_bill boolean
    note_report varchar[500]
    created_at timestamp
    updated_at timestamp
    //mã nhân viên chỉnh sửa nếu có
}
//chi nhánh
Table branch {
    id int[pk, increment]
    name varchar[50]
    address varchar[50]
    hotline varchar[20]
    manage varchar[50]
    working_time varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//phương thức thanh toán
Table payment_methods {
    id int[pk, increment]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//phương thức nhận hàng / vận chuyển / nhận tại cửa hàng
Table shipping_method {
    id int[pk, increment]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//************************
// về quản lý giao diện người dùng
Table menu_main {
    id int[pk, increment]
    name varchar[20]
    color varchar[20]
    is_sub_menu boolean
    status boolean
    created_at timestamp
    updated_at timestam
}
table rank {
    id int[pk, increment]
    name varchar[20]
    detail varchar[200]
    icon varchar[50]
    status boolean
    created_at timestamp
    updated_at timestam
}
//sub menu với sub bằng 0 thì là sub cha // sub=1 thì là sub con
Table sub_menu {
    id int[pk, increment]
    menu_main_id int[ref: > menu_main.id]
    name varchar[20]
    color varchar[20]
    status boolean
    sub boolean
    created_at timestamp
    updated_at timestam
}
Table footer {
    id int[pk, increment]
    intro boolean
    from boolean
    logo boolean
    news boolean
    branch boolean
    created_at timestamp
    updated_at timestam
}
Table slideshow_ads {
    id int[pk, increment]
    name varchar[20]
    url varchar[200]
    private_post varchar[20]
    type smallserial
    status boolean
    created_at timestamp
    updated_at timestamp
}


// *****************
//  trang quản lý
Table administration {
    id int[pk, increment]
    name varchar[20]
    status boolean
    authority varchar[20]
        //danh sách các quyền được sử dụng
    created_at timestamp
    updated_at timestam
}
//chức vụ
table position {
    id int[pk, increment]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//ds nhân viên
table staff {
    id int[pk, increment]
    code_staff varchar[50]
    position_id integer[ref: > position.id]
    admin_id int[ref: > administration.id]
    branch_id int[ref: > branch.id]
    approval_process_id varchar[20][ref: < > approval_process.id]
        //chức danh duyệt quy trình
    name varchar[50]
    address varchar[20][not null]
    phone_number varchar[20][unique]
    age integer
    sex boolean
    img varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table online_payment_services {
    id int[pk, increment]
    name varchar[20]
    logo varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//bảng product lưu các mảng 
table products {
    id int[pk, increment]
    sub_menu_id int[ref: > sub_menu.id]
    code_products varchar[50]
    name varchar[50]
    img_main varchar[50]
    origin varchar[50]
    color varchar[50]
    size varchar[50]
    amount varchar[50]
    policy varchar[50]
    quantity int
    vote float
    intro varchar[500]
    sold_out int
    status boolean
    created_at timestamp
    updated_at timestamp
}
Table img_products {
    id int[pk, increment]
    product_id int[ref: > products.id]
    img varchar[50]
    name varchar[50]
    order int
    status boolean
    created_at timestamp
    updated_at timestamp
}
Table comments_product {
    id int[pk, increment]
    product_id int[ref: > products.id]
    customers_id int[ref: > customers.id]
    comments_product_id int[ref: > comments_product.id]
    vote int
    comment varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
Table comments_news {
    id int[pk, increment]
    news_id int[ref: > news.id]
    customers_id int[ref: > customers.id]
    comment_id int[ref: > comments_news.id]
    comment varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table img_news {
    id int[pk, increment]
    news_id int[ref: > news.id]
    name varchar[50]
    img varchar[50]
    order int
    status boolean
    created_at timestamp
    updated_at timestamp
}
//chính sách đổi trả
table policy {
    id int[pk, increment]
    name varchar[50]
    img varchar[50]
    content varchar[500]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table news {
    id int[pk, increment]
    sub_menu_id int[ref: > sub_menu.id]
    staff_id int[ref: > staff.id]
    name varchar[200]
    img_main varchar[50]
    content varchar[1000]
    tag varchar[100]
    views int
    like int
    comment int
    status boolean
    created_at timestamp
    updated_at timestamp
}
table contact_support {
    id int[pk, increment]
    name varchar[50]
    logo varchar[50]
    link varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//quy trình duyệt 
table approval_process {
    id int[pk, increment]
    name varchar[50]
    logo varchar[50]
    order int
    account_used varchar[20][ref: < > administration.id]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//danh sách báo cáo
table reports {
    id int[pk, increment]
    customers_id int[ref: < > customers.id]
    staff_id int[ref: < > staff.id]
    sub_report int[ref: > reports.id]
    type_report_id varchar[20][ref: < > type_report.id]
    processed boolean
    report_source_id int[ref: -report_source.id]
    content varchar[500]
    feed_back_content varchar[500]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table type_report {
    id int[pk, increment]
    name varchar[50]
    note varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table report_source {
    id int[pk, increment]
    name varchar[50]
    note varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
//quản cáo
table type_ads {
    id int[pk, increment]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table ads {
    id int[pk, increment]
    staff_id int[ref: > staff.id]
    img varchar[50]
    content varchar[200]
    priority int
    sub_menu_id varchar[ref: > sub_menu.id]
    gift_id varchar[ref: > giftcode.id]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table giftcode {
    id int[pk, increment]
    staff_id int[ref: -staff.id]
    name varchar[50]
    content varchar[500]
    img varchar[50]
    discount varchar[50]
    start_time timestamp
    end_time timestamp
    number_of_participants int
    used int
    status boolean
    created_at timestamp
    updated_at timestamp
}
table log_login {
    id int[pk, increment]
    user varchar[50]
    type int
    content varchar[50]
    ip varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table log_policys {
    id int[pk, increment]
    name varchar[50]
    first_user_id int[ref: < > staff.id]
    end_user int[ref: < > staff.id]
    success boolean
    note varchar[200]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table type_update {
    id int[pk, increment]
    name varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table log_updates {
    id int[pk, increment]
    type_update int[ref: > type_update.id]
    user int
    internal boolean
    content varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}
table log_deletes {
    id int[pk, increment]
    type_update int[ref: > type_update.id]
    user int
    internal boolean
    content varchar[50]
    status boolean
    created_at timestamp
    updated_at timestamp
}