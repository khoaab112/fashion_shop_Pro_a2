<?php

namespace App\Http\Controllers\Broadcasting\FollowAccount;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use App\Helpers\CodeHttpHelpers;

class ManagerController extends Controller
{

    public function followAccountAdmin(Request $request)
    {
        CodeHttpHelpers::returnJson(200, true, 'gửi thành công', 200);
        if (Cache::get('numberOfActivePeople'));
        $numberPeople = Cache::get('numberOfActivePeople');
        $numberPeople = 0;
        $user= $request;
        // nhận id , tên , địa chỉ ảnh
        // kiểm tra id có tồn tại hay chưa

    }
}
