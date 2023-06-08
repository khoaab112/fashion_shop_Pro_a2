<?php
namespace App\Repositories\Bill;

use App\Repositories\BaseRepositories;
use App\Models\Bill;
use App\Repositories\Bill\BillRepositoryInterface;


class BillRepository extends BaseRepositories implements BillRepositoryInterface{

    protected Bill $bill;
    public function __construct(Bill $bill)
    { 
        parent::__construct($bill);
    }


 

}