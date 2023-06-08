<?php
namespace App\Repositories\PriceDifference;

use App\Repositories\BaseRepositories;
use App\Models\PriceDifference;
use App\Repositories\PriceDifference\PriceDifferenceRepositoryInterface;


class PriceDifferenceRepository extends BaseRepositories implements PriceDifferenceRepositoryInterface{

    protected PriceDifference $priceDifference;
    public function __construct(PriceDifference $priceDifference)
    { 
        parent::__construct($priceDifference);
    }


 

}