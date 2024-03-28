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
use  App\Mail\templateResetPassword;

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
            if (!$flagExist) return CodeHttpHelpers::returnJson(400, false, "Tài khoản đã được sử dụng", 200);
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
                $message = "Hệ thống nhận thấy trước đó bạn đã đăng ký mà chưa được xác thực. Chúng tôi đã gửi lại thư xác thực, vui lòng kiểm tra email";
            }
            Mail::to($request->post('email'))->send(new templateVerificationEmail($request->post('email'), $token));
            return CodeHttpHelpers::returnJson(200, true, $message, 200);
        } catch (\Exception $exception) {
            return CodeHttpHelpers::returnJson(500, false, $exception, 500);
        }
    }
    public function createPassword(Request $request)
    {

        $rules = [
            "data" => 'required',
            "password" => 'required|confirmed|min:8',
            "password_confirmation" => 'required|min:8',
        ];
        $ruleName = [
            "data" => "Dữ liệu",
            "password" => "Mật khẩu",
            "password_confirmation" => "Xác thực mật khẩu",
        ];
        $validator = validationHelpers::validation($request->all(), $rules, $ruleName);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors())->withInput();
        }
        $data = [
            'status' => true,
            "active" => true,
            "password" => bcrypt($request->input('password')),
        ];
        $id = json_decode($request->input('data'))->id;
        $result = $this->customer->updateById($data, $id);
        return view('authCustomer.confirmPassword', ['status' => true, 'data' => "", 'message' => 'Tạo thành công']);
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
        if (empty($email) || empty($token))
            return view('templates.confirmPassword', ['status' => false, 'data' => "", 'message' => "Đường dẫn bị thay đổi"]);
        $tokenDecode = $this->decodeJwtToken($token);
        if (!$tokenDecode['status']) return view('templates.confirmPassword', ['status' => $tokenDecode['status'], 'data' => "", 'message' => "Đường dẫ đã hết hạn (giới hạn 5 phút) hoặc bị thay đổi."]);
        $emailToken = $tokenDecode['value']->email;
        if ($emailToken != $email)   return view('templates.confirmPassword', ['status' => false, 'data' => "", 'message' => 'Thông tin bi can thiệp, hãy sử dụng đúng đường dẫn']);
        $search = $this->customer->search('email', $emailToken)->first();
        if ($search->email_token != $token)
            return view('templates.confirmPassword', ['status' => false, 'data' => "", 'message' => 'Mã xác thực không chính xác']);
        if ($search->active && $search->status) {
            return view('templates.confirmPassword', ['status' => false, 'data' => "", 'message' => 'Tài khoản đã được tạo trước đó']);
        }
        return view('templates.confirmPassword', ['status' => true, 'data' => $search, 'message' => 'Xác thưc thành công']);
    }
    public function reissuePassword(Request $request)
    {
        $ip = $request->ip();
        $browser = $request->header('User-Agent');
        $email = $request->post('email');
        if (!$email) {
            return CodeHttpHelpers::returnJson(400, false, "Hiễn tại chưa hỗ trợ đăng ký bằng số điện thoại, hãy chọn hình thức đăng ký bằng email", 200);
        }
        $account = $this->customer->search('email', $email)->first();
        if (!$account)
            return CodeHttpHelpers::returnJson(400, false, "Tài khoản chưa được đăng ký", 200);
        if (!$account->active)
            return CodeHttpHelpers::returnJson(400, false, "Tài khoản chưa được kích hoạt", 200);
        if (!$account->status)
            return CodeHttpHelpers::returnJson(400, false, "Tài khoản bị khóa", 200);
        $token = $this->createJWTRefreshToken($email);
        $href = env('APP_URL')."/reissuePassword?token=" . $token;
        $customer = [
            "email_token" => $token,
        ];
        $this->customer->updateById($customer, $account->id);
        Mail::to($request->post('email'))->send(new templateResetPassword($account, $token, $ip, $browser,$href));
        return CodeHttpHelpers::returnJson(200, true, "Yêu cầu cấp lại mật khẩu thành công, hãy kiểm tra email", 200);
    }
    public function authenticatePasswordChange(Request $request)
    {

    }
    public function createJWTRefreshToken($email)
    {

        $algorithm = 'HS256';
        $expiration = 3000; //5ph
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
            return ['status' => false, 'value' => $e->getMessage()];
        } catch (\Exception $error) {
            return ['status' => false, 'value' => "Bất thường"];
        }
    }
}
