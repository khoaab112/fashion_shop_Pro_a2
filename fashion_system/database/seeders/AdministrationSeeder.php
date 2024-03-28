<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdministrationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('administration')->insert(
            [
            [
                'name' => "SUPERADMIN",
                'status' => true,
            ],
            [
                'name' => "ADMIN",
                'status' => true,
            ],
            ]
        );
    }
}
