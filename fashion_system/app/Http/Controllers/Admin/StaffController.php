<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\CodeHttpHelpers;
use App\Helpers\DriveGoogleHelpers;
use App\Http\Controllers\Controller;
use App\Repositories\UserStaff\UserStaffRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use App\Helpers\FormatDate;
use Illuminate\Support\Facades\DB;

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
        $image = $request->file('file');
        $storagePath = 'system/images/avatar';
        $staff = $this->staff->getById($id)->first();
        $pathDB = $staff->img;
        if (!$staff)  return CodeHttpHelpers::returnJson(400, true, 'Mã nhân viên không hơp lệ', 200);
        if ($image) {
            //đuôi file
            $fileExtension = $image->extension();
            //tên file
            $fileName = $id . "_" . FormatDate::getTimestamp() . "." . $fileExtension;
            $resultSaveFile = DriveGoogleHelpers::saveFile($image, $storagePath, $fileName);
            if (!$resultSaveFile)  return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
            // xóa bỏ một file từ db nếu nó đã tồn tại
            if ($pathDB) {
                DriveGoogleHelpers::deleteFile($pathDB);
            }
            // save db
            $pathFull = $storagePath . '/' . $fileName;
            $arrDataUpdate = [
                'img' => $pathFull,
                'img_drive_google' => "https://lh3.googleusercontent.com/d/".$resultSaveFile,
            ];
            $resultUpdateAvatar = $this->staff->updateById($arrDataUpdate, $id);
            if (!$resultUpdateAvatar)  return CodeHttpHelpers::returnJson(400, true, 'Cập nhật thất bại', 200);
            return CodeHttpHelpers::returnJson(200, true, 'Cập nhật ảnh đại diện thành công thành công', 200);
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
    public function editCarefully(Request $request)
    {
        $position_id = $request->input('position_name');
        $branch_id = $request->input('branch_name');
        $account_id = $request->input('account_id');
        $staff_id = $request->input('staff_id');
        $administration_id = $request->input('administration');
        $staffData = $request->input();
        $isPositionUpdate = true;
        $isBranchUpdate = true;
        $isAccountUpdate = true;
        $isStaffUpdate = true;
        $isAdministrationUpdate = true;
        try {
            if ((int)$position_id == 0) {
                $isPositionUpdate = false;
            } else {
                $searchResultsPosition = DB::table('position')->where([['id', '=', (int)$position_id]])->first();
                if (!$searchResultsPosition)
                    return CodeHttpHelpers::returnJson(204, false, 'Quyền không tồn tại', 200);
            }
            if ((int)$branch_id == 0) {
                $isBranchUpdate = false;
            } else {
                $searchResultsBranch = DB::table('branch')->where([['id', '=', (int)$branch_id]])->first();
                if (!$searchResultsBranch)
                    return CodeHttpHelpers::returnJson(204, false, 'Chi nhánh không tồn tại', 200);
            }

            if ((int)$account_id == 0) {
                $isAccountUpdate = false;
            } else {
                $searchResultsAccount = DB::table('staff_account')->where([['id', '=', (int)$account_id]])->first();
                if (!$searchResultsAccount)
                    return CodeHttpHelpers::returnJson(204, false, 'Tài khoản không tồn tại', 200);
            }
            if ((int)$staffData == 0) {
                $isStaffUpdate = false;
            } else {
                $searchResultsStaff = DB::table('staff')->where([['id', '=', (int)$staffData]])->first();
                if (!$searchResultsStaff)
                    return CodeHttpHelpers::returnJson(204, false, 'Nhân viên không tồn tại', 200);
            }
            if (!(int)$administration_id) {
                $isAdministrationUpdate = false;
            } else {
                $searchResultsAdministration = DB::table('administration')->where([['id', ' =', (int)$administration_id]])->first();
                if (!$searchResultsAdministration)
                    return CodeHttpHelpers::returnJson(204, false, 'Câp độ tài khoản không tồn tại', 200);
            }
            //chia ra 2 loại cập nhật
            //cập nhân viên
            if ($isStaffUpdate) {
                $arrUpdateStaff = [];
                if ($isBranchUpdate) $arrUpdateStaff['branch_id'] = $branch_id;
                if ($isPositionUpdate) $arrUpdateStaff['position_id'] = $position_id;

                $arrUpdateStaff += [
                    'address' => $request->input('staff_address'),
                    'name' => $request->input('staff_name'),
                    'phone_number' => $request->input('phone_number'),
                    'email' => $request->input('email'),
                    'birthday' => $request->input('birthday'),
                    'sex' => $request->input('sex'),
                    'status' => $request->input('status'),
                ];
                $resultStaffUpdate = DB::table('staff')->where('id', $staff_id)->update($arrUpdateStaff);
            }
            //cập nhật tài khoản
            if ($isAccountUpdate) {
                $arrUpdateAccount = [];
                if ($isAdministrationUpdate)  $arrUpdateAccount['administration_id'] = $administration_id;
                $arrUpdateAccount += [
                    'status' => $request->input('status'),
                ];
                $resultAccountUpdate = DB::table('staff_account')->where('id', $account_id)->update($arrUpdateAccount);
            }
            return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function checkStaffCode($code)
    {
        try {
            if (!$code) return CodeHttpHelpers::returnJson(204, false, 'Hãy nhập mã nhân viên', 200);
            $search = $this->staff->search('code_staff', $code)->first();
            if (!$search) return CodeHttpHelpers::returnJson(204, false, 'Mã nhân viên không tồn tại', 200);
            return CodeHttpHelpers::returnJson(200, true, $search, 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
