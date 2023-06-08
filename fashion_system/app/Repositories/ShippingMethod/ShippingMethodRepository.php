<?php
namespace App\Repositories\ShippingMethod;

use App\Repositories\BaseRepositories;
use App\Models\ShippingMethod;
use App\Repositories\ShippingMethod\ShippingMethodRepositoryInterface;


class ShippingMethodRepository extends BaseRepositories implements ShippingMethodRepositoryInterface{

    protected ShippingMethod $shippingMethod;
    public function __construct(ShippingMethod $shippingMethod)
    { 
        parent::__construct($shippingMethod);
    }


 

}