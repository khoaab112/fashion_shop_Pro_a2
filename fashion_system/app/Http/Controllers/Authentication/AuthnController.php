<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;



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
                return response()->json(['code' => 400, 'message' => 'Lỗi', 'errors' => $errors]);
            }
            $search = $this->query->searchUserName($request->post('user_name'));

            return response()->json(['result-code' => 200, ,'message' => 'Success', 'results' => $search]);
            if (!$search) 
            $staffAccount = [
                'staff_id' => $request->post('staff_id'),
                'administration_id' => $request->post('administration_id'),
                'user_name' => $request->post('user_name'),
                'password' => bcrypt($request->post('password')),
            ];
            $result = $this->query->create($staffAccount);

            return response()->json(['code' => 200, 'message' => 'Success', 'results' => $result]);
        } catch (\Exception $error) {
            // return response()->json(['code' => 500, 'message' => 'Lỗi', 'error' => $error->getMessage()]);
            return response()->json(['code' => 500, 'message' => 'Lỗi bất thường', 'error' => $error]);
        }
    }
}
