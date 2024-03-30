<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReportSourceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('report_source')->insert(
            [
                [
                    'name' => "Người dùng hệ thống admin",
                    'note' => "null",
                    'status' => true,
                ],
                [
                    'name' => "Hệ thống zalo",
                    'note' => "null",
                    'status' => true,
                ],
            ]
        );
    }
}
