<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
use App\Helpers\CodeHttpHelpers;


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
                // 'password_confirm' => 'required|min:9|same:password',
            ];
            $customMessages = [
                'required' => ':attribute không được bỏ trống.',
                'min' => ':attribute phải có ít nhất :min ký tự.',
                'same' => ':attribute không khớp với mật khẩu đã nhập.',
            ];

            $validator = validator()->make($request->all(), $validationRules, $customMessages);
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
