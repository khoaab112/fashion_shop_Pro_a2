<?php

namespace App\Http\Controllers\Broadcasting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Events\AdminConnected;
use Illuminate\Support\Facades\Log;
class AdminConnectManagementController extends Controller
{
    //

    public function userConnected(Request $request)
    {

        // Log::info('Showing user profile for user: ');

        // Phát sự kiện từ máy chủ
        event(new AdminConnected('aa'));

        // Các xử lý khác khi người dùng kết nối vào ứng dụng
    }

}
