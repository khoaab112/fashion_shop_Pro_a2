<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Customers\CustomersRepository;
use App\Repositories\Rank\RankRepository;
use App\Helpers\CodeHttpHelpers;

class CustomerController extends Controller
{
    //
    protected $customer;
    protected $rank;
    public function __construct(CustomersRepository $customersRepository, RankRepository $rank)
    {
        $this->customer = $customersRepository;
        $this->rank = $rank;
    }
    public function getCustomers(Request $request)
    {
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        $dataRank = $this->rank->getAll();
        $records = $this->customer->getRecordByPage($recordNumber, $page);
        foreach ($records as &$record) {
            $record['full_name'] = $record['last_name']." ".$record["first_name"];
            foreach ($dataRank as $rank) {
                if ($rank['id'] === $record['rank_id']) {
                    $record['rank_name'] = $rank['name'];
                    break;
                }
            }
        }
        if ($count) {
            $totalRecord = $this->customer->count();
            $result = [
                'page' => $records,
                'total_record' => $totalRecord,
            ];
            return CodeHttpHelpers::returnJson(200, true, $result, 200);
        }
        return CodeHttpHelpers::returnJson(200, true, ['page' => $records], 200);
    }
}
