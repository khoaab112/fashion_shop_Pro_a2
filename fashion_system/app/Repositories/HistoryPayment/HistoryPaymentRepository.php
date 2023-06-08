<?php
namespace App\Repositories\HistoryPayment;

use App\Repositories\BaseRepositories;
use App\Models\HistoryPayment;
use App\Repositories\HistoryPayment\HistoryPaymentRepositoryInterface;


class HistoryPaymentRepository extends BaseRepositories implements HistoryPaymentRepositoryInterface{

    protected HistoryPayment $historyPayment;
    public function __construct(HistoryPayment $historyPayment)
    { 
        parent::__construct($historyPayment);
    }


 

}