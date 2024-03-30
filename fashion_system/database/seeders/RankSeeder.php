<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RankSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('rank')->insert(
            [
                [
                    'name' => "Đồng",
                    'detail' => "Cấp độ sơ khai, ban đầu của người dùng",
                    'icon' => "updating",
                    'score' => 100,
                    'status' => true,
                ],
                [
                    'name' => "Bạc",
                    'detail' => "Cấp độ thứ 2, có một số ưu đãi nhất định với bậc hạng này",
                    'icon' => "updating",
                    'score' => 1000,
                    'status' => true,
                ],
                [
                    'name' => "Vàng",
                    'detail' => "Cấp độ thứ 3, thực sự ở cấp độ này lưỡng đãi ngỗ rất cao, có thể tính thành hàng tuần",
                    'icon' => "updating",
                    'score' => 3000,
                    'status' => true,
                ],
                [
                    'name' => "Kim cương",
                    'detail' => "Cấp độ cuối, thật tuyệt vời có lẽ bạn là vua, chúa đối với hệ thống của chúng tôi rồi",
                    'icon' => "updating",
                    'score' => 8000,
                    'status' => true,
                ],
            ]
        );
    }
}
