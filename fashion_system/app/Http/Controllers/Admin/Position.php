<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\CodeHttpHelpers;
use App\Helpers\validationHelpers;
use App\Repositories\Position\PositionRepository;

use Revolution\Google\Sheets\Facades\Sheets;

class Position extends Controller
{
    //
    protected $position;
    protected $validationRules = [
        'name' => 'required|unique:position,name',
    ];

    protected   $attributeNames = [
        'name' => 'Tên',
    ];
    public function __construct(PositionRepository $position)
    {
        $this->position = $position;
    }
    public function getRecords(Request $request)
    {
        try {
            if ($request->input('record_number')) {
                $recordNumber = $request->input('record_number', 10);
                $page = $request->input('page', 1);
                $count = $request->input('count') === 'true';
                $records = $this->position->getRecordByPage($recordNumber, $page);
                if ($count) {
                    $totalRecord = $this->position->count();
                    $result = [
                        'page' => $records,
                        'total_record' => $totalRecord,
                    ];
                    return CodeHttpHelpers::returnJson(200, true, $result, 200);
                }
                return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
            } else {
                $records = $this->position->getAll();
                return CodeHttpHelpers::returnJson(200, true, $records, 200);
            }
        } catch (\Exception $e) {
            return CodeHttpHelpers::returnJson(500, false, $e, 500);
        }
    }
    public function test()
    {
        $sheet_id = '1o0Zp3M-XaMt8H2XIYxUAsfFmnmBOs4jAzYCGgAazkJs';
        $sheetName = 'demo';

            // get data
        $data = Sheets::spreadsheet($sheet_id)->sheet($sheetName)->all();
        dd($data);
        // ghi dữ liệu

        // $arr = [
        //     ['1', '2', 'kas', '32', '123', '123kha']
        // ];
        // $data = Sheets::spreadsheet($sheet_id)->sheet($sheetName)->update('A1', $arr);
        // dd($data);
    }
}
