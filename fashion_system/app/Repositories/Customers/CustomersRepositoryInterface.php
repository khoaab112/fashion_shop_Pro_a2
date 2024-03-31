<?php
namespace app\Repositories\Customers;

use App\Repositories\RepositoryInterface;

interface CustomersRepositoryInterface extends RepositoryInterface{
    public function removeRefreshToken($name);

}
