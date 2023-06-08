<?php
namespace App\Repositories\AccountCustomer;

use App\Repositories\BaseRepositories;
use App\Models\AccountCustomers;
use App\Repositories\AccountCustomer\AccountCustomerRepositoryInterface;


class AccountCustomersRepository extends BaseRepositories implements AccountCustomerRepositoryInterface{

    protected AccountCustomers $accountCustomers;
    public function __construct(AccountCustomers $accountCustomers)
    { 
        parent::__construct($accountCustomers);
    }


 

}