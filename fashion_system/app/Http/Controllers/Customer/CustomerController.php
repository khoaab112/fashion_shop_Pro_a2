<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repositories\Customers\CustomersRepository;
use App\Helpers\CodeHttpHelpers;

class CustomerController extends Controller
{
    //
    protected $customer;
    public function __construct(CustomersRepository $customersRepository)
    {
        $this->customer = $customersRepository;
    }
    public function getCustomers(Request $request){
        $recordNumber = $request->input('record_number', 10);
        $page = $request->input('page', 1);
        $count = $request->input('count') === 'true';
        $records = $this->customer->getRecordByPage($recordNumber, $page);
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
