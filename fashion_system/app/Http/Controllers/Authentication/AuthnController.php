<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;


class AuthnController extends Controller
{
    //xử lí cho nhân viên trước
    protected $query;
    public function __construct(StaffAccountRepositoryInterface $staffAccountRepository)
    {
        $this->query = $staffAccountRepository;
    }
    public function register(Request $request)
    {
        try {
            $validationRules = [
                'staff_id' => 'required',
                'administration_id' => 'required',
                'user_name' => 'required',
                'password' => 'required|min:9',

            ];
            $attributeNames = [
                'staff_id' => 'Mã nhân viên',
                'administration_id' => 'Mã quyền administration',
                'user_name' => 'tên người sử dụng',
                'password' => 'Mật khẩu',
            ];

            $validator = validationHelpers::validation($request->all(),$validationRules,$attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors()->all();
                return CodeHttpHelpers::returnJson(200, false, $errors, 400);
            }
            $search = $this->query->searchUserName($request->post('user_name'));
            if (!$search)   return   CodeHttpHelpers::returnJson(200, false,'tài khoản đã tồn tại', 400);
            $staffAccount = [
                'staff_id' => $request->post('staff_id'),
                'administration_id' => $request->post('administration_id'),
                'user_name' => $request->post('user_name'),
                'password' => bcrypt($request->post('password')),
            ];
            $result = $this->query->create($staffAccount);
            return CodeHttpHelpers::returnJson(200, true, $result, 200);
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
}
