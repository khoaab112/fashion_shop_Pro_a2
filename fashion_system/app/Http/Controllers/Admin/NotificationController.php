<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\AdminsNotification\AdminsNotificationRepository;
use App\Helpers\CodeHttpHelpers;
use Illuminate\Support\Facades\Auth;
use App\Events\MessageNotification;
use Illuminate\Support\Facades\DB;

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

            // $records = $this->notification->getRecordByPageConditional($recordNumber, $page, 'staff_id', $staffId);
            $records = DB::table('admins_notification')
                ->leftJoin(
                    'type_notification',
                    'admins_notification.type_notification',
                    '=',
                    'type_notification.id'
                )
                ->select(
                    'type_notification.name',
                    'type_notification.color',
                    'admins_notification.id',
                    'admins_notification.staff_id',
                    'admins_notification.content',
                    'admins_notification.watched',
                    'admins_notification.created_at',
                    'admins_notification.updated_at'
                )
                ->where(
                    'admins_notification.staff_id',
                    '=',
                    $staffId
                )
                ->where(
                    'admins_notification.status',
                    '=',
                    true
                )
                ->orderByDesc('admins_notification.id')
                ->paginate($recordNumber, ['*'], 'page', $page)->items();

            // if (!$records)
            //     return CodeHttpHelpers::returnJson(200, true, ['null' => 'Không có dữ liệu'], 200);
            if ($count) {
                $conditions = [
                    ['staff_id', '=', $staffId]
                ];
                $totalRecord = $this->notification->countByConditions($conditions);
                $result = [
                    'notification' => $records,
                    'total_record' => $totalRecord,
                ];
                return CodeHttpHelpers::returnJson(200, true, $result, 200);
            }
            return CodeHttpHelpers::returnJson(200, true, ['notification' => $records], 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    //kiểm tra thông báo nào chưa được đọc
    public function CheckForUnreadNotifications($staffId)
    {
        $arrCondition = [
            ['watched', '=', false,],
            ['staff_id', '=', $staffId,]
        ];
        try {
            $records = $this->notification->getDataAccordingToConditions($arrCondition);
            return CodeHttpHelpers::returnJson(200, true, count($records), 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, 'Lỗi hệ thống', 500);
        }
    }
    public function deleteIn20DaysByStaff($id)
    {
    }
    // public function test(Request $request)
    // {
    //     $this->createNotificationByIdStaff($request);
    // }
    public  function  createNotificationByIdStaff($data)
    {
        //type_notification
        /*
        id|name            |code    |color |note
        --+----------------+--------+------+---------------------------------------------------------------------------------
         2|Hệ thống báo lỗi|SYSTEM  |ff0000|hệ thống gửi thông báo lỗi dành cho người dùng
         1|Thông báo       |EVENT   |F4E869|thống gửi từ hệ thống cho người dùng về các sự kiện mà người quản lý chủ động gửi
         3|Người dùng      |CUSTOMER|3085C3|Thông báo từ người dùng , người dùng gửi thông báo đến người dùng
         7|Cảnh báo        |WARNING |E9B824|gửi cảnh báo cho người dùng
         6|Gửi             |SEND    |28a745|gửi tin nhắn , phản hồi cho khách hàng thành công
         5|Phản hồi        |RESPONSE|6c757d|Phản hồi từ những ý kiễn phản hồi cho khách hàng
         */
        $code = $data['code'];
        $resultCode = DB::table('type_notification')->select('id')->where('code', $code)->where('status',true)->first();
        try {
            $notification = [
                'type_notification' =>$resultCode->id,
                'staff_id' => $data['staff_id'],
                'content' => $data['content']
            ];
            $result = $this->notification->create($notification);
            $this->sendNotificationNew($result->id);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
    public function sendNotificationNew($idRecordNew)
    {
        $NotificationNew = DB::table('admins_notification')
            ->leftJoin(
                'type_notification',
                'admins_notification.type_notification',
                '=',
                'type_notification.id'
            )
            ->select(
                'type_notification.name',
                'type_notification.color',
                'admins_notification.staff_id',
                'admins_notification.content',
                'admins_notification.watched',
                'admins_notification.created_at',
                'admins_notification.updated_at'
            )
            ->where(
                'admins_notification.status',
                '=',
                true
            )
            ->where(
                'admins_notification.watched',
                '=',
                false
            )
            ->where(
                'admins_notification.id',
                '=',
                $idRecordNew
            )
            ->first();
        event(new MessageNotification($NotificationNew));
    }
    public function changeWatchedStatus($staff_id)
    {
        $changeWatched = DB::table('admins_notification')
            ->where('staff_id', $staff_id)
            ->update(['watched' => true]);
        if ($changeWatched)
            return CodeHttpHelpers::returnJson(200, true, 'Thành công', 200);
        return CodeHttpHelpers::returnJson(500, false, 'Lỗi hệ thống', 500);
    }
    public function changeWatchedStatusByID(Request $request)
    {
        $changeWatched = DB::table('admins_notification')
            ->whereIn('id', $request['arr_id'])
            ->update(['watched' => true]);
        if ($changeWatched)
            return CodeHttpHelpers::returnJson(200, true, 'Thành công', 200);
        return CodeHttpHelpers::returnJson(500, false, 'Lỗi hệ thống', 500);
    }
}
