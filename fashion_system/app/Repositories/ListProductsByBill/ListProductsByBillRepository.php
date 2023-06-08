<?php
namespace App\Repositories\ListProductsByBill;

use App\Repositories\BaseRepositories;
use App\Models\ListProductsByBill;
use App\Repositories\ListProductsByBill\ListProductsByBillRepositoryInterface;


class ListProductsByBillRepository extends BaseRepositories implements ListProductsByBillRepositoryInterface{

    protected ListProductsByBill $listProductsByBill;
    public function __construct(ListProductsByBill $listProductsByBill)
    { 
        parent::__construct($listProductsByBill);
    }


 

}