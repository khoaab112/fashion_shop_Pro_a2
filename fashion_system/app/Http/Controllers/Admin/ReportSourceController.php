<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\ReportSource\ReportSourceRepository;


class ReportSourceController extends Controller
{
    //
    protected $reportSource;
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
}
