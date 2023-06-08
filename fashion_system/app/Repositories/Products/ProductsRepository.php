<?php
namespace App\Repositories\Products;

use App\Repositories\BaseRepositories;
use App\Models\Products;
use App\Repositories\Products\ProductsRepositoryInterface;


class ProductsRepository extends BaseRepositories implements ProductsRepositoryInterface{

    protected Products $products;
    public function __construct(Products $products)
    { 
        parent::__construct($products);
    }


 

}