<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\TypeReport\TypeReportRepository;

class TypeReportController extends Controller
{
    //
    protected $typeReport;
    protected $validationRules = [
        'name' => 'required|unique:type_report,name',
        'note' => 'required|string',
        'status' => 'required|boolean',
    ];

    protected   $attributeNames = [
        'name' => 'Tên',
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
    public function getRecords($paging)
    {
        $count = $this->typeReport->pagingRecord($paging);
        dd($count);
    }
}
