<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\CodeHttpHelpers;
use App\Http\Controllers\Controller;
use App\Repositories\UserStaff\UserStaffRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class StaffController extends Controller
{
    //
    protected $staff;

    public function __construct(UserStaffRepository $staff)
    {

        $this->staff = $staff;
    }

    public function getInFoStaff(Request $request, $id)
    {
        $staffInfo = $this->staff->getById($id)->all();

        if (!$staffInfo) {
            return CodeHttpHelpers::returnJson(204, false, null, 200);
        }
        return CodeHttpHelpers::returnJson(200, true, $staffInfo, 200);
    }
    public function changeAvatarStaffById(Request $request, $id)
    {


        if ($request->get('file')) {
            $image = $request->get('file');

            $base64Image = $request->input('file'); // Chuỗi base64 từ request
            $data = explode(',', $base64Image);
            $imageData = base64_decode($data[1]);
            $extension = 'png'; // Hoặc phân tích extension từ chuỗi base64 nếu có

            // Tạo tên tệp ngẫu nhiên
            $fileName = Str::random(12) . '.' . $extension;
              // Đường dẫn lưu trữ
        // $storagePath = 'images'; // Đổi thành thư mục lưu trữ bạn muốn
        // // Lưu tệp ảnh
        // Storage::disk('public')->put($storagePath . '/' . $fileName, $imageData);
        $pathResource = 'resources/public/test.png';
        $result = file_put_contents($pathResource, $imageData);

        $storagePath = 'resources'; // Đổi thành thư mục lưu trữ bạn muốn

        // Lưu tệp tĩnh vào disk local (resources)
        // Storage::disk('test')->put($storagePath . '/' . $fileName, $imageData);
//resources/public
        }
    }
}
