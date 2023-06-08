<?php
namespace App\Repositories\Promotion;

use App\Repositories\BaseRepositories;
use App\Models\Promotion;
use App\Repositories\Promotion\PromotionRepositoryInterface;


class PromotionRepository extends BaseRepositories implements PromotionRepositoryInterface{

    protected Promotion $promotion;
    public function __construct(Promotion $promotion)
    { 
        parent::__construct($promotion);
    }


 

}