<?php
namespace App\Repositories\CommentsProduct;

use App\Repositories\BaseRepositories;
use App\Models\CommentsProduct;
use App\Repositories\CommentsProduct\CommentsProductRepositoryInterface;


class CommentsProductRepository extends BaseRepositories implements CommentsProductRepositoryInterface{

    protected CommentsProduct $commentsProduct;
    public function __construct(CommentsProduct $commentsProduct)
    { 
        parent::__construct($commentsProduct);
    }


 

}