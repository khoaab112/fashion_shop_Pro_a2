<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Session;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

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
        $this->middleware('auth:api', ['except' => ['login', 'register','test']]);
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
        //check nhớ mất khẩu
        /*nếu có nhớ thì check , nếu hết hạn thì đăng nhập lại , nếu chưa hết hạn cho phép đăng nhập luôn */
        if ($request->remember_password) {
            $cookieRefreshToken = $this->getCookie($request);
            $decodeJwtToken = $this->decodeJwtToken($cookieRefreshToken);
            if ($decodeJwtToken) {
                return CodeHttpHelpers::returnJson(200, true, null, 200);
            }
            return CodeHttpHelpers::returnJson(401, true, "failure", 401);
        }

        $validateLogin = [
            'user_name' => 'required|string',
            'password' => 'required|min:9|string',
        ];

        $validator = validationHelpers::validation($request->all(), $validateLogin, $this->attributeNames);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return CodeHttpHelpers::returnJson(200, false, $errors, 400);
        }
        $addInfoUser = ['user_name' => $request->user_name, 'rank' => 'defined'];
        try {
            if ($token = Auth::claims($addInfoUser)->attempt($request->all())) {
                $data = [
                    "type" => "bearer",
                    "token" => $token,
                    "refresh_token" => $this->createJWTRefreshToken($addInfoUser),
                    "remember password" => false
                ];
                return CodeHttpHelpers::returnJson(200, true, $data, 200);
            } else {
                return CodeHttpHelpers::returnJson(401, true, "failure", 401);
            }
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
    public function getCookie($request)
    {
        return $request->cookie('cookie_refresh_token');
    }
    public function logout()
    {
        Auth::logout();
        return response()->json([
            'message' => 'Successfully logged out',
        ]);
    }
    //giải mã jwt login
    public function decodeJwtToken($token)
    {


        try {
            // Cấu hình đối tượng Key từ secret key
            $key = new Key(env('JWT_SECRET'), 'HS256');
            $decodedToken = JWT::decode($token, $key, ['HS256']);

            return ['status' => true, 'value' => $decodedToken];
        } catch (\Firebase\JWT\ExpiredException $e) {
            return ['status' => false, 'value' => null];
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }

    public function refreshToken($refreshToken)
    {
        return response()->json([
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }
    public function getAll()
    {
        // dd('ádas');
        $this->query->getAll();
        return CodeHttpHelpers::returnJson(200, false, $this->query, 200);
    }
    function createJWTRefreshToken($data) {
    
        $algorithm = 'HS256';
         $expiration = env('LIVE_TIME_REFRESH_TOKEN');
        $issuedAt = time();
        $secretKey=env('JWT_SECRET');
        $expirationTime = $issuedAt + $expiration;
        $payload = [
            'iss' => env('APP_URL'), 
            'iat' => $issuedAt, 
            'exp' => $expirationTime, 
            'nbf'=>$issuedAt,
            'user_name' => $data['user_name'],
            'rank' => $data['rank'],
        ];    
        $jwt = JWT::encode($payload, $secretKey, $algorithm);
        return $jwt;
    }





}
