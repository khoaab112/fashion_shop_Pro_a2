<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Session;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use \Firebase\JWT\Algorithm\HS256;

class AuthnController extends Controller
{
    //xử lí cho nhân viên trước
    protected $query;
    protected $validationRules = [
        'staff_id' => 'required|unique:staff_account,staff_id|exists:staff,id',
        'user_name' => 'required|string|unique:staff_account,user_name',
        'administration_id' => 'required',
        'password' => 'required|min:9|string',
    ];
    protected   $attributeNames = [
        'staff_id' => 'Mã nhân viên',
        'administration_id' => 'Mã quyền administration',
        'user_name' => 'tên người sử dụng',
        'password' => 'Mật khẩu',
    ];
    public function __construct(StaffAccountRepositoryInterface $staffAccountRepository)
    {
        // $this->middleware('auth:api', ['except' => ['login', 'register']]);
        // $this->middleware('auth:api');
        $this->query = $staffAccountRepository;
    }
    public function register(Request $request)
    {
        try {

            $validator = validationHelpers::validation($request->all(), $this->validationRules, $this->attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(200, false, $errors, 400);
            }
            $search = $this->query->searchUserName($request->post('user_name'));
            if ($search)   return   CodeHttpHelpers::returnJson(200, false, 'tài khoản đã tồn tại', 400);
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

    //khi đăng nhập nếu trong cookie và giải mã cookie có giá trị là tru thì cho đằng nhập
    public function login(Request $request)
    {
        $isLogin = $request->status;
        //check nhớ mất khẩu
        /*nếu có nhớ thì check , nếu hết hạn thì đăng nhập lại , nếu chưa hết hạn cho phép đăng nhập luôn */
        $cookie = $request->cookie(env('VITE_KEY_REFRESH_TOKEN'));
        if ($cookie && !$isLogin) {
            $decodeJwtToken = $this->decodeJwtToken($cookie);
            $remember = $decodeJwtToken['value']->remember;
            if ($remember && $decodeJwtToken['status']) {
                return CodeHttpHelpers::returnJson(200, true, null, 200);
            }
            return CodeHttpHelpers::returnJson(200, false, "failure", 401);
        }
        $validateLogin = [
            'user_name' => 'required|string',
            'password' => 'required|min:9|string',
        ];
        //kiểm tra dữ liệu
        $validator = validationHelpers::validation($request->all(), $validateLogin, $this->attributeNames);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return CodeHttpHelpers::returnJson(400, false, $errors, 200);
        }
        //thêm thông tin vào accessToken
        //check thông tin với database
        // check locked
        //trả về token & refreshToken
        $addInfoUser = ['user_name' => $request->user_name, 'rank' => 'defined', 'reservation' => true];
        try {
            if ($token = Auth::claims($addInfoUser)->attempt(['user_name' => $request->user_name, 'password' => $request->password])) {
                $user = Auth::user();
                if (!$user['status']) return CodeHttpHelpers::returnJson(403, false, 'account has been locked', 403);
                $addInfoUserRefreshToken = ['user_name' => $request->user_name, 'rank' => 'pending', 'id' => $user['id']];
                $refreshToken = $this->createJWTRefreshToken($addInfoUserRefreshToken, $request->remember_token);
                $data = [
                    "type" => "bearer",
                    "token" => $token,
                    "refresh_token" => $refreshToken,
                    "remember_token" => $request->remember_token
                ];
                $this->query->updateById(['refresh_token' => $refreshToken, 'issued_at' => Carbon::now(), 'expired_time' => $this->calculateLifeTimeOfToken()], $user['id']);
                // ,'issued_at'=>''
                return CodeHttpHelpers::returnJson(200, true, $data, 200);
            } else {
                return CodeHttpHelpers::returnJson(401, false, "Tài khoản hoặc mật khẩu không chính xác", 200);
            }
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
    public function getCookie($request)
    {
        return $request->cookie('cookie_refresh_token');
    }
    //xóa refresh token and access token

    public function logout(Request $request)
    {

        try {
            $IDUser = Auth::user()->id;
            $authorizationHeader = $request->header('Authorization');
            $token = str_replace('Bearer ', '', $authorizationHeader);
            //xóa access token 
            Auth::setToken($token)->invalidate();
            // Auth::logout();
            // $this->removeRefreshToken($IDUser);
            return CodeHttpHelpers::returnJson(200, true, 'Đăng xuất thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(400, false, $e, 200);
        }
    }
    //giải mã jwt login
    public function decodeJwtToken($token)
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

    public function tokenRefresh($token)
    {
        $tokenRefresh =  Auth::refresh($token);
        return CodeHttpHelpers::returnJson(
            500,
            false,
            ['token_refresh' => $tokenRefresh],
            500
        );
    }
    public function calculateLifeTimeOfToken()
    {
        $timeLiveRF = env('LIVE_TIME_REFRESH_TOKEN');
        $carbon = Carbon::now();
        $days = $carbon->diffInDays($carbon->copy()->addSeconds($timeLiveRF));
        return $carbon->addDays($days);
    }
    public function createJWTRefreshToken($data, $remember)
    {

        $algorithm = 'HS256';
        $expiration = env('LIVE_TIME_REFRESH_TOKEN');
        $issuedAt = time();
        $secretKey = env('JWT_SECRET');
        $expirationTime = $issuedAt + $expiration;
        $payload = [
            'iss' => env('APP_URL'),
            'iat' => $issuedAt,
            'exp' => $expirationTime,
            'nbf' => $issuedAt,
            'user_name' => $data['user_name'],
            'rank' => $data['rank'],
            'id' => $data['id'],
            'remember' => $remember,
        ];
        $jwt = JWT::encode($payload, $secretKey, $algorithm);
        return $jwt;
    }
    public function removeRefreshToken($id)
    {

        $this->query->removeRefreshToken($id);
    }
    public function getAll()
    {
        dd('aa');
        return CodeHttpHelpers::returnJson(200, false, $this->query->getAll(), 200);
    }
}
