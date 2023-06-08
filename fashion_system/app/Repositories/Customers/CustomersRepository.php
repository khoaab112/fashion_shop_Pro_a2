<?php
namespace App\Repositories\Customers;

use App\Repositories\BaseRepositories;
use App\Models\Customers;
use App\Repositories\Customers\CustomersRepositoryInterface;


class CustomersRepository extends BaseRepositories implements CustomersRepositoryInterface{

    protected Customers $customers;
    public function __construct(Customers $customers)
    { 
        parent::__construct($customers);
    }


 

}