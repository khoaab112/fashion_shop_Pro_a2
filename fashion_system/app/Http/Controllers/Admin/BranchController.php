<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Branch\BranchRepository;
use App\Helpers\CodeHttpHelpers;


class BranchController extends Controller
{
    protected $branch;

    protected $validationRules = [
        'name' => 'required|unique:branch,name',
        'address' => 'required|unique:branch,address',
    ];

    protected   $attributeNames = [
        'name' => 'Tên chi nhánh',
        'address' => 'Địa chỉ',
    ];
    public function __construct(BranchRepository $branch)
    {

        $this->branch = $branch;
    }
    public function getBranchById($id)
    {
        $branchInfo = $this->branch->getById($id)->first();
        if (!$branchInfo) {
            return CodeHttpHelpers::returnJson(204, false, null, 200);
        }
        return CodeHttpHelpers::returnJson(200, true, $branchInfo, 200);
    }
    public function getListBranches(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        if (!$request->input('record_number')) {
            try {
                $records = $this->branch->getRecordByPage($recordNumber, $page);
                if ($count) {
                    $totalRecord = $this->branch->count();
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
        } else {
            try {
                $records = $this->branch->getAll();
                return CodeHttpHelpers::returnJson(200, true, $records, 200);
            } catch (\Exception $e) {
                return CodeHttpHelpers::returnJson(500, false, $e, 500);
            }
        }
    }
}
