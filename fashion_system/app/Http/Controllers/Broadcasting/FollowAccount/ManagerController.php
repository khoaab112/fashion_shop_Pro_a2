<?php

namespace App\Http\Controllers\Broadcasting\FollowAccount;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Helpers\CodeHttpHelpers;
use App\Events\AdminConnected;

class ManagerController extends Controller
{
    private $KEY_CACHE = "numberOfActivePeople";
    public function followAccountAdmin(Request $request)
    {
        $ip = $request->ip();
        $versionBrowser = $request->header('User-Agent');
        $user = $request->input();
        // $user->ip=$request->ip();
        // $user->version_browser=$request->header('User-Agent');
        if (Cache::get($this->KEY_CACHE)) {
            $numberPeople = Cache::get($this->KEY_CACHE);
            // kiểm tra id có tồn tại hay chưa
            $hasExisted = false;
            $exitsIp = false;
            $exitsVersion = false;
            foreach ($numberPeople as $item) {
                if ($user['id'] == $item['id']) {
                    if ($ip == $item['ip']) {
                        foreach ($item['ip'] as $valueIP) {
                            if ($ip == $valueIP) {
                                $exitsIp = true;
                                break;
                            }
                        }
                        foreach ($item['version_browser'] as $valueVer) {
                            if ($versionBrowser == $valueVer) {
                                $exitsVersion = true;
                                break;
                            }
                        }
                        $hasExisted = true;
                        break;
                    }
                }
            }
            //nếu chưa tồn tại id người dùng
            if (!$hasExisted) {
                $user->ip = array($request->ip());
                $user->version_browser = array($request->header('User-Agent'));
                $numberPeople[] = $user;
                Cache::put($this->KEY_CACHE, $numberPeople, null);
                event(new AdminConnected($numberPeople));
            }
            //nếu đẫ tồn tại rồi
            if ($hasExisted) {
                if ($exitsIp) {
                    if ($exitsVersion) {
                    } else {
                        $index = array_search($user['id'], array_column($numberPeople, 'id'));
                        // Push thêm phần tử vào mảng add của phần tử có index = $index
                        $numberPeople[$index]['version_browser'][] = $versionBrowser;
                        //cần thêm chú thích là thay đổi chỗ nào
                        event(new AdminConnected($numberPeople));
                    }
                } else {
                    $index = array_search($user['id'], array_column($numberPeople, 'id'));
                    $numberPeople[$index]['version_browser'][] = $versionBrowser;
                    $numberPeople[$index]['ip'][] = $ip;
                    //cần thêm chú thích là thay đổi chỗ nào
                    event(new AdminConnected($numberPeople));
                }
            }
        } else {
            $user->ip = array($request->ip());
            $user->version_browser = array($request->header('User-Agent'));
            $numberPeople[] = $user;
            Cache::put($this->KEY_CACHE, $numberPeople, null);
            event(new AdminConnected($numberPeople));
        }
        return CodeHttpHelpers::returnJson(200, true, 'gửi thành công', 200);
    }
    public function statusChange($id)
    {
        $idUser = $id;
        if (Cache::get($this->KEY_CACHE)) {
            $numberPeople = Cache::get($this->KEY_CACHE);
            // kiểm tra id có tồn tại hay chưa

            foreach ($numberPeople as $key => $value) {
                if ($idUser == $value['id']) {
                    unset($numberPeople[$key]);
                    Cache::put($this->KEY_CACHE, $numberPeople, null);
                    event(new AdminConnected($numberPeople));
                    break;
                }
            }
        } else {
            return CodeHttpHelpers::returnJson(200, true, 'gửi thành công', 200);
        }
        return CodeHttpHelpers::returnJson(200, true, 'gửi thành công', 200);
    }
    public function get()
    {
        dd(Cache::get($this->KEY_CACHE));
    }
}
