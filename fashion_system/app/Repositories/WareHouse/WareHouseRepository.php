<?php
namespace App\Repositories\WareHouse;

use App\Repositories\BaseRepositories;
use App\Models\Warehouse;
use App\Repositories\WareHouse\WareHouseRepositoryInterface;


class WareHouseRepository extends BaseRepositories implements WareHouseRepositoryInterface{

    protected Warehouse $warehouse;
    public function __construct(Warehouse $warehouse)
    { 
        parent::__construct($warehouse);
    }


 

}