<?php

namespace App\Http\Controllers\Authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\StaffAccount\StaffAccountRepositoryInterface;
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
use App\Events\AdminConnected;
use App\Http\Controllers\Admin\NotificationController;



class AuthnController extends Controller
{
    private $KEY_CACHE = "numberOfActivePeople";

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
        'user_name' => 'Tài khoản',
        'password' => 'Mật khẩu',
    ];
    public function __construct(StaffAccountRepositoryInterface $staffAccountRepository)
    {
        // $this->middleware('auth:api', ['except' => ['login', 'register']]);
        // $this->middleware('auth:api');
        $this->query = $staffAccountRepository;
    }
    public function register(Request $request, $creator)
    {
        try {

            $validator = validationHelpers::validation($request->all(), $this->validationRules, $this->attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
            $search = $this->query->searchUserName($request->post('user_name'));
            if ($search)   return   CodeHttpHelpers::returnJson(200, false, 'tài khoản đã tồn tại', 400);
            $active = true;
            if ($creator == 'staff') {
                $active = false;
            }
            $staffAccount = [
                'staff_id' => $request->post('staff_id'),
                'administration_id' => $request->post('administration_id'),
                'user_name' => $request->post('user_name'),
                'password' => bcrypt($request->post('password')),
                'active' => $active,
                'status' => $active,
            ];
            $result = $this->query->create($staffAccount);
            if ($creator == 'staff') {
                $arrId=[];
                $resultsSearch = $this->query->search('administration_id', '1');
                foreach ($resultsSearch as $value) {
                    array_push($arrId, $value->staff_id);
                }
                $dataNotification = [
                    'staff_id' => $arrId,
                    'content' => "Có tài khoản đăng ký, hãy xác thực",
                    'code' => 'EVENT'
                ];
                $notificationController = app(NotificationController::class);
                $notificationController->createNotificationByIdStaff($dataNotification);
            }
            // return CodeHttpHelpers::returnJson(200, true, $result, 200);
        } catch (Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }

    //khi đăng nhập nếu trong cookie và giải mã cookie có giá trị là true thì cho đằng nhập
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

        try {
            if (Auth::attempt(['user_name' => $request->user_name, 'password' => $request->password])) {
                $user = Auth::user();
                if (!$user['active']) return CodeHttpHelpers::returnJson(401, false, 'Tài khoản chưa được xác thực hãy quay lại sau khi quá trình xác thực thành công, thông tin xác thực sẽ được gửi về mail mà bạn đăng ký', 200);
                if (!$user['status']) return CodeHttpHelpers::returnJson(403, false, 'account has been locked', 403);
                $role = $this->searchRole($user['administration_id']);
                $addInfoUser = [
                    'user_name' => $request->user_name,
                    'rank' => 'defined',
                    'reservation' => true,
                    'staff_id' => $user['staff_id'],
                    'role' => $role->name,
                ];
                $token = Auth::claims($addInfoUser)->attempt(['user_name' => $request->user_name, 'password' => $request->password]);
                // if (!$user['status']) return CodeHttpHelpers::returnJson(403, false, 'account has been locked', 403);
                $addInfoUserRefreshToken = [
                    'user_name' => $request->user_name,
                    'rank' => 'pending',
                    'id' => $user['id'],
                    'staff_id' => $user['staff_id'],
                    'role' => $role->name,
                ];
                $refreshToken = $this->createJWTRefreshToken($addInfoUserRefreshToken, $request->remember_token);
                $data = [
                    "type" => "bearer",
                    "token" => $token,
                    "refresh_token" => $refreshToken,
                    "remember_token" => $request->remember_token
                ];
                $this->query->updateById(
                    [
                        'refresh_token' => $refreshToken,
                        'issued_at' => Carbon::now(),
                        'expired_time' => $this->calculateLifeTimeOfToken()
                    ],
                    $user['id']
                );
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
        return  $request->cookie(env('VITE_KEY_REFRESH_TOKEN'));
    }

    //xóa refresh token and access token
    public function logout(Request $request)
    {
        try {
            $staffId = Auth::user()->staff_id;
            $accountId = Auth::user()->id;
            $authorizationHeader = $request->header('Authorization');
            $token = str_replace('Bearer ', '', $authorizationHeader);
            //xóa access token
            Auth::setToken($token)->invalidate();
            Auth::logout();
            $this->removeRefreshToken($accountId);
            $this->statusChange($request, $staffId);
            return CodeHttpHelpers::returnJson(200, true, 'Đăng xuất thành công', 200);
        } catch (\Exception $err) {
            return CodeHttpHelpers::returnJson(400, false, $err, 200);
        }
    }
    //giải mã jwt login
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
    //làm mới access_Token
    public function tokenRefresh($data)
    {
        $addInfoUser = [
            'user_name' => $data['user_name'],
            'rank' => 'defined',
            'reservation' => true,
            'staff_id' => $data['staff_id'],
        ];

        return Auth::claims($addInfoUser)
            ->attempt(['user_name' => $data['user_name']]);
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
            'staff_id' => $data['staff_id'],
            'remember' => $remember,
        ];
        $jwt = JWT::encode($payload, $secretKey, $algorithm);
        return $jwt;
    }
    public function changePassword(Request $request)
    {
        // |unique:staff_account,staff_id
        $validation = [
            'staff_id' => 'required|exists:staff_account,staff_id',
            'user_name' => 'required|string|exists:staff_account,user_name',
            'passwordOld' => 'required|min:9|string',
            'password' => 'required|min:9|string|confirmed',
            'password_confirmation' => 'required|min:9|string',
        ];
        $attribute = [
            'staff_id' => 'Mã nhân viên',
            'user_name' => 'Tài khoản sử dụng',
            'passwordOld' => 'Mật khẩu',
            'password' => 'Mật khẩu mới',
            'password_confirmation' => 'Mật khẩu xác thực',
        ];
        try {
            $validator = validationHelpers::validation($request->all(), $validation, $attribute);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
            $resultSearch = $this->query->search('user_name', $request->post('user_name'))->first();
            if (!$resultSearch) {

                return CodeHttpHelpers::returnJson(401, false, 'Unauthorized', 401);
            }
            //so sánh vs mk cũ
            if (!(Hash::check($request->post('passwordOld'), $resultSearch->password))) {
                return CodeHttpHelpers::returnJson(400, false, ['password' => ['Mật khẩu cũ không chính xác']], 200);
            }
            $staffAccount = [
                'password' => bcrypt($request->post('password')),
                'refresh_token' => null,
                'issued_at' => null,
                'expired_time' => null
            ];
            $result = $this->query->updateByUserName($staffAccount, $request->post('user_name'));
            if ($result) {
                return CodeHttpHelpers::returnJson(200, true, "Đổi mật khẩu thành công", 200);
            }
            return CodeHttpHelpers::returnJson(500, false, "error", 200);
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
    public function removeRefreshToken($id)
    {
        $this->query->removeRefreshToken($id);
    }
    //cấp lại access token
    // public function reissueAccessToken(Request $request,  $idStaff)
    // {
    //     $cookie = $this->getCookie($request);
    //     $decode = $this->decodeJwtToken($cookie);

    //     $existRefreshToken = StaffAccount::where('staff_id', $idStaff)
    //         ->where('refresh_token', $cookie)
    //         ->whereRaw('EXTRACT(DAY FROM (expired_time-issued_at)) > 0')
    //         ->first();
    //     if (!$existRefreshToken) {
    //         return CodeHttpHelpers::returnJson(401, false, 'CANCEL_SESSION', 401);
    //     }

    //     if (!$existRefreshToken['status'])
    //         return CodeHttpHelpers::returnJson(403, false, 'account has been locked', 403);
    //     //cấp lại access token
    //     $addInfoUser = [
    //         'user_name' => $existRefreshToken['user_name'],
    //         'rank' => 'defined',
    //         'reservation' => true,
    //         'staff_id' => $existRefreshToken['staff_id']
    //     ];
    //     $reissueAccessToken = Auth::claims($addInfoUser)->fromUser($existRefreshToken);
    //     return CodeHttpHelpers::returnJson(200, true,  $reissueAccessToken, 200);
    // }



    public static function reissueAccessToken(Request $request)
    {
        try {
            $cookie = $request->cookie(env('VITE_KEY_REFRESH_TOKEN'));
            $key = new Key(env('JWT_SECRET'), 'HS256');
            $decode = JWT::decode($cookie, $key);
            $idStaff = $decode->staff_id;
            //kiểm tra tk có tồn tại , mã token đúng , còn hạn
            $existRefreshToken = StaffAccount::where('staff_id', $idStaff)
                ->where('refresh_token', $cookie)
                ->whereRaw('EXTRACT(DAY FROM (expired_time-issued_at)) > 0')
                ->first();
            if (!$existRefreshToken) {
                return [
                    'code' => 401,
                    'status' => false,
                    'results' => 'CANCEL_SESSION',
                    'http' => 401
                ];
            }

            if (!$existRefreshToken['status'])
                return [
                    'code' => 403,
                    'status' => false,
                    'results' => 'account has been locked',
                    'http' => 403
                ];
            //cấp lại access token
            $role = AuthnController::searchRole($existRefreshToken['administration_id']);

            $addInfoUser = [
                'user_name' => $existRefreshToken['user_name'],
                'rank' => 'defined',
                'reservation' => true,
                'staff_id' => $existRefreshToken['staff_id'],
                'role' => $role->name
            ];
            $reissueAccessToken = Auth::claims($addInfoUser)->fromUser($existRefreshToken);
            return [
                'code' => 401,
                'status' => true,
                'results' => $reissueAccessToken,
                'http' => 200
            ];
        } catch (\Exception $e) {
            return false;
        }
    }
    public function resetPassword(Request $request)
    {
        $validation = [
            'staff_id' => 'required|exists:staff_account,staff_id',
            'user_name' => 'required|string|exists:staff_account,user_name',
            'password' => 'required|min:9|string',
        ];
        $attribute = [
            'staff_id' => 'Mã nhân viên',
            'user_name' => 'Tài khoản sử dụng',
            'password' => 'Mật khẩu ',
        ];
        try {
            $validator = validationHelpers::validation($request->all(), $validation, $attribute);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
            $resultSearch = $this->query->search('user_name', $request->post('user_name'))->first();
            if (!$resultSearch) {

                return CodeHttpHelpers::returnJson(401, false, 'Unauthorized', 401);
            }
            $staffAccount = [
                'password' => bcrypt($request->post('password')),
                'refresh_token' => null,
                'issued_at' => null,
                'expired_time' => null
            ];
            $result = $this->query->updateByUserName($staffAccount, $request->post('user_name'));
            if ($result) {
                return CodeHttpHelpers::returnJson(200, true, "Đổi mật khẩu thành công", 200);
            }
            return CodeHttpHelpers::returnJson(500, false, "error", 200);
        } catch (\Exception $error) {
            return CodeHttpHelpers::returnJson(500, false, $error, 500);
        }
    }
    //theo dõi sự đăng nhập
    public function statusChange($request, $id)
    {
        $idUser = $id;
        $ip = $request->ip();
        $versionBrowser = $request->header('User-Agent');

        if (count(Cache::get($this->KEY_CACHE)) > 0) {
            $numberPeople = Cache::get($this->KEY_CACHE);
            // kiểm tra id có tồn tại hay chưa
            $hasExisted = false;
            $exitsIp = false;
            $exitsVersion = false;
            $indexId = 0;
            $indexIp = 0;
            $indexVer = 0;
            foreach ($numberPeople as $key => $value) {
                if ($idUser == $value['id']) {
                    $hasExisted = true;
                    $indexId = $key;
                    foreach ($value['ip'] as $keyIp => $valueIP) {
                        if ($ip == $valueIP) {
                            $exitsIp = true;
                            $indexIp = $keyIp;
                            break;
                        }
                    }
                    foreach ($value['version_browser'] as $keyVer => $valueVer) {
                        if ($versionBrowser == $valueVer) {
                            $exitsVersion = true;
                            $indexIp = $keyVer;
                            break;
                        }
                    }
                    break;
                }
            }
            if ($hasExisted) {
                if (count($numberPeople[$indexId]['version_browser']) <= 1 && count($numberPeople[$indexId]['ip']) <= 1) {
                    unset($numberPeople[$key]);
                    Cache::put($this->KEY_CACHE, $numberPeople, null);
                    event(new AdminConnected($numberPeople));
                    return;
                }
                if ($exitsIp) {
                    if ($exitsVersion) {
                        if (count($numberPeople[$indexId]['version_browser']) > 1) {
                            array_splice($numberPeople[$indexId]['version_browser'], $indexVer, 1);
                        } else {
                            array_splice($numberPeople[$indexId]['version_browser'], $indexVer, 1);
                            array_splice($numberPeople[$indexId]['ip'], $indexIp, 1);
                        }
                        Cache::put($this->KEY_CACHE, $numberPeople, null);
                        event(new AdminConnected($numberPeople));
                    }
                }
            }
        } else {
            return;
        }
        return;
    }
    public static function searchRole($id)
    {
        $role = DB::table('administration')->select('name')->where('id', $id)->where('status', true)->first();
        if (!$role)
            return CodeHttpHelpers::returnJson(403, false, 'account has no permissions', 403);
        return $role;
    }
}
