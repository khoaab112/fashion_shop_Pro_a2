<?php
namespace App\Repositories\Customers;

use App\Repositories\BaseRepositories;
use App\Models\Customers;
use App\Repositories\Customers\CustomersRepositoryInterface;


class CustomersRepository extends BaseRepositories implements CustomersRepositoryInterface{

    protected Customers $customers;
    public function __construct(Customers $customers)
    {
        $this->customers = $customers;
        parent::__construct($customers);
    }
    public function removeRefreshToken($id)
    {
        return $this->customers->where('id', $id)->update(['refresh_token'=>null,'issued_at'=>null,'expired_time'=>null]);
    }

}
