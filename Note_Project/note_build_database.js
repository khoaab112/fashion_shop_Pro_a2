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