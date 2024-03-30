<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class BranchSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('branch')->insert([
            'name' => "ADMIN",
            'address' => "ADMIN",
            'hotline' => "ADMIN",
            'manage' => "ADMIN",
            'working_time' => "ADMIN",
            'status' => true,
        ]);
    }
}
