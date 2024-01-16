<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Customers\CustomersRepositoryInterface;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Illuminate\Support\Facades\DB;
use App\Models\StaffAccount;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cache;

class AuthenticationCustomersController extends Controller
{
    //
    protected $customer;
    protected $validationRules = [
        // "rank_id" => 'required|exists:rank,id|numeric',
        "first_name" => 'required|max:50',
        "last_name" => 'required|max:50',
        "address" => 'required|max:200',
        "phone_number" => 'required|max:10|unique:customers,phone_number',
        "email" => 'required|max:50|unique:customers,email',
        "birthday" => 'required',
        "sex" => 'required|boolean',
        "accumulated_points" => 'numeric',
        "number_ban" => 'numeric',
        // "potential" => 'boolean',
        // "status" => 'boolean',
        "password" => 'required|confirmed|min:9',
        "password_confirmation" => 'required|min:9',
        // "remember_token" => 'boolean',
    ];
    protected   $attributeNames = [
        // "rank_id" => "Cấp độ",
        "first_name" => "Tên",
        "last_name" => "Họ",
        "address" => "Địa chỉ",
        "phone_number" => "Số điện thoại",
        "email" => "Email",
        "birthday" => "Ngày tháng năm sinh",
        "sex" => "Giới tính",
        "accumulated_points" => "Số điểm",
        "number_ban" => "Số lần khóa",
        // "potential" => "Kiểm tra khách hàng",
        // "status" => "",
        "password" => "Mật khẩu",
        "password_confirmation" => "Mật khẩu cũ",
        // "remember_token" => "",
    ];
    public function __construct(CustomersRepositoryInterface $customersRepository)
    {
        $this->customer = $customersRepository;
    }
    public function register(Request $request, $creator)
    {
    }
    public function login(Request $request)
    {
    }
    public function logout(Request $request)
    {
    }
}
