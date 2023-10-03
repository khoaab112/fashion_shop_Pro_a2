<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\TypeReport\TypeReportRepository;
use Illuminate\Support\Facades\Log;


class TypeReportController extends Controller
{
    //
    protected $typeReport;
    protected $validationRules = [
        'name' => 'required|unique:type_report,name',
        'code' => 'required|unique:type_report,code',
        'note' => 'required|string',
        'status' => 'required|boolean',
    ];

    protected   $attributeNames = [
        'name' => 'Tên',
        'code' => 'Mã',
        'note' => 'Ghi chú',
        'status' => 'Trạng thái',
    ];
    public function __construct(TypeReportRepository $typeReport)
    {
        $this->typeReport = $typeReport;
    }
    public function createsTypeReport(Request $request)
    {
        $arrayData = $request->input();
        foreach ($arrayData as $val) {
            $validator = validationHelpers::validation($val, $this->validationRules, $this->attributeNames);
            if ($validator->fails()) {
                $errors = $validator->errors();
                return CodeHttpHelpers::returnJson(400, false, $errors, 200);
            }
        }
        try {
            $result = $this->typeReport->creates($arrayData);
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
            $records = $this->typeReport->getRecordByPage($recordNumber, $page);
            if ($count) {
                $totalRecord = $this->typeReport->count();
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
            $search = $this->typeReport->getById($id)->first();
            if (!$search) {
                return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
            }
            $status = !($search->status);
            $resultChange = $this->typeReport->statusChange($id, $status);
            if (!$resultChange)  return CodeHttpHelpers::returnJson(400, false, 'Thay đổi trạng thái thất bại', 200);
            return CodeHttpHelpers::returnJson(200, true, 'Cập nhật thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function deleteRecord($id)
    {
        try {
            $search = $this->typeReport->getById($id)->first();
            if (!$search) {
                return CodeHttpHelpers::returnJson(204, false, 'Mã không tồn tại', 200);
            }
            $resultDelete = $this->typeReport->deleteById($id);
            if (!$resultDelete)  return CodeHttpHelpers::returnJson(400, false, 'Xóa thất bại', 200);
            return CodeHttpHelpers::returnJson(200, true, 'Xóa thành công', 200);
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
