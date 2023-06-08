<?php
namespace App\Repositories\Ads;

use App\Repositories\BaseRepositories;
use App\Models\Ads;
use App\Repositories\Ads\AdsRepositoryInterface;


class AdsRepository extends BaseRepositories implements AdsRepositoryInterface{

    protected Ads $ads;
    public function __construct(Ads $ads)
    { 
        parent::__construct($ads);
    }


 

}