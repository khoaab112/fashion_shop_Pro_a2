<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\AdminsNotification\AdminsNotificationRepository;
use App\Helpers\CodeHttpHelpers;
use Illuminate\Support\Facades\Auth;

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
    public function getNotificationByIdStaff(Request $request)
    {
        $staffId = Auth::user()->staff_id;
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        try {
            $records = $this->notification->getRecordByPageConditional($recordNumber, $page, 'staff_id', $staffId);
            // if (!$records)
            //     return CodeHttpHelpers::returnJson(200, true, ['null' => 'Không có dữ liệu'], 200);
            if ($count) {
                $totalRecord = $this->notification->count();
                $result = [
                    'page' => $records,
                    'total_record' => $totalRecord,
                ];
                return CodeHttpHelpers::returnJson(200, true, $result, 200);
            }
            return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function deleteIn20DaysByStaff($id)
    {
    }
    public function createNotificationByIdStaff($data, $id)
    {
        try {
            $notification = [
                'type_notification' => $data['type_notification'],
                'staff_id' => $data['staff_id'],
                'content' => $data['content']
            ];
            $result = $this->notification->create($notification);

            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
}
