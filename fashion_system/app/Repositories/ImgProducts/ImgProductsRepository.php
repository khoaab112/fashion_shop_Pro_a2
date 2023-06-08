<?php
namespace App\Repositories\ImgProducts;

use App\Repositories\BaseRepositories;
use App\Models\ImgProducts;
use App\Repositories\ImgProducts\ImgProductsRepositoryInterface;


class ImgProductsRepository extends BaseRepositories implements ImgProductsRepositoryInterface{

    protected ImgProducts $imgProducts;
    public function __construct(ImgProducts $imgProducts)
    { 
        parent::__construct($imgProducts);
    }


 

}