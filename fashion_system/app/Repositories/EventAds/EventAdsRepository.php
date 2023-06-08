<?php
namespace App\Repositories\EventAds;

use App\Repositories\BaseRepositories;
use App\Models\EventAds;
use App\Repositories\EventAds\EventAdsRepositoryInterface;


class EventAdsRepository extends BaseRepositories implements EventAdsRepositoryInterface{

    protected EventAds $eventAds;
    public function __construct(EventAds $eventAds)
    { 
        parent::__construct($eventAds);
    }


 

}