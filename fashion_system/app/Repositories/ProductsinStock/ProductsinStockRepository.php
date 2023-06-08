<?php
namespace App\Repositories\ProductsinStock;

use App\Repositories\BaseRepositories;
use App\Models\ProductsInStock;
use App\Repositories\ProductsinStock\ProductsinStockRepositoryInterface;


class ProductsinStockRepository extends BaseRepositories implements ProductsinStockRepositoryInterface{

    protected ProductsInStock $productsInStock;
    public function __construct(ProductsInStock $productsInStock)
    { 
        parent::__construct($productsInStock);
    }


 

}