<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TypeNotificationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('type_notification')->insert(
            [
                [
                    'name' => "Hệ thống",
                    'code' => "SYSTEM",
                    'color' => "ff0000",
                    'note' => "Hệ thống gửi thông báo lỗi dành cho người dùng",
                    'status' => true,
                ],
                [
                    'name' => "Thông báo",
                    'code' => "EVENT",
                    'color' => "F4E869",
                    'note' => "Thống gửi từ hệ thống cho người dùng về các sự kiện mà người quản lý chủ động gửi",
                    'status' => true,
                ],
                [
                    'name' => "Người dùng",
                    'code' => "CUSTOMER",
                    'color' => "3085C3",
                    'note' => "Thông báo từ người dùng , người dùng gửi thông báo đến người dùng",
                    'status' => true,
                ],
                [
                    'name' => "Cảnh báo",
                    'code' => "WARNING",
                    'color' => "E9B824",
                    'note' => "gửi cảnh báo cho người dùng",
                    'status' => true,
                ],
                [
                    'name' => "Gửi",
                    'code' => "SEND",
                    'color' => "28a745",
                    'note' => "gửi tin nhắn , phản hồi cho khách hàng thành công",
                    'status' => true,
                ],
                [
                    'name' => "Phản hồi",
                    'code' => "RESPONSE",
                    'color' => "6c757d",
                    'note' => "Phản hồi từ những ý kiễn phản hồi cho khách hàng",
                    'status' => true,
                ],
            ]
        );
    }
}
