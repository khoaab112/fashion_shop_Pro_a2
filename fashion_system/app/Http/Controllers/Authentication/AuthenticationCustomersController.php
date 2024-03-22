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
use Illuminate\Support\Facades\Mail;
use  App\Mail\templateVerificationEmail;

class AuthenticationCustomersController extends Controller
{
    //
    protected $customer;
    protected $validationRules = [
        // "rank_id" => 'required|exists:rank,id|numeric',
        "first_name" => 'max:50',
        "last_name" => 'max:50',
        "address" => 'max:200',
        "phone_number" => 'numeric|regex:/^[0-9]{10}$/|unique:customers,phone_number',
        "email" => 'max:50|unique:customers,email|email',
        "sex" => 'boolean',
        "accumulated_points" => 'numeric',
        "number_ban" => 'numeric',
        "potential" => 'boolean',
        "status" => 'boolean',
        "password" => 'confirmed|min:8',
        "password_confirmation" => 'min:8',
        "remember_token" => 'boolean',
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
        "potential" => "Kiểm tra khách hàng",
        "status" => "Trạng thái",
        "password" => "Mật khẩu",
        "password_confirmation" => "Mật khẩu cũ",
        "remember_token" => "ghi nhớ",
    ];
    public function __construct(CustomersRepositoryInterface $customersRepository)
    {
        $this->customer = $customersRepository;
    }
    public function register(Request $request)
    {
        if (!$request->post('email')) {
            return CodeHttpHelpers::returnJson(400, false, "Hiễn tại chưa hỗ trợ đăng ký bằng số điện thoại, hãy chọn hình thức đăng ký bằng email", 200);
        }
        if (!$request->post('user_name') && !$request->post('email')) {
            return CodeHttpHelpers::returnJson(400, false, "Hãy nhập thông tin đăng ký", 200);
        }
        $validator = validationHelpers::validation($request->all(), $this->validationRules, $this->attributeNames);
        $flagExist = false;
        if ($validator->fails()) {
            $errors = $validator->errors();
            if ($errors->has('email')) {
                $errEmail = $errors->get('email');
                foreach ($errEmail as $error) {
                    if ($error == "Email đã được sử dụng") {
                        $search = $this->customer->getDataAccordingToConditions([
                            ['email', '=',  $request->post('email'),],
                        ]);
                        $flagExist = !$search->first()->active ? true : false;
                    }
                }
            } else if ($errors->has('phone_number')) {
                $errPhoneNumber = $errors->get('phone_number');
                foreach ($errPhoneNumber as $error) {
                    if ($error == "Số điện thoại đã được sử dụng") {
                        $search = $this->customer->getDataAccordingToConditions([
                            ['phone_number', '=',  $request->post('phone_number'),],
                        ]);
                    }
                    $flagExist = !$search->first()->active ? true : false;
                }
            } else
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
                if(!$flagExist) return CodeHttpHelpers::returnJson(400, false, "Tài khoản đã được sử dụng", 200);
        }
        $token = $this->createJWTRefreshToken($request->post('email'));
        if (!$flagExist) {
            $customer = [
                'rank_id' => 1,
                'phone_number' => $request->post('phone_number'),
                'email' => $request->post('email'),
                'status' => false,
                "active" => false,
                "email_token" => $token,

            ];
        } else {
            $customer = [
                "email_token" => $token,
            ];
        }
        try {
            if (!$flagExist) {
                $result = $this->customer->create($customer);
                $message = "Yêu cầu đã được tạo, bạn hãy kiểm tra email";
            } else {
                $result = $this->customer->updateById($customer, $search->first()->id);
                $message ="Hệ thống nhận thấy trước đó bạn đã đăng ký mà chưa được xác thực. Chúng tôi đã gửi lại thư xác thực, vui lòng kiểm tra email";
            }
            Mail::to($request->post('email'))->send(new templateVerificationEmail($request->post('email'), $token));
            return CodeHttpHelpers::returnJson(200, true, $message, 200);
        } catch (\Exception $exception) {
            return CodeHttpHelpers::returnJson(500, false, $exception, 500);
        }
    }
    public function login(Request $request)
    {
    }
    public function logout(Request $request)
    {
    }
    public function pathValidation(Request $request)
    {
        $email = $request->input('email');
        $token = $request->input('token');
        $tokenDecode = $this->decodeJwtToken($token);
dd($tokenDecode);
    }
    public function createJWTRefreshToken($email)
    {

        $algorithm = 'HS256';
        $expiration = 300;
        $issuedAt = time();
        $secretKey = env('JWT_SECRET');
        $expirationTime = $issuedAt + $expiration;
        $payload = [
            'iss' => env('APP_URL'),
            'iat' => $issuedAt,
            'exp' => $expirationTime,
            'nbf' => $issuedAt,
            'email' => $email,
        ];
        $jwt = JWT::encode($payload, $secretKey, $algorithm);
        return $jwt;
    }
    public static function decodeJwtToken($token)
    {
        $key = new Key(env('JWT_SECRET'), 'HS256');
        try {
            // Cấu hình đối tượng Key từ secret key
            // $key = new Key(env('JWT_SECRET'), 'HS256');
            $decodedToken = JWT::decode($token, $key);

            return ['status' => true, 'value' => $decodedToken];
        } catch (\Firebase\JWT\ExpiredException $e) {
            return ['status' => false, 'value' => null];
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
}
