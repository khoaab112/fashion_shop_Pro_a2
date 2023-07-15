<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use Illuminate\Support\Facades\Auth;

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
                'password' => 'required|min:1',

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
            if ($search)   return   CodeHttpHelpers::returnJson(200, false,'tài khoản đã tồn tại', 400);
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
    public function login(Request $request){
        //change table default on laravel
        // $setTable =app(config('auth.providers.users.model'));
        // $setTable->setTable('staff_account');
        // Auth::getProvider()->setTable('customers');
        var_dump($request->email);
        var_dump($request->password);
        if(Auth::guard('staff_account')->attempt(['user_name' =>$request->email, 'password' =>$request->password]))
        {
            dd('thành công')    ;
        }
        else
        dd('thất bại');
    }
}
