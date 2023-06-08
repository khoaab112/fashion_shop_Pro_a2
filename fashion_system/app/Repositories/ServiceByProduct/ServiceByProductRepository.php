<?php
namespace App\Repositories\ServiceByProduct;

use App\Repositories\BaseRepositories;
use App\Models\ServiceByProduct;
use App\Repositories\ServiceByProduct\ServiceByProductRepositoryInterface;


class ServiceByProductRepository extends BaseRepositories implements ServiceByProductRepositoryInterface{

    protected ServiceByProduct $serviceByProduct;
    public function __construct(ServiceByProduct $serviceByProduct)
    { 
        parent::__construct($serviceByProduct);
    }


 

}