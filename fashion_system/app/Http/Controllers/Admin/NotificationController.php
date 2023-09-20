<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\AdminsNotification\AdminsNotificationRepository;
use App\Helpers\CodeHttpHelpers;

class NotificationController extends Controller
{
    //
    protected $notification;

    public function __construct(AdminsNotificationRepository $notification)
    {
        $this->notification = $notification;
    }
    //lấy thông báo theo id lấy 20 thông báo 1 lần
    //xóa các thông báo khi quá time
    //push thông báo  theo id , kết hợp với loại thông báo
    public function getNotificationByIdStaff($id)
    {

    }
    public function deleteIn20DaysByStaff($id)
    {

    }
    public function createNotificationByIdStaff($id)
    {

    }


}
