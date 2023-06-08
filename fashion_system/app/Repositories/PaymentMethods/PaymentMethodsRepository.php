<?php
namespace App\Repositories\PaymentMethods;

use App\Repositories\BaseRepositories;
use App\Models\PaymentMethods;
use App\Repositories\PaymentMethods\PaymentMethodsRepositoryInterface;


class PaymentMethodsRepository extends BaseRepositories implements PaymentMethodsRepositoryInterface{

    protected PaymentMethods $paymentMethods;
    public function __construct(PaymentMethods $paymentMethods)
    { 
        parent::__construct($paymentMethods);
    }


 

}