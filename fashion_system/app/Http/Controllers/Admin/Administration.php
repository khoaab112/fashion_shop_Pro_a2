<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\Administration\AdministrationRepository;

class Administration extends Controller
{
    //
    protected $administration;
    protected $validationRules = [
        'name' => 'required|unique:administration,name',
    ];
    protected   $attributeNames = [
        'name' => 'Tên',
    ];
    public function __construct(AdministrationRepository $administration)
    {
        $this->administration = $administration;
    }
    public function getRecords(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        try {
            if (!$request->input('record_number')) {
                $records = $this->administration->getRecordByPage($recordNumber, $page);
                if ($count) {
                    $totalRecord = $this->administration->count();
                    $result = [
                        'page' => $records,
                        'total_record' => $totalRecord,
                    ];
                    return CodeHttpHelpers::returnJson(200, true, $result, 200);
                }
                return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
            } else {
                $records = $this->administration->getAll();
                return CodeHttpHelpers::returnJson(200, true, $records, 200);
            }
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
}
