<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
class PositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('position')->insert(
            [
                [
                    'name' => "ADMIN",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Nhân viên",
                    'content' => "nhân viên",
                    'status' => true,
                ],
                [
                    'name' => "Giám đốc",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Quản lý tổng",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Quản lý chi nhánh",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Quản lý nhân viên",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Nhân viên bán hàng",
                    'content' => "admin",
                    'status' => true,
                ],
                [
                    'name' => "Nhân viên kho",
                    'content' => "admin",
                    'status' => true,
                ],
            ]
        );
    }
}
