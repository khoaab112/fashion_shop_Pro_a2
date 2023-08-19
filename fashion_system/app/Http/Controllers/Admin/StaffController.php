<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\CodeHttpHelpers;
use App\Http\Controllers\Controller;
use App\Repositories\UserStaff\UserStaffRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Helpers\FormatDate;


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
    public function updateInfo(Request $request)
    {
        $staffId = $request->staff_id;
        $data = [
            'sex' => $request->sex,
            'birthday' => $request->birthday,
            'address' => $request->address,
        ];
        try {
            $resultUpdateAvatar = $this->staff->updateById($data, $staffId);
            if ($resultUpdateAvatar) {
                return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
            }
            return CodeHttpHelpers::returnJson(500, false, 'Cập nhật thất bại', 500);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    //tìm kiếm xóa file cũ
    public function changeAvatarStaffById(Request $request, $id)
    {
        $image = $request->get('file');
        $storagePath = 'images/staff';
        $staff = $this->staff->getById($id)->first();
        $pathImg = $staff->img;
        if (!$staff)  return CodeHttpHelpers::returnJson(400, true, 'Mã nhân viên không hơp lệ', 200);
        if ($image) {
            $base64Image = $image;
            $data = explode(',', $base64Image);
            $imageData = base64_decode($data[1]);
            $formatParts = explode('/', explode(':', substr($base64Image, 0, strpos($base64Image, ';')))[1]);
            //đuôi file
            $fileExtension = $formatParts[1];
            //tên file
            $nameFile = $id . "_" . FormatDate::getTimestamp() . "." . $fileExtension;
            $pathFull = $storagePath . '/' . $nameFile;
            $arrDataUpdate = [
                'img' => $pathFull,
            ];
            $resultUpdateAvatar = $this->staff->updateById($arrDataUpdate, $id);
            if (!$resultUpdateAvatar)  return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
            $resultSaveFile =  Storage::disk('frontEnd')->put($pathFull, $imageData);
            // xóa bỏ một file từ db nếu nó đã tồn tại
            if ($pathImg && Storage::disk('frontEnd')->exists($pathImg)) {
                Storage::disk('frontEnd')->delete($pathImg);
            }
            if ($resultSaveFile)   return CodeHttpHelpers::returnJson(200, true, 'Cập nhật ảnh đại diện thành công thành công', 200);
            return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
        }
        return CodeHttpHelpers::returnJson(400, true, 'Không có ảnh nào được tải nên', 200);
    }
    public function changeBackgroundStaffById(Request $request, $id)
    {
        $image = $request->get('file');
        $storagePath = 'images/background_staff';
        $staff = $this->staff->getById($id)->first();
        $pathImg = $staff->background;
        if (!$staff)  return CodeHttpHelpers::returnJson(400, true, 'Mã nhân viên không hơp lệ', 200);
        if ($image) {
            $base64Image = $image;
            $data = explode(',', $base64Image);
            $imageData = base64_decode($data[1]);
            $formatParts = explode('/', explode(':', substr($base64Image, 0, strpos($base64Image, ';')))[1]);
            //đuôi file
            $fileExtension = $formatParts[1];
            //tên file
            $nameFile = $id . "_" . FormatDate::getTimestamp() . "." . $fileExtension;
            $pathFull = $storagePath . '/' . $nameFile;
            $arrDataUpdate = [
                'background' => $pathFull,
            ];
            $resultUpdateAvatar = $this->staff->updateById($arrDataUpdate, $id);
            if (!$resultUpdateAvatar)  return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
            $resultSaveFile =  Storage::disk('frontEnd')->put($pathFull, $imageData);
            // xóa bỏ một file từ db nếu nó đã tồn tại
            if ($pathImg && Storage::disk('frontEnd')->exists($pathImg)) {
                Storage::disk('frontEnd')->delete($pathImg);
            }
            if ($resultSaveFile)   return CodeHttpHelpers::returnJson(200, true, 'Cập nhật ảnh bìa thành công thành công', 200);
            return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
        }
        return CodeHttpHelpers::returnJson(400, true, 'Không có ảnh nào được tải nên', 200);
    }
}
