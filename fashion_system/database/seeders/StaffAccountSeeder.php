<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class StaffAccountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // remove all
        DB::table('staff_account')->truncate();
        $staff = DB::table('staff')->where('code_staff', 'ADMIN')->first();
        $administration = DB::table('administration')->where('name', 'SUPERADMIN')->first();
        if (!$staff || !$administration)
             dd('Please use it staff and administration ');
        if (config('app.env') === 'production') {
            $admin  = [
                [
                    'staff_id' => $staff->id,
                    'administration_id' => $administration->id,
                    'user_name' => 'admin1231',
                    'password' => Hash::make('123488888'), // ZWZlNGM3MTdkMDY2
                    'status' => true,
                    'active' => true,
                ]
            ];
        } else {
            $admin  = [
                [
                    'staff_id' => $staff->id,
                    'administration_id' => $administration->id,
                    'user_name' => 'admin@admin',
                    'password' => Hash::make('123488888'), // ZWZlNGM3MTdkMDY2
                    'status' => true,
                    'active' => true,
                ]
            ];
        }
        DB::table('staff_account')->insert($admin);
    }
}
