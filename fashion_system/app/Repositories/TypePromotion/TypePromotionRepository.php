<?php
namespace App\Repositories\TypePromotion;

use App\Repositories\BaseRepositories;
use App\Models\TypePromotion;
use App\Repositories\TypePromotion\TypePromotionRepositoryInterface;


class TypePromotionRepository extends BaseRepositories implements TypePromotionRepositoryInterface{

    protected TypePromotion $typePromotion;
    public function __construct(TypePromotion $typePromotion)
    { 
        parent::__construct($typePromotion);
    }


 

}