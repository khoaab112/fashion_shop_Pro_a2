<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StaffSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $position = DB::table('position')->where('name', 'ADMIN')->first();
        $branch = DB::table('branch')->where('name', 'ADMIN')->first();
        if ($position && $branch) {
            DB::table('staff')->insert([
                'code_staff' => "ADMIN",
                'position_id' => $position->id,
                'branch_id' => $branch->id,
                'name' => "ADMIN",
                'address' => "ADMIN",
                'phone_number' => "ADMIN",
                'active' => true,
                'status' => true,
            ]);
        }
        else{
            dd("Please use it position and branch ");
        }
    }
}
