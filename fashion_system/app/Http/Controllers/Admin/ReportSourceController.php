<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\ReportSource\ReportSourceRepository;
use App\Http\Controllers\Admin\NotificationController;
use Illuminate\Support\Facades\Auth;

class ReportSourceController extends Controller
{
    //
    protected $reportSource;
    protected $validationRules = [
        'name' => 'required|unique:report_source,name',
        'note' => 'required|string',
        'status' => 'required|boolean',
    ];

    protected   $attributeNames = [
        'name' => 'Tên',
        'note' => 'Ghi chú',
        'status' => 'Trạng thái',
    ];
    public function __construct(ReportSourceRepository $reportSource)
    {
        $this->reportSource = $reportSource;
    }
    public function createsReportSource(Request $request)
    {
        $arrayData = $request->input();
        foreach ($arrayData as $val) {
            $validator = validationHelpers::validation($val, $this->validationRules, $this->attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors();
                $staffId = Auth::user()->staff_id;
                $dataNotification = [
                    'type_notification' => 2,
                    'staff_id' => $staffId,
                    'content' => json_encode($errors)
                ];
                $notificationController = app(NotificationController::class);
                $notificationController->createNotificationByIdStaff($dataNotification);
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
        }
        try {
            $result = $this->reportSource->creates($arrayData);
            if ($result) return CodeHttpHelpers::returnJson(200, true, "Thêm thành công", 200);
            return CodeHttpHelpers::returnJson(500, false, "Cập nhật không thành công", 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function getRecords(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        try {
            $records = $this->reportSource->getRecordByPage($recordNumber, $page);
            if ($count) {
                $totalRecord = $this->reportSource->count();
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
    public function changeStatus(Request $request)
    {
        $id = $request->id;
        try {
            $search = $this->reportSource->getById($id)->first();
            if (!$search) {
                return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
            }
            $status = !($search->status);
            $resultChange = $this->reportSource->statusChange($id, $status);
            if (!$resultChange)  return CodeHttpHelpers::returnJson(400, false, 'Thay đổi trạng thái thất bại', 200);
            return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
